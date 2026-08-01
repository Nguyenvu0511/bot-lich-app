import React from 'react';
import { NavTab } from '../types';

interface BottomNavProps {
  currentTab: NavTab;
  onTabChange: (tab: NavTab) => void;
  unreadCount: number;
}

export const BottomNav: React.FC<BottomNavProps> = ({ currentTab, onTabChange, unreadCount }) => {
  return (
    <nav className="fixed bottom-6 left-6 right-6 rounded-full h-20 bg-white/30 dark:bg-black/20 backdrop-blur-2xl border border-white/50 dark:border-white/10 shadow-[0_20px_40px_rgba(134,78,90,0.2)] flex justify-around items-center px-4 max-w-md mx-auto z-50">
      {/* Tab 1: Today Schedule */}
      <button
        onClick={() => onTabChange('today')}
        aria-label="Lịch Hôm Nay"
        className={`p-4 rounded-full transition-all duration-300 flex flex-col items-center justify-center hover:scale-110 active:scale-90 ${
          currentTab === 'today'
            ? 'bg-primary-container/90 text-on-primary-container shadow-[0_0_20px_rgba(255,183,197,0.7)]'
            : 'text-on-surface-variant/70 hover:text-primary'
        }`}
      >
        <span
          className="material-symbols-outlined text-2xl"
          style={{ fontVariationSettings: currentTab === 'today' ? "'FILL' 1" : "'FILL' 0" }}
        >
          calendar_month
        </span>
      </button>

      {/* Tab 2: Weekly Schedule */}
      <button
        onClick={() => onTabChange('weekly')}
        aria-label="Lịch Tuần"
        className={`p-4 rounded-full transition-all duration-300 flex flex-col items-center justify-center hover:scale-110 active:scale-90 ${
          currentTab === 'weekly'
            ? 'bg-primary-container/90 text-on-primary-container shadow-[0_0_20px_rgba(255,183,197,0.7)]'
            : 'text-on-surface-variant/70 hover:text-primary'
        }`}
      >
        <span
          className="material-symbols-outlined text-2xl"
          style={{ fontVariationSettings: currentTab === 'weekly' ? "'FILL' 1" : "'FILL' 0" }}
        >
          event_note
        </span>
      </button>

      {/* Tab 3: Notifications */}
      <button
        onClick={() => onTabChange('notifications')}
        aria-label="Thông báo"
        className={`p-4 rounded-full transition-all duration-300 flex flex-col items-center justify-center hover:scale-110 active:scale-90 relative ${
          currentTab === 'notifications'
            ? 'bg-primary-container/90 text-on-primary-container shadow-[0_0_20px_rgba(255,183,197,0.7)]'
            : 'text-on-surface-variant/70 hover:text-primary'
        }`}
      >
        <span
          className="material-symbols-outlined text-2xl"
          style={{ fontVariationSettings: currentTab === 'notifications' ? "'FILL' 1" : "'FILL' 0" }}
        >
          notifications
        </span>
        {unreadCount > 0 && currentTab !== 'notifications' && (
          <span className="absolute top-3 right-3 w-2.5 h-2.5 bg-error rounded-full animate-ping" />
        )}
        {unreadCount > 0 && (
          <span className="absolute top-2.5 right-2.5 w-2.5 h-2.5 bg-error rounded-full border border-white" />
        )}
      </button>

      {/* Tab 4: Settings & Profile */}
      <button
        onClick={() => onTabChange('settings')}
        aria-label="Cài đặt cá nhân"
        className={`p-4 rounded-full transition-all duration-300 flex flex-col items-center justify-center hover:scale-110 active:scale-90 ${
          currentTab === 'settings'
            ? 'bg-primary-container/90 text-on-primary-container shadow-[0_0_20px_rgba(255,183,197,0.7)]'
            : 'text-on-surface-variant/70 hover:text-primary'
        }`}
      >
        <span
          className="material-symbols-outlined text-2xl"
          style={{ fontVariationSettings: currentTab === 'settings' ? "'FILL' 1" : "'FILL' 0" }}
        >
          person
        </span>
      </button>
    </nav>
  );
};
