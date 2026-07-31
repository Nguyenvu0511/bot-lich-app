import os
import sys
import logging
import asyncio
import base64
import hashlib
import json
import httpx
from datetime import datetime, timezone, timedelta
from playwright.async_api import async_playwright, TimeoutError as PlaywrightTimeoutError

class MaintenanceError(Exception):
    """Ngoại lệ xảy ra khi hệ thống MyDTU đang bảo trì hoặc sao lưu dữ liệu."""
    pass


# Đảm bảo mã hóa UTF-8 khi chạy trên terminal Windows
if sys.platform.startswith('win'):
    try:
        sys.stdout.reconfigure(encoding='utf-8')
    except AttributeError:
        pass

# Tải cấu hình từ file .env nếu chạy cục bộ (Local)
try:
    from dotenv import load_dotenv
    load_dotenv()
except ImportError:
    pass

# Cấu hình logging
logging.basicConfig(
    format="%(asctime)s - %(name)s - %(levelname)s - %(message)s",
    level=logging.INFO
)
logger = logging.getLogger("TimetableBot")

# Lấy các biến cấu hình
MYDTU_USER = os.getenv("MYDTU_USER")
MYDTU_PASS = os.getenv("MYDTU_PASS")
GEMINI_API_KEY = os.getenv("GEMINI_API_KEY")
TELEGRAM_TOKEN = os.getenv("TELEGRAM_TOKEN")
TELEGRAM_CHAT_ID = os.getenv("TELEGRAM_CHAT_ID")

async def solve_captcha_via_gemini(base64_image: str, api_key: str) -> str:
    """
    Gửi ảnh Captcha dạng Base64 lên Google Gemini API để giải mã.
    Hỗ trợ thử lại và hoãn (retry & backoff) khi gặp lỗi giới hạn tần suất (Rate Limit).
    """
    MODEL_NAME = "gemini-flash-latest"
    url = f"https://generativelanguage.googleapis.com/v1beta/models/{MODEL_NAME}:generateContent?key={api_key}"

    payload = {
        "contents": [{
            "parts": [
                {
                    "text": "Read the text in this CAPTCHA. Return ONLY the characters (letters/numbers). No spaces, no punctuation, convert to uppercase."
                },
                {
                    "inline_data": {
                        "mime_type": "image/png",
                        "data": base64_image
                    }
                }
            ]
        }]
    }

    headers = {"Content-Type": "application/json"}

    for attempt in range(1, 4):
        try:
            async with httpx.AsyncClient() as client:
                response = await client.post(url, json=payload, headers=headers, timeout=15.0)
                
                if response.status_code == 429:
                    logger.warning(f"[Lần thử {attempt}/3] AI giới hạn tần suất. Đang chờ 15s...")
                    if attempt < 3:
                        await asyncio.sleep(15)
                        continue
                    else:
                        raise Exception("Gemini API trả về lỗi 429 sau 3 lần thử.")
                
                if response.status_code != 200:
                    raise Exception(f"Gemini API báo lỗi {response.status_code}: {response.text}")
                    
                data = response.json()
                if "error" in data:
                    err_msg = data["error"]["message"]
                    if "quota" in err_msg.lower() or "rate limit" in err_msg.lower() or "resource exhausted" in err_msg.lower():
                        logger.warning(f"[Lần thử {attempt}/3] AI báo quá tải: {err_msg}. Đang chờ 15s...")
                        if attempt < 3:
                            await asyncio.sleep(15)
                            continue
                    raise Exception(err_msg)
                    
                if data.get("candidates") and data["candidates"][0].get("content"):
                    text = data["candidates"][0]["content"]["parts"][0]["text"]
                    return text.strip().replace(" ", "").replace("\n", "").upper()
                else:
                    raise Exception("Không thể trích xuất nội dung từ Gemini API.")
                    
        except httpx.HTTPError as he:
            logger.warning(f"[Lần thử {attempt}/3] Lỗi kết nối HTTP: {he}")
            if attempt < 3:
                await asyncio.sleep(15)
                continue
            raise he
        except Exception as e:
            err_str = str(e).lower()
            if "quota" in err_str or "rate limit" in err_str or "429" in err_str or "resource exhausted" in err_str:
                logger.warning(f"[Lần thử {attempt}/3] Lỗi quá tải AI: {e}. Đang chờ 15s...")
                if attempt < 3:
                    await asyncio.sleep(15)
                    continue
            raise e

