import React, { useState, useEffect } from 'react';
import { NavTab, TodayClass, WeeklyClass, NotificationItem, UserProfile, UserSettings } from './types';
import {
  initialTodayClasses,
  initialWeeklyClasses,
  initialNotifications,
  defaultUserProfile,
  defaultUserSettings,
} from './data/mockData';
import { Header } from './components/Header';
import { BottomNav } from './components/BottomNav';
import { TodayScheduleView } from './components/TodayScheduleView';
import { WeeklyScheduleView } from './components/WeeklyScheduleView';
import { NotificationsView } from './components/NotificationsView';
import { SettingsView } from './components/SettingsView';
import { ClassDetailModal } from './components/ClassDetailModal';
import { QRCodeModal } from './components/QRCodeModal';
import { EditProfileModal } from './components/EditProfileModal';
import { SearchModal } from './components/SearchModal';
import { AddClassModal } from './components/AddClassModal';

export default function App() {
  const [currentTab, setCurrentTab] = useState<NavTab>('today');

  // Persistence in LocalStorage
  const [todayClasses, setTodayClasses] = useState<TodayClass[]>(() => {
    const saved = localStorage.getItem('mydtu_today_classes');
    return saved ? JSON.parse(saved) : initialTodayClasses;
  });

  const [weeklyClasses, setWeeklyClasses] = useState<WeeklyClass[]>(() => {
    const saved = localStorage.getItem('mydtu_weekly_classes');
    return saved ? JSON.parse(saved) : initialWeeklyClasses;
  });

  const [notifications, setNotifications] = useState<NotificationItem[]>(() => {
    const saved = localStorage.getItem('mydtu_notifications');
    return saved ? JSON.parse(saved) : initialNotifications;
  });

  const [userProfile, setUserProfile] = useState<UserProfile>(() => {
    const saved = localStorage.getItem('mydtu_profile');
    return saved ? JSON.parse(saved) : defaultUserProfile;
  });

  const [userSettings, setUserSettings] = useState<UserSettings>(() => {
    const saved = localStorage.getItem('mydtu_settings');
    return saved ? JSON.parse(saved) : defaultUserSettings;
  });

  // Modals state
  const [selectedClass, setSelectedClass] = useState<any | null>(null);
  const [isQROpen, setIsQROpen] = useState(false);
  const [isSearchOpen, setIsSearchOpen] = useState(false);
  const [isEditProfileOpen, setIsEditProfileOpen] = useState(false);
  const [isAddClassOpen, setIsAddClassOpen] = useState(false);

  // Sync to localStorage
  useEffect(() => {
    localStorage.setItem('mydtu_today_classes', JSON.stringify(todayClasses));
  }, [todayClasses]);

  useEffect(() => {
    localStorage.setItem('mydtu_weekly_classes', JSON.stringify(weeklyClasses));
  }, [weeklyClasses]);

  useEffect(() => {
    localStorage.setItem('mydtu_notifications', JSON.stringify(notifications));
  }, [notifications]);

  useEffect(() => {
    localStorage.setItem('mydtu_profile', JSON.stringify(userProfile));
  }, [userProfile]);

  useEffect(() => {
    localStorage.setItem('mydtu_settings', JSON.stringify(userSettings));
  }, [userSettings]);

  // Actions
  const handleToggleTodayComplete = (id: string) => {
    setTodayClasses((prev) =>
      prev.map((c) => (c.id === id ? { ...c, completed: !c.completed } : c))
    );
  };

  const handleMarkNotificationAsRead = (id: string) => {
    setNotifications((prev) =>
      prev.map((n) => (n.id === id ? { ...n, isUnread: false } : n))
    );
  };

  const handleMarkAllNotificationsAsRead = () => {
    setNotifications((prev) => prev.map((n) => ({ ...n, isUnread: false })));
  };

  const handleAddTodayClass = (newClass: TodayClass) => {
    setTodayClasses((prev) => [newClass, ...prev]);
  };

  const handleLogout = () => {
    if (window.confirm('Bạn có chắc chắn muốn đăng xuất khỏi MyDTU?')) {
      localStorage.clear();
      setTodayClasses(initialTodayClasses);
      setWeeklyClasses(initialWeeklyClasses);
      setNotifications(initialNotifications);
      setUserProfile(defaultUserProfile);
      setUserSettings(defaultUserSettings);
      setCurrentTab('today');
      alert('Đã đăng xuất thành công.');
    }
  };

  const unreadCount = notifications.filter((n) => n.isUnread).length;

  return (
    <div className="relative min-h-screen selection:bg-primary-container selection:text-on-primary-container overflow-x-hidden">
      {/* Decorative Floating Ambient Orbs */}
      <div className="liquid-orb w-96 h-96 top-10 left-[-100px] bg-primary-container/40" />
      <div
        className="liquid-orb w-[500px] h-[500px] bottom-20 right-[-150px] bg-secondary-container/40"
        style={{ animationDelay: '2s' }}
      />
      <div
        className="liquid-orb w-80 h-80 top-[40%] left-[20%] bg-tertiary-container/30"
        style={{ animationDelay: '4s' }}
      />

      {/* Top Header Bar */}
      <Header
        currentTab={currentTab}
        onOpenQR={() => setIsQROpen(true)}
        onOpenSearch={() => setIsSearchOpen(true)}
      />

      {/* Main View Router */}
      <main className="relative z-10 transition-all duration-300">
        {currentTab === 'today' && (
          <TodayScheduleView
            classes={todayClasses}
            onToggleComplete={handleToggleTodayComplete}
            onSelectClass={(item) => setSelectedClass(item)}
            onAddClassModal={() => setIsAddClassOpen(true)}
          />
        )}

        {currentTab === 'weekly' && (
          <WeeklyScheduleView
            weeklyClasses={weeklyClasses}
            onSelectClass={(item) => setSelectedClass(item)}
          />
        )}

        {currentTab === 'notifications' && (
          <NotificationsView
            notifications={notifications}
            onMarkAsRead={handleMarkNotificationAsRead}
            onMarkAllAsRead={handleMarkAllNotificationsAsRead}
            onSelectNotification={(item) => {
              alert(`Chi tiết thông báo:\n\n${item.title}\n${item.content}`);
            }}
          />
        )}

        {currentTab === 'settings' && (
          <SettingsView
            profile={userProfile}
            settings={userSettings}
            onUpdateSettings={(newSettings) =>
              setUserSettings((prev) => ({ ...prev, ...newSettings }))
            }
            onEditProfile={() => setIsEditProfileOpen(true)}
            onOpenQR={() => setIsQROpen(true)}
            onLogout={handleLogout}
          />
        )}
      </main>

      {/* Bottom Floating Glass Navigation Bar */}
      <BottomNav
        currentTab={currentTab}
        onTabChange={(tab) => setCurrentTab(tab)}
        unreadCount={unreadCount}
      />

      {/* Modals */}
      <ClassDetailModal
        item={selectedClass}
        onClose={() => setSelectedClass(null)}
        onToggleComplete={handleToggleTodayComplete}
      />

      <QRCodeModal
        isOpen={isQROpen}
        onClose={() => setIsQROpen(false)}
        profile={userProfile}
      />

      <EditProfileModal
        isOpen={isEditProfileOpen}
        onClose={() => setIsEditProfileOpen(false)}
        profile={userProfile}
        onSave={(updated) => setUserProfile(updated)}
      />

      <SearchModal
        isOpen={isSearchOpen}
        onClose={() => setIsSearchOpen(false)}
        weeklyClasses={weeklyClasses}
        onSelectClass={(item) => setSelectedClass(item)}
      />

      <AddClassModal
        isOpen={isAddClassOpen}
        onClose={() => setIsAddClassOpen(false)}
        onAdd={handleAddTodayClass}
      />
    </div>
  );
}
