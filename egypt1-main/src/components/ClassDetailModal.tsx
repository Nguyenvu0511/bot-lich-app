import React from 'react';

interface ClassDetailModalProps {
  item: any | null;
  onClose: () => void;
  onToggleComplete?: (id: string) => void;
}

export const ClassDetailModal: React.FC<ClassDetailModalProps> = ({
  item,
  onClose,
  onToggleComplete,
}) => {
  if (!item) return null;

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/40 backdrop-blur-md animate-fadeIn">
      <div className="liquid-glass rounded-3xl p-6 max-w-sm w-full relative overflow-hidden shadow-2xl border border-white/60 space-y-5">
        <button
          onClick={onClose}
          className="absolute top-4 right-4 w-8 h-8 rounded-full bg-white/40 flex items-center justify-center text-on-surface hover:bg-white/60 transition-all"
        >
          <span className="material-symbols-outlined text-sm font-bold">close</span>
        </button>

        <div className="space-y-1">
          <span className="inline-block px-3 py-1 bg-primary-container/80 text-on-primary-container text-xs font-bold rounded-full">
            {item.code || 'Môn học'} {item.group ? `• ${item.group}` : ''}
          </span>
          <h3 className="text-2xl font-bold text-on-surface">{item.title}</h3>
          {item.status && (
            <p className="text-xs font-bold text-primary tracking-wider uppercase mt-1">
              Trạng thái: {item.status}
            </p>
          )}
        </div>

        <div className="space-y-3 bg-white/30 backdrop-blur-md rounded-2xl p-4 border border-white/40 text-sm font-medium text-on-surface">
          <div className="flex items-center gap-3">
            <span className="material-symbols-outlined text-secondary">schedule</span>
            <div>
              <p className="text-xs text-on-surface-variant font-semibold">Thời gian</p>
              <p className="font-bold">{item.time}</p>
            </div>
          </div>

          <div className="flex items-center gap-3">
            <span className="material-symbols-outlined text-secondary">location_on</span>
            <div>
              <p className="text-xs text-on-surface-variant font-semibold">Địa điểm / Phòng học</p>
              <p className="font-bold">{item.location}</p>
            </div>
          </div>

          <div className="flex items-center gap-3">
            <span className="material-symbols-outlined text-secondary">person</span>
            <div>
              <p className="text-xs text-on-surface-variant font-semibold">Giảng viên hướng dẫn</p>
              <p className="font-bold">{item.instructor || 'Nguyễn Văn A'}</p>
            </div>
          </div>
        </div>

        {item.isOnline && (
          <a
            href={item.onlineLink || 'https://teams.microsoft.com'}
            target="_blank"
            rel="noopener noreferrer"
            className="w-full glass-button-primary rounded-full py-3 flex items-center justify-center gap-2 text-on-primary-container font-bold text-sm shadow-md hover:scale-105 transition-all"
          >
            <span className="material-symbols-outlined">videocam</span>
            <span>Vào lớp trực tuyến (Microsoft Teams)</span>
          </a>
        )}

        <div className="flex gap-3">
          {onToggleComplete && item.id && (
            <button
              onClick={() => {
                onToggleComplete(item.id);
                onClose();
              }}
              className="flex-1 glass-button-secondary rounded-full py-2.5 text-xs font-bold text-primary border border-primary/30 hover:bg-primary-container/30 transition-all"
            >
              {item.completed ? 'Đánh dấu chưa học' : 'Đã hoàn thành'}
            </button>
          )}

          <button
            onClick={onClose}
            className="flex-1 bg-white/60 hover:bg-white/80 rounded-full py-2.5 text-xs font-bold text-on-surface transition-all"
          >
            Đóng
          </button>
        </div>
      </div>
    </div>
  );
};
