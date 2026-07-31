# Hướng Dẫn Thiết Lập Bot Quét Lịch Học MyDTU Trên GitHub Actions

Chào Vũ! Tài liệu này sẽ hướng dẫn bạn từng bước để đưa dự án này lên **GitHub** và chạy tự động hoàn toàn miễn phí trên đám mây (Cloud) thông qua **GitHub Actions** mà không cần cắm máy tính.

---

## 📁 Các Thành Phần Của Dự Án
- `check_schedule.py`: Script Python chính chịu trách nhiệm đăng nhập MyDTU (sử dụng Gemini giải Captcha), quét lịch học, so sánh mã băm và gửi tin nhắn Telegram.
- `.github/workflows/quet_lich_hoc.yml`: File lập lịch chạy tự động cho GitHub Actions (mặc định mỗi 5 tiếng chạy một lần, có thể chạy thủ công bất cứ lúc nào).
- `last_hash.txt`: File lưu mã băm (SHA256) của lịch học cũ để phát hiện sự thay đổi.
- `last_schedule.json`: File lưu thông tin lịch học mới nhất (bạn có thể vào GitHub xem trực tiếp file này).
- `requirements.txt`: Chứa danh sách các thư viện cần thiết.
- `.env`: File cấu hình chạy thử ở máy cá nhân (Local) của bạn. **Lưu ý: File này đã được thêm vào `.gitignore` để không bị đẩy lên GitHub nhằm bảo mật mật khẩu của bạn.**

---

## 🚀 Các Bước Thiết Lập Lên GitHub Actions

### Bước 1: Tạo Repository Riêng Tư (Private) Trên GitHub
1. Truy cập vào trang web [GitHub](https://github.com/) và đăng nhập tài khoản của bạn.
2. Bấm nút **New** (hoặc nút **Create repository**) để tạo một kho lưu trữ mới.
3. Cấu hình như sau:
   - **Repository name**: Nhập tên bất kỳ (Ví dụ: `bot-lich-hoc-mydtu`).
   - **Public/Private**: Chọn **🔒 Private (Riêng tư)**. **(⚠️ BẮT BUỘC CHỌN PRIVATE ĐỂ BẢO VỆ THÔNG TIN CÁ NHÂN CỦA BẠN!)**
   - Không tích chọn bất kỳ ô nào khác (như Add a README file, .gitignore, v.v.).
4. Bấm **Create repository**.

---

### Bước 2: Đẩy Mã Nguồn Từ Máy Tính Lên GitHub
Mở terminal (PowerShell hoặc CMD) tại thư mục `D:\EXTENSIONS\Bot lịch học` và chạy các lệnh sau (thay thế URL GitHub bằng URL repository bạn vừa tạo):

```bash
# Khởi tạo Git
git init

# Thiết lập nhánh mặc định là main
git branch -M main

# Thêm tất cả các file (ngoại trừ file .env đã bị .gitignore chặn)
git add .

# Tạo commit đầu tiên
git commit -m "Khởi tạo dự án quét lịch học"

# Kết nối với repository GitHub của bạn (Thay link bên dưới bằng link thật của bạn)
git remote add origin https://github.com/TÊN_TÀI_KHOẢN/TÊN_REPO.git

# Đẩy mã nguồn lên GitHub
git push -u origin main
```

---

### Bước 3: Cấu Hình GitHub Secrets (Biến Môi Trường Bảo Mật)
Để GitHub Actions có thông tin đăng nhập mà không cần lưu mật khẩu trong code, bạn cần thiết lập cấu hình bảo mật:
1. Vào repository của bạn trên GitHub -> Chọn tab **Settings** (ở trên cùng bên phải).
2. Ở thanh menu bên trái, tìm mục **Security** -> Bấm vào **Secrets and variables** -> Chọn **Actions**.
3. Tại mục **Repository secrets**, bấm nút **New repository secret**.
4. Lần lượt thêm 5 khóa bảo mật sau (copy giá trị từ file `.env` cục bộ sang):
   - Tên: `MYDTU_USER` | Giá trị: Tên đăng nhập MyDTU (Ví dụ: `nguyenhoangvu24`)
   - Tên: `MYDTU_PASS` | Giá trị: Mật khẩu MyDTU của bạn
   - Tên: `GEMINI_API_KEY` | Giá trị: Khóa API Gemini dùng giải Captcha
   - Tên: `TELEGRAM_TOKEN` | Giá trị: Token Bot Telegram của bạn
   - Tên: `TELEGRAM_CHAT_ID` | Giá trị: Chat ID của bạn (Ví dụ: `1785774029`)
5. Nhớ bấm **Add secret** sau mỗi lần thêm.

---

### Bước 4: Cấp Quyền Cho Phép GitHub Actions Push Trạng Thái (BẮT BUỘC)
Vì workflow cần cập nhật file `last_hash.txt` và `last_schedule.json` ngược lại repository sau mỗi lần quét phát hiện thay đổi, bạn phải cấp quyền ghi:
1. Vẫn ở tab **Settings** -> Menu bên trái tìm mục **Actions** -> Chọn **General**.
2. Kéo xuống cuối trang đến phần **Workflow permissions**.
3. Chọn ô **Read and write permissions** (Quyền đọc và ghi).
4. Bấm nút **Save** để lưu lại.

---

## ⚙️ Cách Hoạt Động Và Chạy Thử

### 1. Chạy tự động (Lập lịch)
Hệ thống được thiết lập tự động kích hoạt **mỗi 5 tiếng một lần** để quét lịch học. Nếu phát hiện thay đổi, tin nhắn cảnh báo sẽ tự động gửi tới Telegram của bạn. Nếu không, hệ thống sẽ im lặng.

### 2. Kích hoạt chạy thủ công (Để test ngay lập tức)
Nếu muốn kích hoạt quét lịch học ngay lập tức mà không cần đợi 5 tiếng:
1. Vào repository của bạn trên GitHub -> Chọn tab **Actions** (ở trên cùng).
2. Ở menu bên trái, chọn workflow **Quét Lịch Học MyDTU Định Kỳ**.
3. Nhìn sang bên phải, bấm vào nút **Run workflow** -> Chọn nhánh `main` -> Bấm nút **Run workflow** màu xanh.
4. Chờ khoảng 1-2 phút, bạn sẽ thấy tiến trình chuyển sang màu xanh lá cây (Thành công). Nếu có thay đổi lịch học so với bản quét trước đó, bạn sẽ nhận được tin nhắn trên Telegram ngay lập tức!

### 3. Chạy thử nghiệm ở máy cá nhân (Local)
Nếu bạn muốn thử chạy code trực tiếp trên máy của mình:
1. Mở PowerShell tại thư mục `D:\EXTENSIONS\Bot lịch học`.
2. Cài đặt thư viện:
   ```bash
   pip install -r requirements.txt
   ```
3. Cài đặt trình duyệt Playwright ẩn:
   ```bash
   playwright install chromium
   ```
4. Chạy kiểm tra:
   ```bash
   python check_schedule.py
   ```
