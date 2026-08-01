import { TodayClass, WeeklyClass, NotificationItem, UserProfile, UserSettings } from '../types';

export const initialTodayClasses: TodayClass[] = [
  {
    id: 't1',
    title: 'Xác suất thống kê',
    time: '07:00 - 09:15',
    location: 'Phòng P.302',
    shift: 'Sáng',
    completed: false,
    instructor: 'TS. Nguyễn Văn D',
    code: 'MTH254',
    group: 'Nhóm 2'
  },
  {
    id: 't2',
    title: 'Lập trình Java',
    time: '13:00 - 15:15',
    location: 'Online',
    shift: 'Chiều',
    isOnline: true,
    completed: false,
    instructor: 'ThS. Trần Văn E',
    code: 'CS211',
    group: 'Nhóm 1'
  }
];

export const initialWeeklyClasses: WeeklyClass[] = [
  // Thứ 2 (24)
  {
    id: 'w-mon-1',
    dayIndex: 0,
    title: 'Toán Cao Cấp A1',
    code: 'MTH101',
    group: 'Nhóm 4',
    time: '07:00 - 09:30',
    location: 'Phòng 301 - Cơ sở Quang Trung',
    instructor: 'GV: Nguyễn Thị Dung',
    status: 'ĐÃ HOÀN THÀNH',
    iconType: 'book'
  },
  // Thứ 3 (25)
  {
    id: 'w-tue-1',
    dayIndex: 1,
    title: 'Cấu trúc dữ liệu & Giải thuật',
    code: 'CS202',
    group: 'Nhóm 2',
    time: '09:45 - 12:15',
    location: 'Phòng 405 - Cơ sở Hòa Khánh',
    instructor: 'GV: Phạm Văn Nam',
    status: 'ĐÃ HOÀN THÀNH',
    iconType: 'database'
  },
  // Thứ 4 (26) - Selected day in screenshot
  {
    id: 'w1',
    dayIndex: 2,
    title: 'Thiết kế Giao diện',
    code: 'CS414',
    group: 'Nhóm 1',
    time: '07:00 - 09:30',
    location: 'Phòng 204 - Cơ sở Quang Trung',
    instructor: 'GV: Nguyễn Văn A',
    status: 'ĐANG DIỄN RA',
    iconType: 'laptop_mac'
  },
  {
    id: 'w2',
    dayIndex: 2,
    title: 'Cơ sở Dữ liệu',
    code: 'CS311',
    group: 'Nhóm 3',
    time: '13:00 - 15:30',
    location: 'Microsoft Teams',
    instructor: 'GV: Trần Thị B',
    status: 'SẮP DIỄN RA',
    iconType: 'database',
    isOnline: true,
    onlineLink: 'https://teams.microsoft.com'
  },
  {
    id: 'w3',
    dayIndex: 2,
    title: 'Tiếng Anh 4',
    code: 'ENG401',
    group: 'Nhóm 5',
    time: '15:45 - 17:15',
    location: 'Phòng 502 - Cơ sở Hòa Khánh',
    instructor: 'GV: Lê Văn C',
    status: 'SẮP DIỄN RA',
    iconType: 'language'
  },
  // Thứ 5 (27)
  {
    id: 'w-thu-1',
    dayIndex: 3,
    title: 'Mạng máy tính',
    code: 'CS305',
    group: 'Nhóm 1',
    time: '07:00 - 09:30',
    location: 'Phòng 102 - Cơ sở Quang Trung',
    instructor: 'GV: Hoàng Minh Đức',
    status: 'SẮP DIỄN RA',
    iconType: 'laptop_mac'
  },
  {
    id: 'w-thu-2',
    dayIndex: 3,
    title: 'Thiết kế Giao diện (Lịch Bổ Sung)',
    code: 'CS414',
    group: 'Nhóm 1',
    time: '09:45 - 12:15',
    location: 'Phòng 204 - Cơ sở Quang Trung',
    instructor: 'GV: Nguyễn Văn A',
    status: 'SẮP DIỄN RA',
    iconType: 'laptop_mac'
  },
  // Thứ 6 (28)
  {
    id: 'w-fri-1',
    dayIndex: 4,
    title: 'Phân tích & Thiết kế Hệ thống',
    code: 'CS350',
    group: 'Nhóm 3',
    time: '13:00 - 15:30',
    location: 'Phòng 303 - Cơ sở Quang Trung',
    instructor: 'GV: Ngô Văn Hoàng',
    status: 'SẮP DIỄN RA',
    iconType: 'database'
  },
  // Thứ 7 (29)
  {
    id: 'w-sat-1',
    dayIndex: 5,
    title: 'Kỹ năng làm việc nhóm',
    code: 'SKL102',
    group: 'Nhóm 8',
    time: '08:00 - 11:00',
    location: 'Hội trường A - Cơ sở 03 Quang Trung',
    instructor: 'GV: Đỗ Thị Thanh',
    status: 'SẮP DIỄN RA',
    iconType: 'language'
  }
];

