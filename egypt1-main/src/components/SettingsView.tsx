import React from 'react';
import { UserProfile, UserSettings } from '../types';

interface SettingsViewProps {
  profile: UserProfile;
  settings: UserSettings;
  onUpdateSettings: (newSettings: Partial<UserSettings>) => void;
  onEditProfile: () => void;
  onOpenQR: () => void;
  onLogout: () => void;
}

export const SettingsView: React.FC<SettingsViewProps> = ({
  profile,
  settings,
  onUpdateSettings,
  onEditProfile,
  onOpenQR,
  onLogout,
}) => {
  return (
    <div className="pt-28 pb-32 max-w-md mx-auto px-6 relative z-10 space-y-7 animate-fadeIn">
      <h1 className="text-3xl font-bold text-on-surface">Cài đặt</h1>

      {/* Profile Card */}
      <section className="glass-panel rounded-3xl p-6 flex flex-col items-center text-center shadow-md relative overflow-hidden">
        <div className="relative mb-4 cursor-pointer group" onClick={onEditProfile}>
          <div className="w-24 h-24 rounded-full p-1 bg-gradient-to-tr from-primary-container to-secondary-container relative z-10 shadow-lg">
            <img
              className="w-full h-full rounded-full object-cover transition-transform group-hover:scale-105"
              alt="Hồ sơ sinh viên"
              src={profile.avatarUrl}
            />
          </div>
          {/* Glass circle highlight around avatar */}
          <div className="absolute -inset-3 rounded-full border border-white/40 bg-white/10 backdrop-blur-md z-0 animate-pulse" />
          <div className="absolute bottom-1 right-1 z-20 bg-primary text-white rounded-full p-1.5 shadow-md">
            <span className="material-symbols-outlined text-xs">edit</span>
          </div>
        </div>

        <h2 className="text-xl font-bold text-on-surface">{profile.name}</h2>
        <p className="text-sm font-medium text-on-surface-variant mt-0.5">{profile.email}</p>
        <p className="text-xs text-primary font-semibold mt-1">
          MSSV: {profile.studentId} • {profile.classGroup}
        </p>

        <div className="flex gap-3 mt-5">
          <button
            onClick={onEditProfile}
            className="glass-button-secondary rounded-full px-5 py-2 text-xs font-semibold text-primary hover:bg-white/40 transition-all active:scale-95 border border-white/50"
          >
            Chỉnh sửa hồ sơ
          </button>
          <button
            onClick={onOpenQR}
            className="glass-button-primary rounded-full px-4 py-2 text-xs font-semibold text-on-primary-container hover:scale-105 transition-all active:scale-95 flex items-center gap-1.5"
          >
            <span className="material-symbols-outlined text-sm">qr_code</span>
            <span>Thẻ SV</span>
          </button>
        </div>
      </section>

      {/* Preferences Section */}
      <section className="space-y-3">
        <h3 className="text-lg font-bold text-on-surface pl-2">Tuỳ chọn</h3>
        <div className="glass-panel rounded-2xl flex flex-col overflow-hidden divide-y divide-white/20 shadow-sm">
          {/* Toggle Notification */}
          <div className="flex items-center justify-between p-4">
            <div className="flex items-center gap-3 text-on-surface">
              <span className="material-symbols-outlined text-primary">notifications</span>
              <span className="text-base font-semibold">Thông báo</span>
            </div>
            <button
              onClick={() => onUpdateSettings({ notificationsEnabled: !settings.notificationsEnabled })}
              className={`w-12 h-7 rounded-full p-1 transition-colors duration-300 relative ${
                settings.notificationsEnabled ? 'bg-primary-container' : 'bg-gray-300'
              }`}
            >
              <div
                className={`w-5 h-5 rounded-full bg-white shadow-md transform transition-transform duration-300 ${
                  settings.notificationsEnabled ? 'translate-x-5' : 'translate-x-0'
                }`}
              />
            </button>
          </div>

          {/* Toggle Language */}
          <div
            onClick={() =>
              onUpdateSettings({
                language: settings.language === 'Tiếng Việt' ? 'English' : 'Tiếng Việt',
              })
            }
            className="flex items-center justify-between p-4 hover:bg-white/10 transition-colors cursor-pointer"
          >
            <div className="flex items-center gap-3 text-on-surface">
              <span className="material-symbols-outlined text-primary">language</span>
              <span className="text-base font-semibold">Ngôn ngữ</span>
            </div>
            <div className="flex items-center gap-1.5 text-on-surface-variant text-sm font-semibold">
              <span>{settings.language}</span>
              <span className="material-symbols-outlined text-sm">chevron_right</span>
            </div>
          </div>

          {/* Toggle Theme */}
          <div
            onClick={() =>
              onUpdateSettings({
                theme: settings.theme === 'Sáng' ? 'Tối' : 'Sáng',
              })
            }
            className="flex items-center justify-between p-4 hover:bg-white/10 transition-colors cursor-pointer"
          >
            <div className="flex items-center gap-3 text-on-surface">
              <span className="material-symbols-outlined text-primary">palette</span>
              <span className="text-base font-semibold">Giao diện</span>
            </div>
            <div className="flex items-center gap-1.5 text-on-surface-variant text-sm font-semibold">
              <span>{settings.theme}</span>
              <span className="material-symbols-outlined text-sm">chevron_right</span>
            </div>
          </div>
        </div>
      </section>

      {/* Advanced Section */}
      <section className="space-y-3">
        <h3 className="text-lg font-bold text-on-surface pl-2">Nâng cao</h3>
        <div className="glass-panel rounded-2xl flex flex-col overflow-hidden divide-y divide-white/20 shadow-sm">
          <div
            onClick={() => alert('Tính năng bảo mật: Tài khoản MyDTU được bảo mật 2 lớp bởi Đại học Duy Tân.')}
            className="flex items-center justify-between p-4 hover:bg-white/10 transition-colors cursor-pointer"
          >
            <div className="flex items-center gap-3 text-on-surface">
              <span className="material-symbols-outlined text-primary">lock</span>
              <span className="text-base font-semibold">Bảo mật</span>
            </div>
            <span className="material-symbols-outlined text-on-surface-variant text-sm">chevron_right</span>
          </div>

          <div
            onClick={() => alert('Tổng đài hỗ trợ MyDTU: 0236.3650403 (Phòng Hợp tác & Quản lý Sinh viên)')}
            className="flex items-center justify-between p-4 hover:bg-white/10 transition-colors cursor-pointer"
          >
            <div className="flex items-center gap-3 text-on-surface">
              <span className="material-symbols-outlined text-primary">help</span>
              <span className="text-base font-semibold">Trợ giúp & Hỗ trợ</span>
            </div>
            <span className="material-symbols-outlined text-on-surface-variant text-sm">chevron_right</span>
          </div>
        </div>
      </section>

      {/* Logout Button */}
      <div className="pt-2 pb-6 flex justify-center">
        <button
          onClick={onLogout}
          className="glass-button-danger rounded-full px-8 py-3.5 flex items-center gap-2 text-error w-full justify-center font-bold active:scale-95 transition-all"
        >
          <span className="material-symbols-outlined">logout</span>
          <span>Đăng xuất</span>
        </button>
      </div>
    </div>
  );
};
