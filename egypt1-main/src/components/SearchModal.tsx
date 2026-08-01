import React, { useState } from 'react';
import { WeeklyClass } from '../types';

interface SearchModalProps {
  isOpen: boolean;
  onClose: () => void;
  weeklyClasses: WeeklyClass[];
  onSelectClass: (item: WeeklyClass) => void;
}

export const SearchModal: React.FC<SearchModalProps> = ({
  isOpen,
  onClose,
  weeklyClasses,
  onSelectClass,
}) => {
  const [query, setQuery] = useState('');

  if (!isOpen) return null;

  const filtered = query.trim()
    ? weeklyClasses.filter(
        (c) =>
          c.title.toLowerCase().includes(query.toLowerCase()) ||
          c.code.toLowerCase().includes(query.toLowerCase()) ||
          c.instructor.toLowerCase().includes(query.toLowerCase()) ||
          c.location.toLowerCase().includes(query.toLowerCase())
      )
    : weeklyClasses;

  return (
    <div className="fixed inset-0 z-50 flex items-start justify-center pt-20 px-4 bg-black/50 backdrop-blur-md animate-fadeIn">
      <div className="liquid-glass rounded-3xl p-5 max-w-md w-full relative space-y-4 shadow-2xl border border-white/60">
        <div className="flex items-center gap-2 bg-white/60 rounded-full px-4 py-2.5 border border-white/80 shadow-inner">
          <span className="material-symbols-outlined text-primary">search</span>
          <input
            type="text"
            autoFocus
            placeholder="Tìm môn học, phòng, mã môn, GV..."
            value={query}
            onChange={(e) => setQuery(e.target.value)}
            className="w-full bg-transparent border-none text-sm font-semibold text-on-surface focus:outline-none placeholder:text-on-surface-variant/60"
          />
          {query && (
            <button onClick={() => setQuery('')} className="text-on-surface-variant">
              <span className="material-symbols-outlined text-sm">close</span>
            </button>
          )}
        </div>

        <div className="max-h-80 overflow-y-auto no-scrollbar space-y-2">
          {filtered.length === 0 ? (
            <p className="text-center text-xs text-on-surface-variant py-6 font-medium">
              Không tìm thấy môn học nào khớp với từ khóa "{query}"
            </p>
          ) : (
            filtered.map((item) => (
              <div
                key={item.id}
                onClick={() => {
                  onSelectClass(item);
                  onClose();
                }}
                className="bg-white/40 hover:bg-white/70 p-3 rounded-2xl cursor-pointer transition-all flex items-center justify-between border border-white/40"
              >
                <div>
                  <p className="font-bold text-sm text-on-surface">{item.title}</p>
                  <p className="text-xs text-on-surface-variant">
                    {item.code} • {item.time} • {item.location}
                  </p>
                </div>
                <span className="material-symbols-outlined text-primary text-sm">chevron_right</span>
              </div>
            ))
          )}
        </div>

        <button
          onClick={onClose}
          className="w-full bg-white/50 hover:bg-white/80 rounded-full py-2 font-bold text-xs text-on-surface"
        >
          Đóng
        </button>
      </div>
    </div>
  );
};
