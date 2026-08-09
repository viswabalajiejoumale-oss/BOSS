import React from 'react';
import {
  ArrowLeft,
  TrendingUp,
  Zap,
  DollarSign,
  Leaf,
  Cpu,
  BarChart2,
  Activity,
  Calendar,
  Sparkles,
  ShieldCheck,
} from 'lucide-react';
import {
  BarChart,
  Bar,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  ResponsiveContainer,
  AreaChart,
  Area,
} from 'recharts';

interface AnalyticsPageProps {
  onBack: () => void;
}

import { BackgroundSystem } from '@/components/ui/BackgroundSystem';
import { ThemeToggle } from '@/components/ui/ThemeToggle';

// Sample weekly energy consumption data (Mon - Sun)
const weeklyConsumptionData = [
  { day: 'Mon', kwh: 24.5, cost: 122.5, offPeak: 18.5 },
  { day: 'Tue', kwh: 32.0, cost: 160.0, offPeak: 26.0 },
  { day: 'Wed', kwh: 18.2, cost: 91.0, offPeak: 14.2 },
  { day: 'Thu', kwh: 28.8, cost: 144.0, offPeak: 22.8 },
  { day: 'Fri', kwh: 35.4, cost: 177.0, offPeak: 29.4 },
  { day: 'Sat', kwh: 21.6, cost: 108.0, offPeak: 17.6 },
  { day: 'Sun', kwh: 24.0, cost: 120.0, offPeak: 19.0 },
];

// Sample 24-hour charging load profile data
const loadProfileData = [
  { hour: '00:00', kw: 7.2, gridLoad: 35 },
  { hour: '03:00', kw: 11.0, gridLoad: 28 },
  { hour: '06:00', kw: 3.5, gridLoad: 52 },
  { hour: '09:00', kw: 0.0, gridLoad: 88 },
  { hour: '12:00', kw: 0.0, gridLoad: 92 },
  { hour: '15:00', kw: 0.0, gridLoad: 85 },
  { hour: '18:00', kw: 2.1, gridLoad: 95 },
  { hour: '21:00', kw: 7.2, gridLoad: 68 },
  { hour: '23:00', kw: 11.0, gridLoad: 42 },
];

// Tariff comparison data
const tariffComparisonData = [
  { period: 'Off-Peak (11pm-6am)', rate: 4.5, usage: 142.5 },
  { period: 'Normal (6am-6pm)', rate: 6.5, usage: 32.0 },
  { period: 'Peak (6pm-11pm)', rate: 9.0, usage: 10.0 },
];