def is_valid_schedule_item(raw_info: str) -> bool:
    """
    Lọc bỏ các tiêu đề menu, tên tab và các ngày tháng đơn thuần không chứa môn học.
    """
    text_lower = raw_info.lower().strip()
    
    # Bỏ qua các chuỗi trùng khớp với tiêu đề menu/tab
    ignored_keywords = [
        "lịch học | lịch cá nhân",
        "lịch cá nhân",
        "lịch học",
        "lịch thi",
        "xem lịch học",
        "trang chủ",
        "thông báo",
        "đăng xuất"
    ]
    if text_lower in ignored_keywords:
        return False
        
    # Bỏ qua các dòng chỉ chứa ngày tháng mà không có môn học/tiết/phòng (Ví dụ: "Thứ bảy, ngày 1 tháng 8 năm 2026")
    if text_lower.startswith("thứ") and "ngày" in text_lower and "năm" in text_lower:
        if not any(k in text_lower for k in ["tiết", "phòng", "môn", "lớp", "mã", "học phần", "tín chỉ"]):
            return False

    return True

class DTUScraper:
    """
    Lớp cào dữ liệu từ MyDTU, tự động đăng nhập và vượt Captcha bằng Gemini.
    """
    def __init__(self, username=MYDTU_USER, password=MYDTU_PASS, gemini_key=GEMINI_API_KEY):
        self.username = username
        self.password = password
        self.gemini_key = gemini_key
        self.login_url = "https://mydtu.duytan.edu.vn/Signin.aspx"
        self.timetable_url = "https://mydtu.duytan.edu.vn/sites/index.aspx?p=home_timetable&functionid=13"

    async def login(self, page) -> bool:
        """
        Đăng nhập vào cổng MyDTU.
        """
        logger.info(f"Đang điều hướng tới trang đăng nhập: {self.login_url}")
        await page.goto(self.login_url, wait_until="load", timeout=40000)

        # Kiểm tra trạng thái bảo trì hoặc sao lưu dữ liệu của MyDTU
        body_element = await page.query_selector("body")
        if body_element:
            body_text = await body_element.inner_text()
            if any(k in body_text.lower() for k in ["sao lưu dữ liệu", "under construction", "bảo trì"]):
                logger.warning("⚠️ Cổng thông tin MyDTU hiện đang bảo trì hoặc sao lưu dữ liệu.")
                raise MaintenanceError("MyDTU đang bảo trì hoặc sao lưu dữ liệu.")

        # Ẩn các quảng cáo và popup phiền phức
        await page.add_style_tag(content=".darkness, #popout, #adbox { display: none !important; }")

        login_success = False
        for attempt in range(1, 4):
            logger.info(f"--- Đăng nhập MyDTU - Lần thử {attempt}/3 ---")
            
            await page.fill("input#txtUser", self.username)
            await page.fill("input#txtPass", self.password)

            captcha_element = await page.query_selector('#UpdatePanel1 img, img[src*="CaptchaImage.axd"]')
            if not captcha_element:
                logger.error("Không tìm thấy ảnh Captcha trên trang đăng nhập.")
                return False

            captcha_bytes = await captcha_element.screenshot()
            base64_image = base64.b64encode(captcha_bytes).decode('utf-8')

            try:
                captcha_code = await solve_captcha_via_gemini(base64_image, self.gemini_key)
                logger.info(f"Gemini giải mã Captcha thành công: {captcha_code}")
            except Exception as ge:
                logger.warning(f"Lỗi khi giải captcha: {ge}. Đang tải lại trang...")
                await page.reload(wait_until="load")
                await page.add_style_tag(content=".darkness, #popout, #adbox { display: none !important; }")
                continue

            await page.fill("input#txtCaptcha", captcha_code)
            await page.click("input#btnLogin1")

            # Chờ trang chuyển hướng sang index.aspx
            try:
                await page.wait_for_url("**/index.aspx*", timeout=15000)
                login_success = True
                break
            except PlaywrightTimeoutError:
                # Chụp ảnh màn hình lỗi để debug trực quan
                screenshot_path = f"login_fail_attempt_{attempt}.png"
                try:
                    await page.screenshot(path=screenshot_path)
                    logger.info(f"Đã chụp ảnh màn hình lỗi tại: {screenshot_path}")
                except Exception as se:
                    logger.warning(f"Không thể chụp ảnh màn hình: {se}")

                # Kiểm tra xem có phải trang web chuyển sang trang bảo trì/sao lưu hay không
                body_element = await page.query_selector("body")
                if body_element:
                    body_text = await body_element.inner_text()
                    if any(k in body_text.lower() for k in ["sao lưu dữ liệu", "under construction", "bảo trì"]):
                        logger.warning("⚠️ Phát hiện MyDTU đã chuyển sang trang bảo trì hoặc sao lưu dữ liệu.")
                        raise MaintenanceError("MyDTU đang bảo trì hoặc sao lưu dữ liệu.")

                error_element = await page.query_selector("span#lbMessage")
                if error_element:
                    error_text = (await error_element.inner_text()).strip()
                    if error_text:
                        logger.warning(f"Đăng nhập không thành công: {error_text}")
                        if "mật khẩu" in error_text.lower() or "tên đăng nhập" in error_text.lower():
                            logger.error("Sai tài khoản hoặc mật khẩu MyDTU.")
                            return False
                else:
                    logger.warning("Đăng nhập không thành công (Hết thời gian chờ hoặc Captcha sai).")
                
                logger.info("Đang tải lại trang đăng nhập để lấy Captcha mới...")
                await page.goto(self.login_url, wait_until="load", timeout=25000)
                await page.add_style_tag(content=".darkness, #popout, #adbox { display: none !important; }")
                continue

        if not login_success:
            logger.error("Không thể đăng nhập sau 3 lần thử giải Captcha.")
            return False

        logger.info("Đăng nhập thành công và đã truy cập hệ thống.")
        return True

    async def fetch_timetable(self) -> dict:
        """
        Đăng nhập MyDTU và cào lịch học hiện tại.
        """
        result = {
            "success": False,
            "timetable": [],
            "hash": "",
            "message": ""
        }

        async with async_playwright() as p:
            logger.info("Đang khởi động trình duyệt ẩn (Headless Chromium)...")
            browser = await p.chromium.launch(headless=True)
            context = await browser.new_context(
                viewport={"width": 1280, "height": 800},
                user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36",
                ignore_https_errors=True
            )
            page = await context.new_page()

            try:
                if not await self.login(page):
                    result["message"] = "Đăng nhập vào hệ thống MyDTU thất bại."
                    return result

                logger.info(f"Đang mở trang thời khóa biểu: {self.timetable_url}")
                await page.goto(self.timetable_url, wait_until="domcontentloaded", timeout=40000)

                # Chờ thời khóa biểu tải (3 giây)
                await asyncio.sleep(3)

                items = []
                
                # Quét theo các bảng thời khóa biểu
                tables = await page.query_selector_all("table")
                for table in tables:
                    rows = await table.query_selector_all("tr")
                    for row in rows:
                        cols = await row.query_selector_all("td, th")
                        if len(cols) >= 3:
                            col_texts = [(await c.inner_text()).strip() for c in cols]
                            text_combined = " ".join(col_texts).lower()
                            # Kiểm tra xem dòng có chứa các từ khóa lịch học không
                            if any(k in text_combined for k in ["thứ", "tiết", "phòng", "môn", "lớp", "học"]):
                                if any(char.isdigit() for char in text_combined):
                                    items.append({
                                        "raw_info": " | ".join([t for t in col_texts if t])
                                    })
                
                # Phương thức dự phòng 1: Nếu không có table, quét các div dạng card/item
                if not items:
                    card_elements = await page.query_selector_all("div.card, div.item, div[class*='timetable'], div[class*='lichhoc']")
                    for card in card_elements:
                        txt = (await card.inner_text()).strip()
                        if txt and len(txt) > 10:
                            items.append({"raw_info": " ".join(txt.split())})

                # Phương thức dự phòng 2: Trích xuất text thô vùng chính
                if not items:
                    main_area = await page.query_selector("#divMoHocChon, #main-content, .content-wrapper, body")
                    if main_area:
                        full_txt = (await main_area.inner_text()).strip()
                        lines = [line.strip() for line in full_txt.split("\n") if line.strip() and len(line.strip()) > 5]
                        for line in lines[:30]:
                            if any(k in line.lower() for k in ["thứ", "tiết", "phòng", "lớp", "học phần", "lịch"]):
                                items.append({"raw_info": line})

                # Lọc bỏ các mục tiêu đề menu rác không chứa thông tin môn học
                items = [item for item in items if is_valid_schedule_item(item.get("raw_info", ""))]

                # Tính mã băm SHA256 để kiểm tra thay đổi
                schedule_json_str = json.dumps(items, ensure_ascii=False, sort_keys=True)
                schedule_hash = hashlib.sha256(schedule_json_str.encode("utf-8")).hexdigest()

                result["success"] = True
                result["timetable"] = items
                result["hash"] = schedule_hash
                result["message"] = f"Tải lịch học thành công ({len(items)} dòng)."
                logger.info(f"Cào dữ liệu hoàn tất. Tổng số mục: {len(items)}. Hash: {schedule_hash}")

            except MaintenanceError as me:
                logger.warning(f"Cổng MyDTU đang bảo trì hoặc sao lưu dữ liệu: {me}")
                result["maintenance"] = True
                result["message"] = str(me)
            except PlaywrightTimeoutError as te:
                logger.error(f"Hết thời gian tải trang MyDTU: {te}")
                result["message"] = "Hết thời gian kết nối tới cổng thông tin MyDTU."
            except Exception as e:
                logger.exception("Sự cố xảy ra khi cào thời khóa biểu:")
                result["message"] = f"Lỗi hệ thống cào dữ liệu: {e}"
            finally:
                await context.close()
                await browser.close()

        return result

