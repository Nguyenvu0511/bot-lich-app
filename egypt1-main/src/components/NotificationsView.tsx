import React from 'react';
import { NotificationItem } from '../types';

interface NotificationsViewProps {
  notifications: NotificationItem[];
  onMarkAsRead: (id: string) => void;
  onMarkAllAsRead: () => void;
  onSelectNotification: (item: NotificationItem) => void;
}

export const NotificationsView: React.FC<NotificationsViewProps> = ({
  notifications,
  onMarkAsRead,
  onMarkAllAsRead,
  onSelectNotification,
}) => {
  const recentItems = notifications.filter((n) => n.category === 'recent');
  const olderItems = notifications.filter((n) => n.category === 'older');
  const unreadCount = notifications.filter((n) => n.isUnread).length;

  return (
    <div className="pt-28 pb-32 max-w-md mx-auto px-6 relative z-10 animate-fadeIn space-y-6">
      {/* Title Header */}
      <div className="flex justify-between items-end mt-2">
        <div>
          <h1 className="text-3xl font-bold text-primary">Thông báo</h1>
          <p className="text-on-surface-variant text-sm mt-1 font-medium">
            Cập nhật mới nhất từ hệ thống
          </p>
        </div>
        {unreadCount > 0 && (
          <button
            onClick={onMarkAllAsRead}
            className="text-xs font-semibold text-primary hover:underline bg-white/30 backdrop-blur-md px-3 py-1.5 rounded-full border border-white/40 active:scale-95 transition-all"
          >
            Đọc tất cả ({unreadCount})
          </button>
        )}
      </div>

      {/* Notification Group: Gần đây */}
      <section className="space-y-3">
        <h2 className="text-xs font-bold text-primary tracking-widest uppercase pl-2 opacity-80">
          GẦN ĐÂY
        </h2>
        <div className="flex flex-col gap-4">
          {recentItems.map((item) => (
            <div
              key={item.id}
              onClick={() => {
                onMarkAsRead(item.id);
                onSelectNotification(item);
              }}
              className={`glass-card rounded-[24px] p-5 relative overflow-hidden group cursor-pointer border transition-all duration-300 hover:scale-[1.02] active:scale-[0.98] ${
                item.type === 'tuition'
                  ? 'border-error-container/60 shadow-[0_8px_24px_rgba(255,218,214,0.3)]'
                  : 'border-primary-container/80 shadow-[0_8px_24px_rgba(255,183,197,0.3)]'
              }`}
            >
              {/* Unread Glow background */}
              {item.isUnread && (
                <div
                  className={`absolute -left-4 -top-4 w-16 h-16 blur-2xl rounded-full opacity-80 ${
                    item.type === 'tuition' ? 'bg-error-container' : 'bg-primary-container'
                  }`}
                />
              )}

              <div className="flex gap-4 relative z-10">
                <div className="w-12 h-12 rounded-full bg-white/80 shadow-sm flex items-center justify-center shrink-0 border border-white">
                  <span
                    className={`material-symbols-outlined text-xl ${
                      item.type === 'tuition' ? 'text-error' : 'text-primary'
                    }`}
                    style={{ fontVariationSettings: "'FILL' 1" }}
                  >
                    {item.type === 'tuition' ? 'account_balance_wallet' : 'event_available'}
                  </span>
                </div>

                <div className="flex-1">
                  <div className="flex justify-between items-start mb-1">
                    <h3 className="text-base font-bold text-on-surface">{item.title}</h3>
                    <span
                      className={`text-xs font-semibold ${
                        item.type === 'tuition' ? 'text-error font-bold' : 'text-on-surface-variant opacity-75'
                      }`}
                    >
                      {item.timeAgo}
                    </span>
                  </div>
                  <p className="text-sm text-on-surface-variant leading-snug font-medium">
                    {item.content}
                  </p>
                </div>
              </div>
            </div>
          ))}
        </div>
      </section>

      {/* Notification Group: Cũ hơn */}
      <section className="space-y-3 pt-2">
        <h2 className="text-xs font-bold text-on-surface-variant tracking-widest uppercase pl-2 opacity-70">
          CŨ HƠN
        </h2>
        <div className="flex flex-col gap-4">
          {olderItems.map((item) => (
            <div
              key={item.id}
              onClick={() => {
                onMarkAsRead(item.id);
                onSelectNotification(item);
              }}
              className="glass-card rounded-[24px] p-5 relative overflow-hidden cursor-pointer border-white/40 transition-all duration-300 hover:scale-[1.01] active:scale-[0.98] opacity-85"
            >
              <div className="flex gap-4 relative z-10">
                <div className="w-12 h-12 rounded-full bg-white/50 shadow-sm flex items-center justify-center shrink-0 border border-white/30">
                  <span
                    className="material-symbols-outlined text-xl text-secondary"
                    style={{ fontVariationSettings: "'FILL' 0" }}
                  >
                    {item.type === 'registration' ? 'how_to_reg' : 'campaign'}
                  </span>
                </div>

                <div className="flex-1">
                  <div className="flex justify-between items-start mb-1">
                    <h3 className="text-base font-bold text-on-surface">{item.title}</h3>
                    <span className="text-xs text-on-surface-variant opacity-70 font-medium">
                      {item.timeAgo}
                    </span>
                  </div>
                  <p className="text-sm text-on-surface-variant leading-snug font-medium">
                    {item.content}
                  </p>
                </div>
              </div>
            </div>
          ))}
        </div>
      </section>
    </div>
  );
};