export const AnalyticsPage: React.FC<AnalyticsPageProps> = ({ onBack }) => {
  return (
    <BackgroundSystem variant="dashboard">
      {/* TOP HEADER BAR */}
      <header className="sticky top-0 z-40 border-b border-slate-200/80 dark:border-slate-800/80 bg-white/90 dark:bg-slate-950/80 backdrop-blur-xl px-4 lg:px-8 py-3.5 shadow-lg text-slate-900 dark:text-slate-100">
        <div className="max-w-7xl mx-auto flex items-center justify-between">
          {/* Back Button */}
          <button
            onClick={onBack}
            className="boss-btn-ghost text-xs font-bold px-4 py-2 cursor-pointer"
          >
            <ArrowLeft className="h-4 w-4 text-emerald-500" />
            <span>Back to Dashboard</span>
          </button>

          {/* Page Branding */}
          <div className="flex items-center gap-2.5">
            <div className="flex h-9 w-9 items-center justify-center rounded-xl bg-emerald-500/20 border border-emerald-500/40 text-emerald-500 shadow-md">
              <TrendingUp className="h-5 w-5" />
            </div>
            <div>
              <h1 className="text-base font-black tracking-tight text-slate-900 dark:text-white flex items-center gap-2">
                ENERGY TELEMETRY ANALYTICS <span className="text-[10px] font-bold text-emerald-700 dark:text-emerald-400 bg-emerald-500/15 border border-emerald-500/30 px-2 py-0.5 rounded-md">LIVE RECHARTS</span>
              </h1>
              <p className="text-[11px] font-semibold text-slate-600 dark:text-slate-400 hidden sm:block">
                Power Consumption, CO₂ Savings & Off-Peak Cost Breakdown
              </p>
            </div>
          </div>
          <ThemeToggle />

          {/* Status Badge */}
          <div className="hidden md:flex items-center gap-2 rounded-full border border-emerald-300 bg-emerald-100/90 px-3.5 py-1.5 text-xs font-bold text-emerald-800 shadow-sm">
            <span className="h-2.5 w-2.5 rounded-full bg-emerald-600 animate-pulse" />
            <span>DISCOM LIVE TELEMETRY</span>
          </div>
        </div>
      </header>

      {/* MAIN CONTENT */}
      <main className="flex-1 max-w-7xl w-full mx-auto p-4 sm:p-6 lg:p-8 space-y-6">

        {/* TOP 4 AI METRIC CARDS GRID */}
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">

          {/* Metric 1: Total Energy */}
          <div className="boss-card p-5 bg-white dark:bg-[#111F1C] border border-emerald-500/30 shadow-md rounded-2xl flex items-center justify-between">
            <div>
              <span className="text-xs text-slate-600 dark:text-slate-400 font-semibold block">Weekly Energy Delivered</span>
              <span className="font-mono text-2xl font-black text-slate-900 dark:text-white">184.5 kWh</span>
              <span className="text-[11px] text-emerald-600 dark:text-emerald-400 font-bold block mt-0.5 flex items-center gap-1">
                <TrendingUp className="h-3 w-3" /> +14.2% vs last week
              </span>
            </div>
            <div className="h-12 w-12 rounded-2xl bg-emerald-500/15 text-emerald-600 dark:text-emerald-400 flex items-center justify-center shadow-sm">
              <Zap className="h-6 w-6" />
            </div>
          </div>

          {/* Metric 2: Estimated Cost */}
          <div className="boss-card p-5 bg-white dark:bg-[#111F1C] border border-emerald-500/30 shadow-md rounded-2xl flex items-center justify-between">
            <div>
              <span className="text-xs text-slate-600 dark:text-slate-400 font-semibold block">Total Estimated Spend</span>
              <span className="font-mono text-2xl font-black text-slate-900 dark:text-white">₹922.50</span>
              <span className="text-[11px] text-emerald-600 dark:text-emerald-400 font-bold block mt-0.5">
                -₹185 off-peak savings
              </span>
            </div>
            <div className="h-12 w-12 rounded-2xl bg-blue-500/15 text-blue-600 dark:text-blue-400 flex items-center justify-center shadow-sm">
              <DollarSign className="h-6 w-6" />
            </div>
          </div>

          {/* Metric 3: Off-Peak Green Energy */}
          <div className="boss-card p-5 bg-white dark:bg-[#111F1C] border border-emerald-500/30 shadow-md rounded-2xl flex items-center justify-between">
            <div>
              <span className="text-xs text-slate-600 dark:text-slate-400 font-semibold block">Off-Peak Green Power</span>
              <span className="font-mono text-2xl font-black text-emerald-700 dark:text-emerald-400">78.4%</span>
              <span className="text-[11px] text-emerald-600 dark:text-emerald-400 font-bold block mt-0.5">
                Low Transformer Stress
              </span>
            </div>
            <div className="h-12 w-12 rounded-2xl bg-teal-500/15 text-teal-600 dark:text-teal-400 flex items-center justify-center shadow-sm">
              <Leaf className="h-6 w-6" />
            </div>
          </div>

          {/* Metric 4: AI Grid Score */}
          <div className="boss-card p-5 bg-white dark:bg-[#111F1C] border border-emerald-500/30 shadow-md rounded-2xl flex items-center justify-between">
            <div>
              <span className="text-xs text-slate-600 dark:text-slate-400 font-semibold block">AI Grid Score</span>
              <span className="font-mono text-2xl font-black text-slate-900 dark:text-white">96.8%</span>
              <span className="text-[11px] text-emerald-600 dark:text-emerald-400 font-bold block mt-0.5">
                Optimal Load Balancing
              </span>
            </div>
            <div className="h-12 w-12 rounded-2xl bg-amber-500/15 text-amber-600 dark:text-amber-400 flex items-center justify-center shadow-sm">
              <Cpu className="h-6 w-6" />
            </div>
          </div>

        </div>

        {/* MAIN SPLIT CHARTS & GRAPHICS GRID */}
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 items-start">

          {/* LEFT COLUMN: INTERACTIVE BAR & AREA CHARTS */}
          <div className="space-y-6">

            {/* 1. WEEKLY ENERGY CONSUMPTION BAR CHART */}
            <div className="boss-card p-6 bg-white dark:bg-[#111F1C] border border-slate-200 dark:border-slate-800 shadow-xl rounded-3xl space-y-4 text-slate-900 dark:text-white">
              <div className="flex items-center justify-between">
                <div className="flex items-center gap-2">
                  <BarChart2 className="h-5 w-5 text-emerald-600 dark:text-emerald-400" />
                  <h2 className="font-extrabold text-base text-slate-900 dark:text-white">Weekly Energy Consumption (kWh)</h2>
                </div>
                <span className="text-xs font-bold text-slate-600 dark:text-slate-400 flex items-center gap-1">
                  <Calendar className="h-3.5 w-3.5 text-emerald-600 dark:text-emerald-400" /> Mon — Sun Breakdown
                </span>
              </div>

              <div className="h-64 w-full">
                <ResponsiveContainer width="100%" height="100%">
                  <BarChart data={weeklyConsumptionData} margin={{ top: 10, right: 10, left: -20, bottom: 0 }}>
                    <CartesianGrid strokeDasharray="3 3" stroke="rgba(148, 163, 184, 0.2)" />
                    <XAxis dataKey="day" stroke="#94a3b8" fontSize={12} fontWeight="bold" />
                    <YAxis stroke="#94a3b8" fontSize={12} fontWeight="bold" />
                    <Tooltip
                      contentStyle={{
                        background: 'var(--card)',
                        border: '1px solid var(--border)',
                        borderRadius: 12,
                        color: 'var(--foreground)',
                        boxShadow: '0 10px 15px -3px rgba(0,0,0,0.3)',
                      }}
                      formatter={(value: any) => [`${value} kWh`, 'Energy Delivered']}
                    />
                    <Bar dataKey="kwh" fill="#10b981" radius={[8, 8, 0, 0]} name="Energy (kWh)" />
                    <Bar dataKey="offPeak" fill="#34d399" radius={[8, 8, 0, 0]} name="Off-Peak Energy (kWh)" />
                  </BarChart>
                </ResponsiveContainer>
              </div>

              <div className="flex items-center justify-center gap-6 pt-2 text-xs font-bold border-t border-slate-200 dark:border-slate-800 text-slate-700 dark:text-slate-300">
                <div className="flex items-center gap-2">
                  <span className="h-3 w-3 rounded bg-emerald-600 inline-block" />
                  <span>Total Daily kWh</span>
                </div>
                <div className="flex items-center gap-2">
                  <span className="h-3 w-3 rounded bg-emerald-400 inline-block" />
                  <span>Off-Peak kWh (Green Tariff)</span>
                </div>
              </div>
            </div>

            {/* 2. 24-HOUR CHARGING LOAD VS DISCOM GRID AREA CHART */}
            <div className="boss-card p-6 bg-white dark:bg-[#111F1C] border border-slate-200 dark:border-slate-800 shadow-xl rounded-3xl space-y-4 text-slate-900 dark:text-white">
              <div className="flex items-center justify-between">
                <div className="flex items-center gap-2">
                  <Activity className="h-5 w-5 text-blue-600 dark:text-blue-400" />
                  <h2 className="font-extrabold text-base text-slate-900 dark:text-white">24-Hour Charging Load Profile (kW)</h2>
                </div>
                <span className="text-xs font-bold text-emerald-700 dark:text-emerald-400 bg-emerald-500/15 px-2.5 py-1 rounded-full border border-emerald-500/30">
                  AI Smart Shift Active
                </span>
              </div>

              <div className="h-56 w-full">
                <ResponsiveContainer width="100%" height="100%">
                  <AreaChart data={loadProfileData} margin={{ top: 10, right: 10, left: -20, bottom: 0 }}>
                    <defs>
                      <linearGradient id="colorKw" x1="0" y1="0" x2="0" y2="1">
                        <stop offset="5%" stopColor="#10b981" stopOpacity={0.4} />
                        <stop offset="95%" stopColor="#10b981" stopOpacity={0} />
                      </linearGradient>
                    </defs>
                    <CartesianGrid strokeDasharray="3 3" stroke="rgba(148, 163, 184, 0.2)" />
                    <XAxis dataKey="hour" stroke="#94a3b8" fontSize={11} fontWeight="bold" />
                    <YAxis stroke="#94a3b8" fontSize={11} fontWeight="bold" />
                    <Tooltip
                      contentStyle={{
                        background: 'var(--card)',
                        border: '1px solid var(--border)',
                        borderRadius: 12,
                        color: 'var(--foreground)',
                      }}
                    />
                    <Area type="monotone" dataKey="kw" stroke="#10b981" strokeWidth={3} fillOpacity={1} fill="url(#colorKw)" name="Charging Power (kW)" />
                  </AreaChart>
                </ResponsiveContainer>
              </div>
            </div>

          </div>

          {/* RIGHT COLUMN: BOSS ANALYTICS VISUAL & TARIFF BREAKDOWN */}
          <div className="space-y-6">

            {/* BOSS ANALYTICS VISUAL CARD */}
            <div className="boss-card relative flex flex-col items-center justify-center p-6 lg:p-8 overflow-hidden rounded-3xl border-emerald-500/30 bg-white dark:bg-[#111F1C] text-slate-900 dark:text-white shadow-xl min-h-[400px]">
              {/* Subtle Ambient Emerald Glow */}
              <div className="absolute inset-0 bg-[radial-gradient(ellipse_at_center,_var(--tw-gradient-stops))] from-emerald-500/15 via-teal-500/5 to-transparent blur-2xl pointer-events-none" />

              {/* Top Overlay Tag */}
              <div className="absolute top-6 left-6 flex items-center gap-2 rounded-full border border-emerald-500/30 bg-emerald-500/15 backdrop-blur-md px-3.5 py-1.5 text-xs font-bold text-emerald-700 dark:text-emerald-400 shadow-sm">
                <Sparkles className="h-3.5 w-3.5 text-amber-500" />
                <span>BOSS SMART GRID ANALYTICS</span>
              </div>

              {/* STATIC ANALYTICS IMAGE */}
              <div className="relative z-10 my-auto flex items-center justify-center w-full pt-6">
                <img
                  src="/boss-analytics-transparent.png"
                  alt="BOSS Analytics Visual"
                  onError={(e) => {
                    (e.target as HTMLImageElement).src = '/boss-analytics.jpeg';
                  }}
                  className="max-h-[340px] lg:max-h-[380px] w-auto max-w-full object-contain filter drop-shadow-[0_15px_30px_rgba(16,185,129,0.3)]"
                />
              </div>

              {/* Bottom Strip */}
              <div className="relative z-10 w-full mt-4 grid grid-cols-3 gap-3 pt-4 border-t border-slate-200 dark:border-slate-800 text-center text-xs">
                <div className="rounded-xl bg-slate-100 dark:bg-slate-900 p-2 border border-slate-200 dark:border-slate-800">
                  <span className="text-[10px] text-slate-500 dark:text-slate-400 block uppercase font-bold">Transformer Load</span>
                  <span className="font-extrabold text-emerald-700 dark:text-emerald-400">42% (Safe)</span>
                </div>
                <div className="rounded-xl bg-slate-100 dark:bg-slate-900 p-2 border border-slate-200 dark:border-slate-800">
                  <span className="text-[10px] text-slate-500 dark:text-slate-400 block uppercase font-bold">Grid Power Source</span>
                  <span className="font-extrabold text-slate-900 dark:text-white">DISCOM Smart Grid</span>
                </div>
                <div className="rounded-xl bg-slate-100 dark:bg-slate-900 p-2 border border-slate-200 dark:border-slate-800">
                  <span className="text-[10px] text-slate-500 dark:text-slate-400 block uppercase font-bold">Carbon Offset</span>
                  <span className="font-extrabold text-emerald-700 dark:text-emerald-400">142 kg CO₂</span>
                </div>
              </div>
            </div>

            {/* TARIFF RATE COMPARISON BAR CHART */}
            <div className="boss-card p-6 bg-white dark:bg-[#111F1C] border border-slate-200 dark:border-slate-800 shadow-xl rounded-3xl space-y-4 text-slate-900 dark:text-white">
              <div className="flex items-center justify-between">
                <div className="flex items-center gap-2">
                  <ShieldCheck className="h-5 w-5 text-emerald-600 dark:text-emerald-400" />
                  <h2 className="font-extrabold text-base text-slate-900 dark:text-white">Tariff Rate Breakdown (₹/kWh)</h2>
                </div>
              </div>

              <div className="h-44 w-full">
                <ResponsiveContainer width="100%" height="100%">
                  <BarChart data={tariffComparisonData} layout="vertical" margin={{ top: 5, right: 20, left: 40, bottom: 5 }}>
                    <CartesianGrid strokeDasharray="3 3" stroke="rgba(148, 163, 184, 0.2)" />
                    <XAxis type="number" stroke="#94a3b8" fontSize={11} fontWeight="bold" />
                    <YAxis type="category" dataKey="period" stroke="#94a3b8" fontSize={10} fontWeight="bold" width={110} />
                    <Tooltip contentStyle={{ background: 'var(--card)', border: '1px solid var(--border)', borderRadius: 12, color: 'var(--foreground)' }} />
                    <Bar dataKey="rate" fill="#10b981" radius={[0, 8, 8, 0]} name="Rate (₹/kWh)" />
                  </BarChart>
                </ResponsiveContainer>
              </div>
            </div>

            {/* AI SMART GRID RECOMMENDATION BOX */}
            <div className="rounded-2xl border border-emerald-500/30 bg-emerald-500/10 p-4 text-xs">
              <div className="flex items-start gap-2.5">
                <Sparkles className="h-5 w-5 text-emerald-700 dark:text-emerald-400 shrink-0 mt-0.5" />
                <div>
                  <h4 className="font-extrabold text-sm text-slate-900 dark:text-white mb-0.5">
                    BOSS AI Energy Optimization Advisory
                  </h4>
                  <p className="text-slate-700 dark:text-slate-300 leading-relaxed font-medium">
                    By shifting 78.4% of your charging sessions to off-peak hours (11:00 PM – 06:00 AM), you saved ₹185.00 this week while reducing peak-hour grid frequency stress on the DISCOM transformer.
                  </p>
                </div>
              </div>
            </div>

          </div>

        </div>
      </main>
    </BackgroundSystem>
  );
};
