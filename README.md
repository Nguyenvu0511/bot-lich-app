# 🤖 Bot Quét Lịch Học MyDTU Tự Động (GitHub Actions)

Hệ thống quét thời khóa biểu MyDTU tự động hoạt động trên đám mây bằng **GitHub Actions** (miễn phí 100%, không cần cắm máy tính). Bot tự động đăng nhập MyDTU, tự giải Captcha bằng Google Gemini AI, phân tích **Lịch Học Hôm Nay** & **Lịch Học Cả Tuần**, tự động **phân loại 3 hình thức học (Học tại trường / Online tại nhà / Tập trung & Trực tuyến)**, **gửi báo cáo cố định lúc 5h00 sáng hàng ngày** và phát cảnh báo tức thì qua Telegram khi nhà trường đổi lịch.

---

## 🌟 Tính Năng Nổi Bật

- 🏫 **Tự động phân loại 3 hình thức học MyDTU**:
  - 🏫 **`[HỌC TẠI TRƯỜNG]`**: Học trực tiếp tại phòng học trên cơ sở trường.
  - 💻🏠 **`[ONLINE TẠI NHÀ (GV ở trường)]`**: Lớp học Tập Trung & Trực Tuyến (Giảng viên dạy ở phòng tại trường, Sinh viên học Online ở nhà).
  - 💻 **`[ONLINE TẠI NHÀ]`**: Học trực tuyến/online hoàn toàn (Zoom, MS Teams, LMS).
- 🌅 **Báo cáo cố định 5h00 sáng hàng ngày**: Đúng 5h00 sáng mỗi ngày, Bot sẽ tự động gửi tin nhắn báo cáo lịch học Hôm Nay và Tổng Hợp Cả Tuần về Telegram giúp bạn luôn chủ động chuẩn bị trước khi đi học.
- 🔄 **Quét ngầm định kỳ 5 tiếng/lần**: Quét liên tục và tự động phát hiện thay đổi lịch từ phía nhà trường.
- 🧩 **Tự động vượt Captcha**: Sử dụng mô hình AI `gemini-flash-latest` để giải Captcha hình ảnh chính xác.
- 📅 **Phân tích Lịch Hôm Nay & Cả Tuần**:
  - Tự động nhận diện múi giờ Việt Nam (UTC+7).
  - Nêu rõ các môn học của **Hôm Nay** (hoặc báo `🎉 Hôm nay bạn KHÔNG CÓ LỊCH HỌC`).
  - Tổng hợp danh sách cả tuần và đánh dấu nhãn `👉 [HÔM NAY]` nổi bật.
- ⏰ **Tự động né giờ bảo trì**: Tự ngắt sớm trong khung giờ bảo trì/sao lưu dữ liệu cố định của MyDTU (từ 23h00 đến 00h00 hàng ngày) để tiết kiệm tài nguyên.
- 🏝️ **Thông minh khi trống lịch/nghỉ hè**: Tự lưu trạng thái trống lịch và im lặng nghỉ ngơi cùng bạn, chỉ thông báo khi nhà trường xếp lịch mới.
- 🔒 **Bảo mật 100%**: Sử dụng GitHub Repository Secrets để lưu giữ mật khẩu và Token cá nhân.

---

## 📁 Cấu Trúc Dự Án

```
├── .github/workflows/
│   └── quet_lich_hoc.yml    # Định nghĩa lịch chạy ngầm cho GitHub Actions (5h00 sáng & mỗi 5 tiếng/lần)
├── check_schedule.py        # Script Python chính (Đăng nhập, giải Captcha, cào dữ liệu, gửi Telegram)
├── last_hash.txt            # Lưu mã băm SHA256 để so sánh sự thay đổi lịch học
├── last_schedule.json       # Lưu thông tin chi tiết lịch học gần nhất
├── requirements.txt         # Thư viện Python (httpx, playwright, python-dotenv)
├── .env                     # File cấu hình biến môi trường cục bộ (không đẩy lên git)
├── .gitignore               # Bỏ qua file .env và ảnh screenshot debug
└── HƯỚNG_DẪN.md             # Tài liệu hướng dẫn thiết lập chi tiết bằng Tiếng Việt
```

---

## 🚀 Hướng Dẫn Thiết Lập Nhanh

### Bước 1: Tạo Repository Riêng Tư (Private) trên GitHub
- Tạo repo mới ở chế độ **Private** (Riêng tư) để bảo vệ tài khoản MyDTU của bạn.

### Bước 2: Đẩy Mã Nguồn Lên GitHub
```bash
git init
git branch -M main
git remote add origin https://github.com/TÊN_TÀI_KHOẢN/TÊN_REPO.git
git add .
git commit -m "Khoi tao bot quet lich hoc"
git push -u origin main
```

### Bước 3: Cấu Hình Repository Secrets
Vào **Settings** -> **Secrets and variables** -> **Actions** -> Thêm 5 bí mật:
- `MYDTU_USER`: Tên đăng nhập MyDTU
- `MYDTU_PASS`: Mật khẩu MyDTU
- `GEMINI_API_KEY`: API Key của Google Gemini
- `TELEGRAM_TOKEN`: Bot Token Telegram
- `TELEGRAM_CHAT_ID`: ID Telegram của bạn (Ví dụ lấy từ `@userinfobot`)

### Bước 4: Cấp Quyền Cho GitHub Actions
Vào **Settings** -> **Actions** -> **General** -> Kéo xuống **Workflow permissions** -> Chọn **Read and write permissions** -> Bấm **Save**.

### Bước 5: Chạy Thử
Vào tab **Actions** -> Chọn **Quét Lịch Học MyDTU Định Kỳ** -> Bấm **Run workflow**.

---

## 📄 Giấy Phép
Dự án mã nguồn mở phục vụ mục đích học tập và hỗ trợ cá nhân.
