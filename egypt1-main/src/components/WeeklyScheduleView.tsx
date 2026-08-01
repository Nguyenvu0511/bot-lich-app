import React, { useState } from 'react';
import { WeeklyClass } from '../types';
import { weekDaysList } from '../data/mockData';

interface WeeklyScheduleViewProps {
  weeklyClasses: WeeklyClass[];
  onSelectClass: (item: WeeklyClass) => void;
}

export const WeeklyScheduleView: React.FC<WeeklyScheduleViewProps> = ({
  weeklyClasses,
  onSelectClass,
}) => {
  // Default selected day is Wednesday (26 - index 2) to match screenshot 4
  const [selectedDayIndex, setSelectedDayIndex] = useState<number>(2);

  const filteredClasses = weeklyClasses.filter((c) => c.dayIndex === selectedDayIndex);
  const currentDayInfo = weekDaysList.find((d) => d.dayIndex === selectedDayIndex);

  return (
    <div className="pt-28 pb-32 max-w-md mx-auto md:max-w-4xl px-4 flex flex-col gap-6 relative z-10 animate-fadeIn">
      {/* Header Section */}
      <section className="flex flex-col gap-1">
        <h2 className="text-3xl font-bold text-primary">Lịch Tuần</h2>
        <p className="text-base text-on-surface-variant font-medium">Tuần 12: 24/04 - 30/04</p>
      </section>

      {/* Days Tabs (Horizontal scroll) */}
      <section className="-mx-4 px-4 overflow-x-auto no-scrollbar pb-2">
        <div className="flex gap-3 min-w-max py-1">
          {weekDaysList.map((day) => {
            const isSelected = day.dayIndex === selectedDayIndex;
            return (
              <button
                key={day.dayIndex}
                onClick={() => setSelectedDayIndex(day.dayIndex)}
                className={`transition-all duration-300 rounded-full px-5 py-3 flex flex-col items-center gap-1 active:scale-95 ${
                  isSelected
                    ? 'bg-primary-container text-on-primary-container shadow-[0_0_20px_rgba(255,183,197,0.5)] scale-105 border border-white/50 font-bold'
                    : 'liquid-glass text-on-surface-variant hover:bg-white/40'
                }`}
              >
                <span className={`text-xs uppercase tracking-widest ${isSelected ? 'font-bold' : 'font-semibold'}`}>
                  {day.name}
                </span>
                <span className="text-base font-bold">{day.date}</span>
              </button>
            );
          })}
        </div>
      </section>

      {/* Classes List */}
      <section className="flex flex-col gap-5">
        <div className="flex items-center justify-between text-xs font-semibold uppercase tracking-wider text-on-surface-variant/80 px-1">
          <span>{currentDayInfo?.full} ({currentDayInfo?.date}/04)</span>
          <span>{filteredClasses.length} môn học</span>
        </div>

        {filteredClasses.length === 0 ? (
          <div className="liquid-glass-card p-8 rounded-3xl text-center text-on-surface-variant">
            <span className="material-symbols-outlined text-4xl text-primary mb-2">event_busy</span>
            <p className="font-semibold text-lg">Không có lịch học vào ngày này</p>
            <p className="text-sm mt-1">Bạn có thể dùng thời gian này để tự học hoặc thư giãn.</p>
          </div>
        ) : (
          filteredClasses.map((item) => (
            <article
              key={item.id}
              onClick={() => onSelectClass(item)}
              className="liquid-glass-card p-6 flex flex-col gap-4 relative overflow-hidden group cursor-pointer hover:scale-[1.01] active:scale-[0.99] transition-all duration-300 shadow-md"
            >
              {/* Subtle background blur glow inside card */}
              <div className="absolute -top-10 -right-10 w-32 h-32 bg-primary-container/30 rounded-full blur-2xl z-0 pointer-events-none group-hover:scale-125 transition-transform" />

              <div className="relative z-10 flex justify-between items-start">
                <div>
                  {item.status === 'ĐANG DIỄN RA' && (
                    <div className="flex items-center gap-2 mb-1.5">
                      <span className="w-2.5 h-2.5 rounded-full bg-primary animate-ping" />
                      <span className="w-2.5 h-2.5 rounded-full bg-primary absolute" />
                      <span className="text-xs text-primary font-bold tracking-wider ml-1">
                        ĐANG DIỄN RA
                      </span>
                    </div>
                  )}
                  <h3 className="text-xl font-bold text-on-surface">{item.title}</h3>
                  <p className="text-sm text-on-surface-variant font-medium mt-0.5">
                    {item.code} • {item.group}
                  </p>
                </div>

                <div className="liquid-glass rounded-full p-3 flex items-center justify-center text-primary shadow-sm">
                  <span className="material-symbols-outlined filled text-xl">
                    {item.iconType === 'laptop_mac'
                      ? 'laptop_mac'
                      : item.iconType === 'database'
                      ? 'database'
                      : item.iconType === 'language'
                      ? 'language'
                      : 'book'}
                  </span>
                </div>
              </div>

              <hr className="border-white/20 my-0.5" />

              <div className="relative z-10 flex flex-col gap-2.5 text-sm text-on-surface font-medium">
                <div className="flex items-center gap-3">
                  <span className="material-symbols-outlined text-secondary text-lg">schedule</span>
                  <span>{item.time}</span>
                </div>

                <div className="flex items-center gap-3">
                  <span className="material-symbols-outlined text-secondary text-lg">
                    {item.isOnline ? 'link' : 'location_on'}
                  </span>
                  {item.isOnline ? (
                    <span className="font-semibold text-primary underline decoration-primary/30 underline-offset-4">
                      {item.location}
                    </span>
                  ) : (
                    <span className="font-semibold">{item.location}</span>
                  )}
                </div>

                <div className="flex items-center gap-3">
                  <span className="material-symbols-outlined text-secondary text-lg">person</span>
                  <span className="text-on-surface-variant">{item.instructor}</span>
                </div>
              </div>
            </article>
          ))
        )}
      </section>
    </div>
  );
};
