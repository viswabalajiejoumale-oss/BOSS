import React from 'react';
import { motion } from 'framer-motion';
import { Sparkles, Zap, ShieldCheck } from 'lucide-react';

interface BossMascotMessageProps {
  message: string;
  subtext?: string;
  variant?: 'optimal' | 'alert' | 'success' | 'info';
  actionLabel?: string;
  onAction?: () => void;
  className?: string;
}

export const BossMascotMessage: React.FC<BossMascotMessageProps> = ({
  message,
  subtext,
  variant = 'optimal',
  actionLabel,
  onAction,
  className = '',
}) => {
  const borderColors = {
    optimal: 'border-emerald-500/40 bg-emerald-500/10 text-emerald-800 dark:text-emerald-300',
    alert: 'border-amber-500/40 bg-amber-500/10 text-amber-800 dark:text-amber-300',
    success: 'border-blue-500/40 bg-blue-500/10 text-blue-800 dark:text-blue-300',
    info: 'border-slate-300 dark:border-slate-800 bg-white dark:bg-slate-900/80 text-slate-800 dark:text-slate-200',
  };

  return (
    <motion.div
      initial={{ opacity: 0, y: 10 }}
      animate={{ opacity: 1, y: 0 }}
      className={`rounded-2xl border p-4 backdrop-blur-xl shadow-lg flex items-center gap-4 ${borderColors[variant]} ${className}`}
    >
      <div className="relative shrink-0 flex items-center justify-center p-1.5 rounded-full bg-slate-950/60 border border-emerald-500/30">
        <img
          src="/boss-logo-transparent.png"
          alt="BOSS Mascot Assistant"
          className="h-10 w-10 object-contain drop-shadow-md"
        />
        <span className="absolute -top-0.5 -right-0.5 flex h-2.5 w-2.5">
          <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-emerald-400 opacity-75" />
          <span className="relative inline-flex rounded-full h-2.5 w-2.5 bg-emerald-500" />
        </span>
      </div>

      <div className="flex-1 min-w-0">
        <div className="flex items-center gap-1.5 mb-0.5">
          <span className="text-[10px] font-extrabold uppercase tracking-wider text-emerald-400 flex items-center gap-1">
            <Sparkles className="h-3 w-3" /> BOSS INTELLIGENCE
          </span>
        </div>
        <p className="text-xs font-black text-slate-900 dark:text-white leading-tight">
          {message}
        </p>
        {subtext && (
          <p className="text-[11px] text-slate-600 dark:text-slate-400 mt-1 font-medium leading-relaxed">
            {subtext}
          </p>
        )}
      </div>

      {actionLabel && onAction && (
        <button
          onClick={onAction}
          className="shrink-0 boss-btn-primary px-3 py-1.5 text-xs rounded-xl font-bold cursor-pointer"
        >
          {actionLabel}
        </button>
      )}
    </motion.div>
  );
};
