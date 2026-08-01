import React, { useState } from 'react';
import { UserProfile } from '../types';

interface EditProfileModalProps {
  isOpen: boolean;
  onClose: () => void;
  profile: UserProfile;
  onSave: (updated: UserProfile) => void;
}

export const EditProfileModal: React.FC<EditProfileModalProps> = ({
  isOpen,
  onClose,
  profile,
  onSave,
}) => {
  const [formData, setFormData] = useState<UserProfile>(profile);

  if (!isOpen) return null;

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    onSave(formData);
    onClose();
  };

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/50 backdrop-blur-md animate-fadeIn">
      <div className="liquid-glass rounded-3xl p-6 max-w-sm w-full relative space-y-4 shadow-2xl border border-white/60">
        <button
          onClick={onClose}
          className="absolute top-4 right-4 w-8 h-8 rounded-full bg-white/40 flex items-center justify-center text-on-surface hover:bg-white/60"
        >
          <span className="material-symbols-outlined text-sm font-bold">close</span>
        </button>

        <h3 className="text-xl font-bold text-on-surface">Chỉnh sửa hồ sơ</h3>

        <form onSubmit={handleSubmit} className="space-y-3 text-sm">
          <div>
            <label className="block text-xs font-semibold text-on-surface-variant mb-1">
              Họ và tên
            </label>
            <input
              type="text"
              required
              value={formData.name}
              onChange={(e) => setFormData({ ...formData, name: e.target.value })}
              className="w-full bg-white/50 border border-white/60 rounded-xl px-3 py-2 text-on-surface font-semibold focus:outline-none focus:ring-2 focus:ring-primary/50"
            />
          </div>

          <div>
            <label className="block text-xs font-semibold text-on-surface-variant mb-1">
              Email
            </label>
            <input
              type="email"
              required
              value={formData.email}
              onChange={(e) => setFormData({ ...formData, email: e.target.value })}
              className="w-full bg-white/50 border border-white/60 rounded-xl px-3 py-2 text-on-surface font-semibold focus:outline-none focus:ring-2 focus:ring-primary/50"
            />
          </div>

          <div>
            <label className="block text-xs font-semibold text-on-surface-variant mb-1">
              Mã số sinh viên (MSSV)
            </label>
            <input
              type="text"
              required
              value={formData.studentId}
              onChange={(e) => setFormData({ ...formData, studentId: e.target.value })}
              className="w-full bg-white/50 border border-white/60 rounded-xl px-3 py-2 text-on-surface font-semibold focus:outline-none focus:ring-2 focus:ring-primary/50"
            />
          </div>

          <div>
            <label className="block text-xs font-semibold text-on-surface-variant mb-1">
              Lớp sinh hoạt
            </label>
            <input
              type="text"
              required
              value={formData.classGroup}
              onChange={(e) => setFormData({ ...formData, classGroup: e.target.value })}
              className="w-full bg-white/50 border border-white/60 rounded-xl px-3 py-2 text-on-surface font-semibold focus:outline-none focus:ring-2 focus:ring-primary/50"
            />
          </div>

          <div>
            <label className="block text-xs font-semibold text-on-surface-variant mb-1">
              Link Ảnh Đại Diện (Avatar)
            </label>
            <input
              type="text"
              value={formData.avatarUrl}
              onChange={(e) => setFormData({ ...formData, avatarUrl: e.target.value })}
              className="w-full bg-white/50 border border-white/60 rounded-xl px-3 py-2 text-on-surface font-semibold focus:outline-none focus:ring-2 focus:ring-primary/50 text-xs"
            />
          </div>

          <div className="flex gap-2 pt-2">
            <button
              type="button"
              onClick={onClose}
              className="flex-1 bg-white/50 hover:bg-white/80 rounded-full py-2.5 font-bold text-xs text-on-surface"
            >
              Hủy
            </button>
            <button
              type="submit"
              className="flex-1 glass-button-primary rounded-full py-2.5 font-bold text-xs text-on-primary-container hover:scale-105 transition-all"
            >
              Lưu thay đổi
            </button>
          </div>
        </form>
      </div>
    </div>
  );
};