async def send_telegram_alert(token: str, chat_ids: str, message: str):
    """
    Gửi tin nhắn thông báo qua Telegram API.
    Hỗ trợ nhiều chat_id (ngăn cách bởi dấu phẩy).
    """
    url = f"https://api.telegram.org/bot{token}/sendMessage"
    
    # Chia nhỏ danh sách chat_id nếu có nhiều người nhận
    list_chat_ids = [cid.strip() for cid in chat_ids.split(",") if cid.strip()]
    
    async with httpx.AsyncClient() as client:
        for chat_id in list_chat_ids:
            payload = {
                "chat_id": chat_id,
                "text": message,
                "parse_mode": "Markdown",
                "disable_web_page_preview": True
            }
            try:
                response = await client.post(url, json=payload, timeout=10.0)
                if response.status_code == 200:
                    logger.info(f"Đã gửi tin nhắn thành công tới Chat ID: {chat_id}")
                else:
                    logger.error(f"Gửi tin nhắn tới Chat ID {chat_id} thất bại: {response.text}")
            except Exception as e:
                logger.error(f"Lỗi khi kết nối Telegram API tới Chat ID {chat_id}: {e}")

async def main():
    logger.info("=== Bắt đầu quy trình kiểm tra lịch học ===")
    
    # Kiểm tra khung giờ bảo trì định kỳ của MyDTU (23h00 - 00h00 giờ Việt Nam)
    vn_tz = timezone(timedelta(hours=7))
    h_vn = datetime.now(vn_tz).hour
    if h_vn == 23:
        logger.info("⏰ [Bảo trì định kỳ] Hiện đang trong khung giờ sao lưu dữ liệu hàng ngày của MyDTU (23:00 - 00:00).")
        logger.info("Bỏ qua lượt quét lịch học này để tiết kiệm tài nguyên và tránh lỗi kết nối.")
        sys.exit(0)
    
    # Kiểm tra cấu hình bắt buộc
    if not all([MYDTU_USER, MYDTU_PASS, GEMINI_API_KEY, TELEGRAM_TOKEN, TELEGRAM_CHAT_ID]):
        logger.error("LỖI CẤU HÌNH: Vui lòng cấu hình đầy đủ biến môi trường trong file .env hoặc GitHub Secrets:")
        logger.error(f" - MYDTU_USER: {'Đã cấu hình' if MYDTU_USER else 'TRỐNG'}")
        logger.error(f" - MYDTU_PASS: {'Đã cấu hình' if MYDTU_PASS else 'TRỐNG'}")
        logger.error(f" - GEMINI_API_KEY: {'Đã cấu hình' if GEMINI_API_KEY else 'TRỐNG'}")
        logger.error(f" - TELEGRAM_TOKEN: {'Đã cấu hình' if TELEGRAM_TOKEN else 'TRỐNG'}")
        logger.error(f" - TELEGRAM_CHAT_ID: {'Đã cấu hình' if TELEGRAM_CHAT_ID else 'TRỐNG'}")
        sys.exit(1)

    scraper = DTUScraper()
    res = await scraper.fetch_timetable()

    if res.get("maintenance"):
        logger.info(f"Quy trình quét tạm dừng: {res.get('message')}")
        sys.exit(0)

    if not res.get("success"):
        logger.error(f"Quét lịch học thất bại: {res.get('message')}")
        sys.exit(1)

    new_hash = res.get("hash")
    timetable = res.get("timetable", [])

    # Tên các file lưu trạng thái
    hash_file = "last_hash.txt"
    schedule_file = "last_schedule.json"

    # Đọc mã băm cũ
    old_hash = ""
    if os.path.exists(hash_file):
        try:
            with open(hash_file, "r", encoding="utf-8") as f:
                old_hash = f.read().strip()
        except Exception as e:
            logger.warning(f"Không thể đọc file {hash_file}: {e}")

    # So sánh xem lịch học có thay đổi không
    if new_hash == old_hash:
        logger.info("Lịch học không có thay đổi so với lần quét trước. Kết thúc quy trình.")
        return

    logger.info("🚨 PHÁT HIỆN THỜI KHÓA BIỂU MYDTU ĐÃ CÓ THAY ĐỔI!")

    # Lưu lại lịch học mới vào file
    try:
        with open(hash_file, "w", encoding="utf-8") as f:
            f.write(new_hash)
        with open(schedule_file, "w", encoding="utf-8") as f:
            json.dump(timetable, f, ensure_ascii=False, indent=2)
        logger.info("Đã cập nhật mã băm mới và file thông tin thời khóa biểu cục bộ.")
    except Exception as e:
        logger.error(f"Lỗi khi lưu dữ liệu lịch học mới vào file: {e}")

    # Tạo tin nhắn thông báo gửi Telegram
    if not timetable:
        logger.info("Hiện tại không có lịch học (Trống lịch / Đang nghỉ).")
        alert_text = (
            "ℹ️ *[ THÔNG BÁO LỊCH HỌC MYDTU ]*\n\n"
            "👋 **Chào Hoàng Vũ!** Hệ thống kiểm tra ghi nhận hiện tại **BẠN KHÔNG CÓ LỊCH HỌC** (Trống lịch / Đang trong thời gian nghỉ học).\n\n"
            "✨ *Vũ cứ yên tâm nghỉ ngơi nhé! Hệ thống sẽ tiếp tục quét định kỳ và báo ngay khi nhà trường xếp lịch học mới.*"
        )
    else:
        items_lines = []
        for idx, item in enumerate(timetable, 1):
            items_lines.append(f"📌 *{idx}.* {item.get('raw_info')}")
            
        schedule_summary = "\n".join(items_lines)
        
        alert_text = (
            "🚨 *[ THÔNG BÁO THAY ĐỔI LỊCH HỌC MYDTU ]*\n\n"
            "⚠️ *Chú ý Hoàng Vũ!* Hệ thống quét tự động vừa phát hiện nhà trường đã **CẬP NHẬT/THAY ĐỔI THỜI KHÓA BIỂU**!\n\n"
            "📅 **Thời khóa biểu mới nhất:**\n"
            f"{schedule_summary}\n\n"
            "👉 *Vũ hãy kiểm tra lại phòng học và giờ học trên trang MyDTU ngay để không bị đi nhầm lớp nhé!*"
        )

    # Gửi cảnh báo về Telegram
    await send_telegram_alert(TELEGRAM_TOKEN, TELEGRAM_CHAT_ID, alert_text)
    logger.info("=== Hoàn tất quy trình phát hiện thay đổi và gửi cảnh báo ===")

if __name__ == "__main__":
    asyncio.run(main())
