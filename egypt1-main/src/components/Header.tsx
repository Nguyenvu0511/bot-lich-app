import React from 'react';
import { NavTab } from '../types';

interface HeaderProps {
  currentTab: NavTab;
  onOpenQR: () => void;
  onOpenSearch: () => void;
}

export const Header: React.FC<HeaderProps> = ({ currentTab, onOpenQR, onOpenSearch }) => {
  return (
    <header className="fixed top-4 left-4 right-4 rounded-full h-16 bg-white/30 dark:bg-black/20 backdrop-blur-2xl border border-white/50 dark:border-white/10 shadow-[0_20px_40px_rgba(134,78,90,0.15)] flex items-center justify-between px-6 max-w-md mx-auto z-50 transition-all duration-300">
      <div className="flex items-center gap-2 cursor-pointer" onClick={onOpenQR} title="Xem Thẻ Sinh Viên / Mã QR">
        <span className="material-symbols-outlined text-primary dark:text-inverse-primary text-2xl font-bold" style={{ fontVariationSettings: "'FILL' 1" }}>
          {currentTab === 'settings' ? 'flutter_dash' : 'qr_code_2'}
        </span>
        <h1 className="text-xl font-bold text-primary dark:text-inverse-primary drop-shadow-[0_0_8px_rgba(134,78,90,0.4)] tracking-tight">
          MyDTU
        </h1>
      </div>

      <div className="flex items-center gap-2">
        {currentTab === 'weekly' && (
          <button 
            onClick={onOpenSearch}
            className="hover:bg-white/40 active:scale-95 transition-all rounded-full p-2 flex items-center justify-center text-primary dark:text-inverse-primary"
            title="Tìm kiếm môn học"
          >
            <span className="material-symbols-outlined">search</span>
          </button>
        )}

        <button 
          onClick={onOpenQR}
          className="hover:bg-white/40 active:scale-95 transition-all rounded-full p-2 flex items-center justify-center text-primary dark:text-inverse-primary"
          title="Mã QR Sinh viên"
        >
          <span className="material-symbols-outlined text-xl">qr_code_scanner</span>
        </button>
      </div>
    </header>
  );
};
