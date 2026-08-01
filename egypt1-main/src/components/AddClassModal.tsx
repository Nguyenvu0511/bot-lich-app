import React, { useState } from 'react';
import { TodayClass } from '../types';

interface AddClassModalProps {
  isOpen: boolean;
  onClose: () => void;
  onAdd: (newClass: TodayClass) => void;
}

export const AddClassModal: React.FC<AddClassModalProps> = ({ isOpen, onClose, onAdd }) => {
  const [title, setTitle] = useState('');
  const [time, setTime] = useState('07:00 - 09:15');
  const [location, setLocation] = useState('Phòng P.101');
  const [shift, setShift] = useState<'Sáng' | 'Chiều' | 'Tối'>('Sáng');
  const [isOnline, setIsOnline] = useState(false);
  const [code, setCode] = useState('CS' + Math.floor(100 + Math.random() * 900));

  if (!isOpen) return null;

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (!title.trim()) return;

    onAdd({
      id: 'custom-' + Date.now(),
      title: title.trim(),
      time,
      location: isOnline ? 'Online' : location,
      shift,
      isOnline,
      completed: false,
      code,
      group: 'Nhóm 1',
    });

    // Reset
    setTitle('');
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

        <h3 className="text-xl font-bold text-on-surface">Thêm môn học hôm nay</h3>

        <form onSubmit={handleSubmit} className="space-y-3 text-sm">
          <div>
            <label className="block text-xs font-semibold text-on-surface-variant mb-1">
              Tên môn học
            </label>
            <input
              type="text"
              required
              placeholder="VD: Lập trình Web, Cơ sở dữ liệu..."
              value={title}
              onChange={(e) => setTitle(e.target.value)}
              className="w-full bg-white/50 border border-white/60 rounded-xl px-3 py-2 text-on-surface font-semibold focus:outline-none focus:ring-2 focus:ring-primary/50"
            />
          </div>

          <div className="grid grid-cols-2 gap-2">
            <div>
              <label className="block text-xs font-semibold text-on-surface-variant mb-1">
                Ca học
              </label>
              <select
                value={shift}
                onChange={(e) => setShift(e.target.value as any)}
                className="w-full bg-white/50 border border-white/60 rounded-xl px-3 py-2 text-on-surface font-semibold focus:outline-none"
              >
                <option value="Sáng">Sáng</option>
                <option value="Chiều">Chiều</option>
                <option value="Tối">Tối</option>
              </select>
            </div>

            <div>
              <label className="block text-xs font-semibold text-on-surface-variant mb-1">
                Khung giờ
              </label>
              <input
                type="text"
                value={time}
                onChange={(e) => setTime(e.target.value)}
                className="w-full bg-white/50 border border-white/60 rounded-xl px-3 py-2 text-on-surface font-semibold focus:outline-none"
              />
            </div>
          </div>

          <div className="flex items-center justify-between py-1">
            <span className="text-xs font-semibold text-on-surface-variant">Học Online</span>
            <button
              type="button"
              onClick={() => setIsOnline(!isOnline)}
              className={`w-10 h-6 rounded-full p-0.5 transition-colors duration-200 ${
                isOnline ? 'bg-primary-container' : 'bg-gray-300'
              }`}
            >
              <div
                className={`w-5 h-5 rounded-full bg-white shadow-md transform transition-transform ${
                  isOnline ? 'translate-x-4' : 'translate-x-0'
                }`}
              />
            </button>
          </div>

          {!isOnline && (
            <div>
              <label className="block text-xs font-semibold text-on-surface-variant mb-1">
                Phòng học / Cơ sở
              </label>
              <input
                type="text"
                value={location}
                onChange={(e) => setLocation(e.target.value)}
                className="w-full bg-white/50 border border-white/60 rounded-xl px-3 py-2 text-on-surface font-semibold focus:outline-none"
              />
            </div>
          )}

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
              Thêm Lịch Học
            </button>
          </div>
        </form>
      </div>
    </div>
  );
};
