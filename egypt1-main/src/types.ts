export type NavTab = 'today' | 'weekly' | 'notifications' | 'settings';

export interface TodayClass {
  id: string;
  title: string;
  time: string;
  location: string;
  shift: 'Sáng' | 'Chiều' | 'Tối';
  isOnline?: boolean;
  completed: boolean;
  instructor?: string;
  code?: string;
  group?: string;
}

export interface WeeklyClass {
  id: string;
  dayIndex: number; // 0=Mon, 1=Tue, 2=Wed...
  title: string;
  code: string;
  group: string;
  time: string;
  location: string;
  instructor: string;
  status?: 'ĐANG DIỄN RA' | 'SẮP DIỄN RA' | 'ĐÃ HOÀN THÀNH';
  iconType: 'laptop_mac' | 'database' | 'language' | 'schedule' | 'book';
  isOnline?: boolean;
  onlineLink?: string;
}

export interface NotificationItem {
  id: string;
  title: string;
  timeAgo: string;
  content: string;
  isUnread: boolean;
  type: 'schedule' | 'tuition' | 'registration' | 'survey';
  category: 'recent' | 'older';
}

export interface UserProfile {
  name: string;
  email: string;
  studentId: string;
  avatarUrl: string;
  department: string;
  classGroup: string;
}

export interface UserSettings {
  notificationsEnabled: boolean;
  language: 'Tiếng Việt' | 'English';
  theme: 'Sáng' | 'Tối';
}
