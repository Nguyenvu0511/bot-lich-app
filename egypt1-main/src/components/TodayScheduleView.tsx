import React from 'react';
import { TodayClass } from '../types';

interface TodayScheduleViewProps {
  classes: TodayClass[];
  onToggleComplete: (id: string) => void;
  onSelectClass: (item: TodayClass) => void;
  onAddClassModal: () => void;
}

export const TodayScheduleView: React.FC<TodayScheduleViewProps> = ({
  classes,
  onToggleComplete,
  onSelectClass,
  onAddClassModal,
}) => {
  const completedCount = classes.filter((c) => c.completed).length;
  const pendingCount = classes.length - completedCount;

  return (
    <div className="space-y-6 pt-24 pb-32 max-w-md mx-auto px-4 relative z-10 animate-fadeIn">
      {/* Welcome Section */}
      <section className="mt-4">
        <h2 className="text-3xl font-bold text-primary drop-shadow-md">Xin chào!</h2>
        <p className="text-lg text-on-surface-variant mt-1">Lịch học hôm nay của bạn</p>
      </section>

      {/* Class Cards */}
      <section className="space-y-5">
        {classes.length === 0 ? (
          <div className="liquid-glass rounded-2xl p-6 text-center text-on-surface-variant">
            <span className="material-symbols-outlined text-4xl text-primary mb-2">event_available</span>
            <p className="font-semibold">Hôm nay bạn không có lịch học nào!</p>
            <p className="text-sm mt-1">Hãy tận hưởng thời gian nghỉ ngơi hoặc ôn bài.</p>
          </div>
        ) : (
          classes.map((item) => (
            <article
              key={item.id}
              onClick={() => onSelectClass(item)}
              className={`liquid-glass rounded-3xl p-6 relative overflow-hidden cursor-pointer group transition-all duration-300 hover:scale-[1.02] active:scale-[0.98] ${
                item.completed ? 'opacity-70 bg-white/10' : ''
              }`}
            >
              {/* Pink accent line on left */}
              <div className="absolute top-0 left-0 w-1.5 h-full bg-primary-container shadow-[0_0_15px_rgba(255,183,197,0.8)]" />

              <div className="flex justify-between items-start mb-4">
                <div>
                  <span
                    className={`inline-block px-3 py-1 backdrop-blur-md rounded-full text-xs font-semibold mb-2 border border-white/40 ${
                      item.shift === 'Sáng'
                        ? 'bg-white/40 text-primary'
                        : item.shift === 'Chiều'
                        ? 'bg-secondary-container/60 text-secondary'
                        : 'bg-tertiary-container/60 text-tertiary'
                    }`}
                  >
                    {item.shift}
                  </span>
                  <h3
                    className={`text-xl font-bold text-on-surface transition-all ${
                      item.completed ? 'line-through text-on-surface-variant' : ''
                    }`}
                  >
                    {item.title}
                  </h3>
                </div>

                <div className="flex items-center gap-2">
                  <button
                    onClick={(e) => {
                      e.stopPropagation();
                      onToggleComplete(item.id);
                    }}
                    title={item.completed ? 'Mở lại môn này' : 'Đánh dấu đã hoàn thành'}
                    className={`w-9 h-9 rounded-full flex items-center justify-center transition-all ${
                      item.completed
                        ? 'bg-emerald-500 text-white shadow-md'
                        : 'bg-primary-container/50 border border-white/40 text-primary hover:scale-110'
                    }`}
                  >
                    <span className="material-symbols-outlined text-sm font-bold">
                      {item.completed ? 'check' : 'schedule'}
                    </span>
                  </button>
                </div>
              </div>

              <div className="space-y-2.5 text-base text-on-surface-variant font-medium">
                <div className="flex items-center gap-3">
                  <span className="material-symbols-outlined text-secondary text-xl">update</span>
                  <span>{item.time}</span>
                </div>
                <div className="flex items-center gap-3">
                  {item.isOnline ? (
                    <>
                      <span className="material-symbols-outlined text-secondary text-xl">videocam</span>
                      <span className="px-2.5 py-0.5 bg-tertiary-container/50 text-on-tertiary-container rounded-md text-sm font-semibold">
                        Online
                      </span>
                    </>
                  ) : (
                    <>
                      <span className="material-symbols-outlined text-secondary text-xl">location_on</span>
                      <span>{item.location}</span>
                    </>
                  )}
                </div>
              </div>
            </article>
          ))
        )}
      </section>

      {/* Quick Stats Widget */}
      <section className="grid grid-cols-2 gap-4 pt-2">
        <div className="liquid-glass rounded-2xl p-4 flex flex-col items-center justify-center text-center transition-transform hover:scale-105">
          <span className="material-symbols-outlined text-primary mb-1 text-3xl font-bold">task_alt</span>
          <span className="text-2xl font-bold text-on-surface">
            {completedCount}/{classes.length}
          </span>
          <span className="text-xs font-semibold text-on-surface-variant tracking-wider">Hoàn thành</span>
        </div>

        <div className="liquid-glass rounded-2xl p-4 flex flex-col items-center justify-center text-center transition-transform hover:scale-105">
          <span className="material-symbols-outlined text-secondary mb-1 text-3xl font-bold">pending_actions</span>
          <span className="text-2xl font-bold text-on-surface">{pendingCount}</span>
          <span className="text-xs font-semibold text-on-surface-variant tracking-wider">Sắp diễn ra</span>
        </div>
      </section>

      {/* Quick Action floating button */}
      <div className="pt-2 flex justify-center">
        <button
          onClick={onAddClassModal}
          className="glass-button-primary rounded-full px-6 py-2.5 flex items-center gap-2 text-on-primary-container font-semibold text-sm hover:scale-105 active:scale-95 transition-all shadow-lg"
        >
          <span className="material-symbols-outlined text-base">add</span>
          <span>Thêm môn học hôm nay</span>
        </button>
      </div>
    </div>
  );
};