export const initialNotifications: NotificationItem[] = [
  {
    id: 'n1',
    title: 'Đổi lịch học thành công',
    timeAgo: '10p trước',
    content: 'Yêu cầu đổi lịch môn Thiết kế Giao diện sang Thứ 5, Ca 2 đã được chấp nhận.',
    isUnread: true,
    type: 'schedule',
    category: 'recent'
  },
  {
    id: 'n2',
    title: 'Nhắc nhở học phí',
    timeAgo: '2 giờ trước',
    content: 'Hạn chót nộp học phí học kỳ Fall 2024 là 30/11/2024. Vui lòng hoàn thành để không bị gián đoạn.',
    isUnread: true,
    type: 'tuition',
    category: 'recent'
  },
  {
    id: 'n3',
    title: 'Kết quả đăng ký môn',
    timeAgo: 'Hôm qua',
    content: 'Bạn đã đăng ký thành công 5/5 học phần cho học kỳ tới. Xem chi tiết TKB.',
    isUnread: false,
    type: 'registration',
    category: 'older'
  },
  {
    id: 'n4',
    title: 'Khảo sát cuối kỳ',
    timeAgo: '3 ngày trước',
    content: 'Đánh giá môn học đã mở. Tham gia đánh giá để cải thiện chất lượng giảng dạy.',
    isUnread: false,
    type: 'survey',
    category: 'older'
  }
];

export const defaultUserProfile: UserProfile = {
  name: 'Nguyễn Văn A',
  email: 'nguyenvana@example.com',
  studentId: '27211234567',
  avatarUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBLvD8kZ5Pqal8jhNjqMP7TEtpwfSa69JDArNM_1p7yG2pA-xC2NKVtQTpeis0E5d8mCWS9wdySJAab4Tkutmvv6ttbkB770Opp9Up3aJX-lQZXhaG69LBGMKGj-H_tZa63b_E5fGEMK0JlMDEUurOkVd0lXXgPtFF9Xg13g7ZPr0IBqCrRPBSp7M84YjMicddy0Z4hRDFqXH8FKrd4QHLucxD10C2ny32sFNmZqxTEa3WG0yiutu_GXw',
  department: 'Khoa Công Nghệ Thông Tin',
  classGroup: 'K27-RPM01'
};

export const defaultUserSettings: UserSettings = {
  notificationsEnabled: true,
  language: 'Tiếng Việt',
  theme: 'Sáng'
};

export const weekDaysList = [
  { name: 'Th 2', date: '24', full: 'Thứ Hai', dayIndex: 0 },
  { name: 'Th 3', date: '25', full: 'Thứ Ba', dayIndex: 1 },
  { name: 'Th 4', date: '26', full: 'Thứ Tư', dayIndex: 2 },
  { name: 'Th 5', date: '27', full: 'Thứ Năm', dayIndex: 3 },
  { name: 'Th 6', date: '28', full: 'Thứ Sáu', dayIndex: 4 },
  { name: 'Th 7', date: '29', full: 'Thứ Bảy', dayIndex: 5 },
  { name: 'CN', date: '30', full: 'Chủ Nhật', dayIndex: 6 }
];
