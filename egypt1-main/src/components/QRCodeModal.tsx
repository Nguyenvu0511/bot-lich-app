import React from 'react';
import { UserProfile } from '../types';

interface QRCodeModalProps {
  isOpen: boolean;
  onClose: () => void;
  profile: UserProfile;
}

export const QRCodeModal: React.FC<QRCodeModalProps> = ({ isOpen, onClose, profile }) => {
  if (!isOpen) return null;

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/50 backdrop-blur-md animate-fadeIn">
      <div className="liquid-glass rounded-3xl p-6 max-w-xs w-full relative text-center space-y-4 shadow-2xl border border-white/60">
        <button
          onClick={onClose}
          className="absolute top-4 right-4 w-8 h-8 rounded-full bg-white/40 flex items-center justify-center text-on-surface hover:bg-white/60"
        >
          <span className="material-symbols-outlined text-sm font-bold">close</span>
        </button>

        <div className="flex items-center justify-center gap-2 pt-2">
          <span className="material-symbols-outlined text-primary text-2xl" style={{ fontVariationSettings: "'FILL' 1" }}>
            qr_code_2
          </span>
          <span className="font-bold text-primary text-lg">Thẻ Sinh Viên MyDTU</span>
        </div>

        {/* QR Code graphic */}
        <div className="bg-white p-4 rounded-2xl shadow-inner mx-auto w-48 h-48 flex items-center justify-center border border-white/80">
          <svg className="w-full h-full" viewBox="0 0 100 100" fill="none">
            <rect width="100" height="100" fill="white" />
            <path
              d="M10 10h30v30H10zM16 16v18h18V16zM22 22h6v6h-6zM60 10h30v30H60zM66 16v18h18V16zM72 22h6v6h-6zM10 60h30v30H10zM16 66v18h18V16zM22 72h6v6h-6zM50 10h5v15h-5zM45 30h10v5h-10zM55 45h10v10h-10zM70 50h20v5h-20zM45 60h15v10h-15zM75 65h15v20h-15zM50 75h15v15h-15z"
              fill="#864e5a"
            />
          </svg>
        </div>

        <div className="space-y-1 text-sm font-medium">
          <p className="font-bold text-base text-on-surface">{profile.name}</p>
          <p className="text-xs text-primary font-bold">MSSV: {profile.studentId}</p>
          <p className="text-xs text-on-surface-variant">{profile.department}</p>
          <p className="text-xs text-on-surface-variant font-semibold">Lớp: {profile.classGroup}</p>
        </div>

        <button
          onClick={onClose}
          className="w-full glass-button-primary rounded-full py-2.5 text-xs font-bold text-on-primary-container hover:scale-105 transition-all mt-2"
        >
          Đóng
        </button>
      </div>
    </div>
  );
};
