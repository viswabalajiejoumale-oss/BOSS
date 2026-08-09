import React from 'react';
import { Sun, Moon } from 'lucide-react';
import { useTheme, type ThemeMode } from '@/context/ThemeContext';

export const ThemeToggle: React.FC<{ className?: string }> = ({ className = '' }) => {
  const { theme, setTheme } = useTheme();

  const options: { mode: ThemeMode; label: string; icon: React.FC<{ className?: string }> }[] = [
    { mode: 'light', label: 'LIGHT', icon: Sun },
    { mode: 'dark', label: 'DARK', icon: Moon },
  ];

  return (
    <div className={`inline-flex items-center rounded-xl bg-slate-200/80 dark:bg-slate-900/90 p-1 border border-slate-300/80 dark:border-slate-800 backdrop-blur-md transition-colors duration-200 ${className}`}>
      {options.map(({ mode, label, icon: Icon }) => {
        const isActive = theme === mode;
        return (
          <button
            key={mode}
            onClick={() => setTheme(mode)}
            title={`Switch to ${label} theme`}
            className={`flex items-center gap-1.5 rounded-lg px-3 py-1.5 text-xs font-black tracking-wider transition-all duration-200 cursor-pointer ${
              isActive
                ? 'bg-emerald-600 text-white shadow-md shadow-emerald-600/30 scale-[1.02]'
                : 'text-slate-600 dark:text-slate-400 hover:text-slate-900 dark:hover:text-white'
            }`}
          >
            <Icon className="h-3.5 w-3.5" />
            <span>{label}</span>
          </button>
        );
      })}
    </div>
  );
};
