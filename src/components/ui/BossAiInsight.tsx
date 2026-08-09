import React from 'react';
import { motion } from 'framer-motion';
import { Sparkles, ArrowRight, Zap, TrendingUp } from 'lucide-react';

interface BossAiInsightProps {
  title: string;
  description: string;
  impactText?: string;
  actionText?: string;
  onAction?: () => void;
  className?: string;
}

export const BossAiInsight: React.FC<BossAiInsightProps> = ({
  title,
  description,
  impactText,
  actionText = 'Apply Smart Schedule →',
  onAction,
  className = '',
}) => {
  return (
    <motion.div
      initial={{ opacity: 0, y: 12 }}
      animate={{ opacity: 1, y: 0 }}
      className={`rounded-2xl border border-emerald-500/30 bg-emerald-500/10 dark:bg-gradient-to-r dark:from-emerald-950/40 dark:via-slate-900/90 dark:to-blue-950/40 p-5 backdrop-blur-2xl shadow-lg text-slate-900 dark:text-white ${className}`}
    >
      <div className="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-4">
        <div className="space-y-1">
          <div className="inline-flex items-center gap-1.5 px-2.5 py-0.5 rounded-full bg-emerald-500/20 border border-emerald-500/30 text-emerald-700 dark:text-emerald-400 text-[10px] font-extrabold uppercase tracking-wider">
            <Sparkles className="h-3 w-3" /> BOSS AI INSIGHT
          </div>
          <h4 className="text-sm font-black text-slate-900 dark:text-white">{title}</h4>
          <p className="text-xs text-slate-700 dark:text-slate-300 font-medium leading-relaxed max-w-xl">
            {description}
          </p>
          {impactText && (
            <p className="text-xs font-bold text-emerald-700 dark:text-emerald-400 pt-1">
              ⚡ {impactText}
            </p>
          )}
        </div>

        {onAction && (
          <button
            onClick={onAction}
            className="boss-btn-primary text-xs font-extrabold px-4 py-2.5 rounded-xl border border-emerald-400/40 shadow-lg shrink-0 cursor-pointer flex items-center gap-1.5"
          >
            <span>{actionText}</span>
          </button>
        )}
      </div>
    </motion.div>
  );
};
