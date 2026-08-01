# 📱 Kiến Trúc & Logic Toàn Diện Xây Dựng App Thời Khóa Biểu MyDTU (0$ Serverless)

Tài liệu thiết kế chi tiết kiến trúc hệ thống, luồng dữ liệu (Data Flow), cấu trúc API, và logic xử lý giao diện dành cho việc phát triển một **Ứng dụng di động (Flutter / React Native / Android Native)** hoặc **Web App** xem thời khóa biểu MyDTU tự động nhận thông báo đẩy (Push Notification) miễn phí 100%.

---

## 🏗️ 1. Tổng Quan Kiến Trúc Hệ Thống (Architecture)

Hệ thống hoạt động theo mô hình **Serverless 100% (Chi phí 0đ, không cần VPS)** bao gồm 3 tầng:

```
[MyDTU Portal] ---> (Playwright + Gemini Captcha) ---> [GitHub Actions Scraper]
                                                               |
                                     +-------------------------+-------------------------+
                                     | 1. Lưu dữ liệu JSON                               | 2. Gửi Push Notification
                                     v                                                   v
                     [Firebase Realtime Database / Supabase]              [Firebase Cloud Messaging - FCM]
                                     |                                                   |
                                     | Đồng bộ lịch học khi mở App                       | Thông báo màn hình khóa
                                     v                                                   v
                                     +-------------------------+-------------------------+
                                                               |
                                                               v
                                                    [App Di Động của Bạn]
```

### Thành phần chính:
1. **Backend / Worker (GitHub Actions)**: Chạy script cào dữ liệu ngầm định kỳ (5h00 sáng & 5 tiếng/lần), tự giải Captcha, so sánh lịch mới và bắn sự kiện.
2. **Database & Notification Cloud (Firebase / Supabase - Gói Miễn Phí Trọn Đời)**:
   - **Firebase Realtime Database / Supabase**: Lưu trữ thời khóa biểu dạng JSON.
   - **Firebase Cloud Messaging (FCM)**: Dịch vụ phát thông báo đẩy trực tiếp tới điện thoại.
3. **Client App (Ứng dụng di động của bạn)**:
   - Đăng ký nhận thông báo FCM.
   - Lấy dữ liệu lịch học từ Database về hiển thị giao diện UI/UX xịn xò.

---

## 🔄 2. Luồng Dữ Liệu & Logic Chi Tiết (Data Flow & Logic)

### 2.1. Logic Phía Backend (GitHub Actions `check_schedule.py`)
1. **Đăng nhập & Cào dữ liệu**: Giữ nguyên logic Playwright + Gemini AI giải Captcha hiện tại.
2. **Phân loại 3 hình thức học**:
   - `🏫 [HỌC TẠI TRƯỜNG]`: Học trực tiếp tại phòng học trên trường.
   - `💻🏠 [ONLINE TẠI NHÀ (GV ở trường)]`: Lớp học Tập Trung & Trực Tuyến (Giảng viên dạy ở phòng tại trường, Sinh viên học Online ở nhà).
   - `💻 [ONLINE TẠI NHÀ]`: Học online hoàn toàn (Zoom, Teams, LMS).
3. **Đóng gói Cấu trúc Dữ liệu JSON**:
   ```json
   {
     "user_id": "1785774029",
     "last_updated": "2026-08-01T05:00:00+07:00",
     "schedule_hash": "4f53cda18c2baa...",
     "today": {
       "date": "01/08/2026",
       "weekday": "Thứ Bảy",
       "is_holiday": true,
       "classes": []
     },
     "weekly_schedule": [
       {
         "subject_name": "Xác suất thống kê",
         "subject_code": "CS 311",
         "time": "Tiết 1-3 (07:00 - 09:15)",
         "room": "P.302",
         "campus": "254 Nguyễn Văn Linh",
         "teacher": "Nguyễn Văn A",
         "class_type": "TRUC_TIEP",
         "day_of_week": "Thứ Hai"
       }
     ]
   }
   ```
4. **Logic Phát Thông Báo Đẩy (FCM Payload)**:
   - **Tiêu đề (Title)**: `🚨 Thay Đổi Lịch Học MyDTU!` hoặc `🌅 Lịch Học Hôm Nay (05:00)`
   - **Nội dung (Body)**: `Hôm nay bạn có 2 môn học tại cơ sở Nguyễn Văn Linh.`
   - **Data Payload**: `{ "screen": "today_schedule", "updated": "true" }`

---

## 📱 3. Thiết Kế Logic Giao Diện App (Client App Logic)

### 3.1. Các Màn Hình Chính của App

```
📱 App Thời Khóa Biểu MyDTU
├── 🏠 Màn hình chính (Dashboard)
│   ├── 📌 Card Lịch Học Hôm Nay (Hiển thị nổi bật đầu tiên)
│   ├── 🗓️ Accordion / Tab Lịch Cả Tuần (Thứ 2 -> Chủ Nhật)
│   └── ⚡ Nút "Đồng bộ ngay" (Gửi lệnh kích hoạt cào dữ liệu tức thì)
├── 🔔 Màn hình Nhật Ký Thông Báo (Notification History)
└── ⚙️ Màn hình Cài Đặt (Settings)
    ├── Bật/Tắt báo thức 5h00 sáng
    ├── Tùy chỉnh màu sắc chủ đề (Dark / Light Mode)
    └── Quản lý Token thiết bị (FCM Device Token)
```

### 3.2. State Management & Logic Xử Lý Trên App
- **Xử lý Offline**: Lưu dữ liệu thời khóa biểu gần nhất vào `LocalStorage` / `SQLite` / `SharedPreferences` trên điện thoại. Khi mở App không có mạng vẫn xem được thời khóa biểu cũ.
- **Xử lý Push Notification trong background**:
  - Khi điện thoại ở màn hình khóa và nhận được thông báo từ FCM -> Hiển thị Banner kèm âm thanh thông báo.
  - Khi người dùng bấm vào Banner thông báo -> Mở App và chuyển thẳng tới tab **Lịch Học Hôm Nay**.

---

## 🛠️ 4. Các Bước Thực Hiện Để Tự Làm App

1. **Tạo Dự Án Firebase Miễn Phí**:
   - Truy cập [console.firebase.google.com](https://console.firebase.google.com/) -> Tạo project mới (Ví dụ: `MyDTU Schedule`).
   - Bật dịch vụ **Cloud Messaging (FCM)** và **Realtime Database**.
2. **Viết App Di Động (Khuyên dùng Flutter hoặc React Native)**:
   - Cài gói `firebase_core` và `firebase_messaging`.
   - Lấy `fcm_token` của máy bạn dán vào Repository Secret trên GitHub.
3. **Cập nhật Script Python `check_schedule.py`**:
   - Bổ sung hàm gửi HTTP POST request tới API Firebase FCM để bắn thông báo.

---

## 📋 Kiểm Tra & Nghiệm Thu (Verification Plan)

### Automated Tests
- Kiểm tra tính hợp lệ của cấu trúc JSON payload trước khi đẩy lên Firebase Database.
- Test gửi thử nghiệm Push Notification bằng script Python cào dữ liệu.

### Manual Verification
- Test ứng dụng trên điện thoại di động ở cả 3 trạng thái: App đang mở (Foreground), App đang chạy ngầm (Background), và App đã đóng hoàn toàn (Killed).
