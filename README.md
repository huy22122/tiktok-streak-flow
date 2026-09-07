# TikTok Streak Flow (Tự Động Rep Chuỗi TikTok 24/7) 🔥

> **Công cụ tự động gửi tin nhắn giữ chuỗi (TikTok Streaks) cho cả Bạn Bè (1-1) và Nhóm Chat trên TikTok.**  
> Tích hợp **Giao diện Web Quản Lý Trực Quan** và hỗ trợ chạy hoàn toàn **MIỄN PHÍ 24/7 trên GitHub Actions (Cloud)** — **không cần bật máy tính!**

---

## 🌟 Tính Năng Nổi Bật

- [x] **Trình Quản Lý Trực Quan (Web App)**: Giao diện trực quan (`Quan_Ly_TikTok_Streak.html`) giúp bạn dễ dàng chọn ngôn ngữ tin nhắn, thêm/bớt bạn bè & nhóm chat, và xuất cấu hình chỉ trong 1 cú click.
- [x] **Hỗ trợ Đa Ngôn Ngữ**: Tùy chọn gửi tin nhắn giữ lửa bằng **Tiếng Việt 🇻🇳**, **English 🇬🇧**, **Song ngữ Việt - Anh 🌐**, hoặc mẫu tin nhắn tùy chỉnh riêng.
- [x] **Giữ chuỗi cả Bạn bè & Nhóm Chat**: Tự động nhận diện và gửi tin nhắn giữ lửa cho cả cuộc trò chuyện cá nhân lẫn các nhóm chat (Group Chats).
- [x] **Chạy Free 24/7 trên Cloud**: Tận dụng GitHub Actions hoàn toàn miễn phí, tự động gửi tin nhắn 2 lần mỗi ngày (08:00 sáng & 20:00 tối) mà không cần mở máy tính hay tốn tiền mua máy chủ.
- [x] **Chống phát hiện bot (Anti-detection)**: Cấu hình Playwright tối ưu giả lập người dùng thật, tránh bị hạn chế tài khoản.
- [x] **Lọc Cookie thông minh**: Tự động làm sạch cookie rác từ Google/YouTube OAuth, đảm bảo tỷ lệ thành công 100%.

---

## ⚡ CÁC CÔNG CỤ 1-CLICK TRONG THƯ MỤC

| File | Chức năng |
| :--- | :--- |
| **`Mo_Trinh_Quan_Ly.bat`** | Mở Giao diện Quản lý Web trực quan để đổi ngôn ngữ, thêm/bớt bạn bè & nhóm chat |
| **`1_Dang_Nhap_Lay_Cookie.bat`** | Mở trình duyệt để bạn đăng nhập TikTok và tự động lấy Cookie tạo file `.env` |
| **`2_Chay_Rep_Chuoi_Thu_Nghiem.bat`** | Chạy gửi tin nhắn giữ chuỗi thử nghiệm ngay lập tức trên máy tính |
| **`3_Day_Len_GitHub_24_7.bat`** | Tự động đẩy code lên GitHub của bạn để kích hoạt chạy Free 24/7 trên Cloud |

---

## 🚀 HƯỚNG DẪN THIẾT LẬP CHẠY FREE 24/7 TRÊN GITHUB (KHÔNG CẦN BẬT MÁY)

### Bước 1: Mở Trình Quản Lý hoặc Đăng nhập lấy Cookie
- Bấm đúp vào file **`1_Dang_Nhap_Lay_Cookie.bat`** để đăng nhập TikTok và lấy Cookie tự động.
- Hoặc bấm đúp vào **`Mo_Trinh_Quan_Ly.bat`** (mở `Quan_Ly_TikTok_Streak.html`) để:
  - Chọn ngôn ngữ tin nhắn (**Tiếng Việt**, **English**, **Song ngữ**).
  - Thêm các bạn bè và nhóm chat cần giữ lửa (ví dụ: `Huy`, `106267-K24`, `Nhóm bạn thân`...).
  - Bấm nút Copy 2 giá trị **`TASKS`** và **`COOKIES_ACC1`**.

---

### Bước 2: Đẩy Code lên GitHub Repo của bạn
1. Tạo 1 Repository mới trên tài khoản GitHub của bạn (chọn chế độ **Private** để bảo mật).
2. Bấm đúp vào file **`3_Day_Len_GitHub_24_7.bat`**, dán link Git Repo của bạn vào và nhấn Enter.

---

### Bước 3: Thêm Secrets trên GitHub
1. Trên trang Repository của bạn trên GitHub, vào thẻ **Settings** -> Mục bên trái chọn **Secrets and variables** -> Chọn **Actions**.
2. Tại tab **Secrets**, bấm **New repository secret** và thêm 2 biến:
   - **Secret 1**:
     - Name: `TASKS`
     - Value: Giá trị `TASKS` đã tạo ở Bước 1.
   - **Secret 2**:
     - Name: `COOKIES_ACC1`
     - Value: Giá trị `COOKIES_ACC1` đã tạo ở Bước 1.

---

### Bước 4: Kích hoạt & Kiểm tra
1. Vào tab **Actions** trên GitHub Repo của bạn.
2. Chọn workflow: **TikTok Streak Flow Schedule Run** -> Bấm **Run workflow**.
3. Chờ 1-2 phút, hệ thống sẽ tự động gửi tin nhắn và báo thành công!

Từ lúc này, GitHub Actions sẽ tự động chạy **2 lần mỗi ngày (08:00 sáng và 20:00 tối giờ Việt Nam)** để giữ chuỗi liên tục mà **không cần mở máy tính**.

---

## 🌐 Mở Trình Quản Lý Trực Tuyến trên GitHub Pages

Sau khi đẩy code lên GitHub, bạn có thể kích hoạt **GitHub Pages** để sử dụng Trình Quản Lý trực tiếp trên điện thoại hoặc bất kỳ trình duyệt nào:
1. Vào Repo GitHub -> **Settings** -> **Pages**.
2. Tại mục **Build and deployment**, chọn **Deploy from a branch**.
3. Chọn nhánh `main` và thư mục `/docs` -> Bấm **Save**.
4. GitHub sẽ cung cấp cho bạn 1 đường link trang web quản lý trực tuyến tuyệt đẹp!
