import React, { useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { Bell, Zap, ShieldCheck, AlertTriangle, Check, X } from 'lucide-react';

export interface NotificationItem {
  id: string;
  title: string;
  message: string;
  time: string;
  type: 'info' | 'warning' | 'success';
  read: boolean;
}

const INITIAL_NOTIFICATIONS: NotificationItem[] = [
  {
    id: 'n1',
    title: '⚡ Optimal Slot Available',
    message: 'Grid load dropped to 32% near BOSS Charging Hub. Charging now saves ₹42.',
    time: '2 mins ago',
    type: 'success',
    read: false,
  },
  {
    id: 'n2',
    title: '🛡️ Grid Protection Active',
    message: 'Substation Feeder #4 load rebalanced automatically. Peak stress reduced.',
    time: '15 mins ago',
    type: 'info',
    read: false,
  },
  {
    id: 'n3',
    title: '⏰ Slot Reminder',
    message: 'Your 1-hour pre-booked charging window starts at 6:30 PM today.',
    time: '1 hour ago',
    type: 'info',
    read: true,
  },
];

export const NotificationCenter: React.FC = () => {
  const [isOpen, setIsOpen] = useState(false);
  const [items, setItems] = useState<NotificationItem[]>(INITIAL_NOTIFICATIONS);

  const unreadCount = items.filter((i) => !i.read).length;

  const markAllAsRead = () => {
    setItems((prev) => prev.map((item) => ({ ...item, read: true })));
  };

  const removeNotification = (id: string) => {
    setItems((prev) => prev.filter((item) => item.id !== id));
  };

  return (
    <div className="relative">
      <button
        onClick={() => setIsOpen(!isOpen)}
        className="relative boss-btn-ghost text-xs cursor-pointer py-2 border-slate-700/80 hover:border-emerald-500/50 hover:text-white"
        title="View Notifications"
      >
        <Bell className="h-4 w-4" />
        {unreadCount > 0 && (
          <span className="absolute -right-1 -top-1 flex h-4 w-4 items-center justify-center rounded-full bg-emerald-500 text-[10px] font-black text-slate-950">
            {unreadCount}
          </span>
        )}
      </button>

      <AnimatePresence>
        {isOpen && (
          <motion.div
            initial={{ opacity: 0, scale: 0.95, y: 10 }}
            animate={{ opacity: 1, scale: 1, y: 0 }}
            exit={{ opacity: 0, scale: 0.95, y: 10 }}
            className="absolute right-0 mt-2 w-80 sm:w-96 rounded-2xl border border-slate-300 dark:border-slate-800 bg-white dark:bg-[#111F1C] shadow-2xl p-4 z-50 text-left text-slate-900 dark:text-white"
          >
            <div className="flex items-center justify-between border-b border-slate-200 dark:border-slate-800 pb-3 mb-3">
              <div className="flex items-center gap-2">
                <span className="font-extrabold text-sm text-slate-900 dark:text-white">Grid Notifications</span>
                {unreadCount > 0 && (
                  <span className="boss-badge-green text-[10px]">{unreadCount} New</span>
                )}
              </div>
              {unreadCount > 0 && (
                <button
                  onClick={markAllAsRead}
                  className="text-[11px] font-bold text-emerald-600 dark:text-emerald-400 hover:underline cursor-pointer"
                >
                  Mark all read
                </button>
              )}
            </div>

            <div className="space-y-3 max-h-72 overflow-y-auto pr-1">
              {items.length === 0 ? (
                <p className="text-xs text-slate-500 dark:text-slate-400 text-center py-4">No notifications</p>
              ) : (
                items.map((item) => (
                  <div
                    key={item.id}
                    className={`p-3 rounded-xl border transition-all relative ${
                      item.read
                        ? 'border-slate-200 dark:border-slate-800 bg-slate-50 dark:bg-slate-900/40 text-slate-600 dark:text-slate-400'
                        : 'border-emerald-500/30 bg-emerald-500/10 text-slate-900 dark:text-slate-100 font-semibold'
                    }`}
                  >
                    <div className="flex items-start justify-between gap-2">
                      <h5 className="text-xs font-black text-slate-900 dark:text-white">{item.title}</h5>
                      <button
                        onClick={() => removeNotification(item.id)}
                        className="text-slate-400 hover:text-slate-600 dark:hover:text-slate-200"
                      >
                        <X className="h-3.5 w-3.5" />
                      </button>
                    </div>
                    <p className="text-[11px] text-slate-700 dark:text-slate-300 leading-snug mt-1">{item.message}</p>
                    <span className="text-[10px] text-slate-500 dark:text-slate-400 mt-2 block">{item.time}</span>
                  </div>
                ))
              )}
            </div>
          </motion.div>
        )}
      </AnimatePresence>
    </div>
  );
};
