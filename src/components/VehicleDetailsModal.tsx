import React, { useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import {
  X,
  Zap,
  ShieldCheck,
  Cpu,
  Gauge,
  Thermometer,
  BatteryCharging,
  Activity,
  Sparkles,
  Info,
  CheckCircle2,
  AlertCircle,
  Wrench,
} from 'lucide-react';
import type { Profile } from '@/types';

interface VehicleDetailsModalProps {
  isOpen: boolean;
  onClose: () => void;
  profile: Profile | null;
}

export const VehicleDetailsModal: React.FC<VehicleDetailsModalProps> = ({
  isOpen,
  onClose,
  profile,
}) => {
  const [activeTab, setActiveTab] = useState<'diagnostics' | 'specs' | 'aiService'>('diagnostics');

  if (!isOpen) return null;

  const vehicleMake = profile?.vehicle_make || 'Tesla';
  const vehicleModel = profile?.vehicle_model || 'Model 3 Performance';
  const vehicleYear = profile?.vehicle_year || 2024;
  const batteryCap = profile?.battery_capacity_kwh || 75;
  const licenseNo = profile?.license_no || 'KA 05 EV 2026';

  return (
    <AnimatePresence>
      <div className="fixed inset-0 z-50 flex items-center justify-center p-4 sm:p-6 md:p-8">
        {/* Backdrop */}
        <motion.div
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          exit={{ opacity: 0 }}
          onClick={onClose}
          className="fixed inset-0 bg-slate-900/75 backdrop-blur-md transition-opacity"
        />

        {/* Modal Window */}
        <motion.div
          initial={{ opacity: 0, scale: 0.95, y: 20 }}
          animate={{ opacity: 1, scale: 1, y: 0 }}
          exit={{ opacity: 0, scale: 0.95, y: 20 }}
          transition={{ type: 'spring', damping: 25, stiffness: 300 }}
          className="relative z-10 w-full max-w-5xl overflow-hidden rounded-3xl border border-slate-200/80 bg-white/95 shadow-2xl backdrop-blur-2xl dark:border-slate-800 dark:bg-slate-900/95 max-h-[90vh] flex flex-col"
        >
          {/* Header */}
          <div className="flex items-center justify-between border-b border-slate-200/80 px-6 py-4 dark:border-slate-800 bg-slate-50/80 dark:bg-slate-850/80">
            <div className="flex items-center gap-3">
              <div className="flex h-10 w-10 items-center justify-center rounded-2xl bg-emerald-500/10 text-emerald-600 dark:bg-emerald-500/20 dark:text-emerald-400">
                <Sparkles className="h-5 w-5" />
              </div>
              <div>
                <div className="flex items-center gap-2">
                  <h3 className="font-extrabold text-lg text-slate-900 dark:text-white">
                    {vehicleMake} {vehicleModel}
                  </h3>
                  <span className="rounded-full bg-emerald-100 px-2.5 py-0.5 text-xs font-bold text-emerald-700 dark:bg-emerald-950/80 dark:text-emerald-300 border border-emerald-300 dark:border-emerald-800">
                    AI SYNCED
                  </span>
                </div>
                <p className="text-xs font-medium text-slate-500 dark:text-slate-400">
                  Real-time Vehicle Diagnostics & Battery Health Intelligence
                </p>
              </div>
            </div>

            <button
              onClick={onClose}
              className="rounded-full p-2 text-slate-400 hover:bg-slate-200/60 hover:text-slate-600 dark:hover:bg-slate-800 dark:hover:text-slate-200 transition-colors"
            >
              <X className="h-5 w-5" />
            </button>
          </div>

          {/* Modal Content Split View */}
          <div className="grid grid-cols-1 gap-6 p-6 md:grid-cols-2 overflow-y-auto">
            {/* LEFT HALF: VEHICLE GRAPHIC & TELEMETRY */}
            <div className="flex flex-col justify-between rounded-2xl border border-slate-200/60 bg-gradient-to-b from-slate-50 via-emerald-50/20 to-slate-100/50 p-6 dark:border-slate-800/60 dark:from-slate-850 dark:via-slate-900 dark:to-slate-900 shadow-inner">
              <div>
                <div className="flex items-center justify-between mb-2">
                  <span className="text-xs font-extrabold tracking-wider text-slate-400 uppercase">
                    Vehicle Visual Spec
                  </span>
                  <span className="inline-flex items-center gap-1 text-xs font-bold text-emerald-600 bg-emerald-100/80 dark:bg-emerald-900/40 px-2.5 py-1 rounded-full border border-emerald-300/40">
                    <span className="h-2 w-2 rounded-full bg-emerald-500 animate-pulse" />
                    LIVE TELEMETRY
                  </span>
                </div>

                {/* Animated Vehicle Image Showcase */}
                <div className="relative my-4 flex h-64 items-center justify-center overflow-hidden rounded-2xl bg-gradient-to-tr from-emerald-500/5 via-teal-500/10 to-emerald-500/5 dark:from-slate-800/50 dark:to-slate-800/30 border border-slate-200/40 dark:border-slate-750">
                  {/* Radial Background Glow */}
                  <div className="absolute inset-0 bg-[radial-gradient(ellipse_at_center,_var(--tw-gradient-stops))] from-emerald-400/20 via-transparent to-transparent opacity-80 blur-xl" />

                  {/* Floating Transparent Car Graphic */}
                  <motion.img
                    src="/boss-vehicle-transparent.png"
                    alt="BOSS EV Vehicle"
                    initial={{ y: 10, opacity: 0 }}
                    animate={{ y: [0, -8, 0], opacity: 1 }}
                    transition={{
                      y: { repeat: Infinity, duration: 4, ease: 'easeInOut' },
                      opacity: { duration: 0.5 },
                    }}
                    onError={(e) => {
                      // Fallback if transparent PNG isn't loaded
                      (e.target as HTMLImageElement).src = '/boss-vehicle.jpeg';
                    }}
                    className="relative z-10 max-h-56 max-w-full object-contain drop-shadow-[0_15px_25px_rgba(16,185,129,0.3)]"
                  />
                </div>
              </div>

              {/* Quick Specs Badges */}
              <div className="grid grid-cols-3 gap-2 text-center pt-2">
                <div className="rounded-xl border border-slate-200/80 bg-white/80 p-2.5 shadow-sm dark:border-slate-800 dark:bg-slate-800/80 backdrop-blur-sm">
                  <BatteryCharging className="mx-auto h-4 w-4 text-emerald-600 mb-1" />
                  <span className="block text-[11px] text-slate-500 font-medium">State of Charge</span>
                  <span className="font-extrabold text-sm text-slate-900 dark:text-white">82%</span>
                </div>
                <div className="rounded-xl border border-slate-200/80 bg-white/80 p-2.5 shadow-sm dark:border-slate-800 dark:bg-slate-800/80 backdrop-blur-sm">
                  <Zap className="mx-auto h-4 w-4 text-amber-500 mb-1" />
                  <span className="block text-[11px] text-slate-500 font-medium">Battery Pack</span>
                  <span className="font-extrabold text-sm text-slate-900 dark:text-white">{batteryCap} kWh</span>
                </div>
                <div className="rounded-xl border border-slate-200/80 bg-white/80 p-2.5 shadow-sm dark:border-slate-800 dark:bg-slate-800/80 backdrop-blur-sm">
                  <ShieldCheck className="mx-auto h-4 w-4 text-blue-500 mb-1" />
                  <span className="block text-[11px] text-slate-500 font-medium">Fast Charge</span>
                  <span className="font-extrabold text-sm text-slate-900 dark:text-white">CCS2 150kW</span>
                </div>
              </div>
            </div>

            {/* RIGHT HALF: LICENSE PLATE & AI DETAILS */}
            <div className="flex flex-col space-y-5">
              {/* AUTHENTIC INDIAN EV LICENSE NUMBER PLATE */}
              <div className="rounded-2xl border-2 border-slate-300 bg-slate-100 p-3 shadow-md dark:border-slate-700 dark:bg-slate-800">
                <div className="text-[11px] font-bold text-slate-500 uppercase tracking-wider mb-1.5 flex items-center justify-between">
                  <span>Registered EV Number Plate</span>
                  <span className="text-emerald-600 dark:text-emerald-400 font-extrabold">BHARAT EV STANDARD</span>
                </div>
                
                {/* Metallic Green Indian EV License Plate Component */}
                <div className="relative flex items-center justify-between rounded-xl border-2 border-emerald-800 bg-emerald-600 px-4 py-3 shadow-lg overflow-hidden">
                  {/* License Plate Left Strip (IND + Chakra Emblem) */}
                  <div className="flex items-center gap-2 border-r border-emerald-400/40 pr-3">
                    <div className="flex flex-col items-center justify-center text-white">
                      <span className="text-[10px] font-black tracking-widest text-amber-300">IND</span>
                      {/* Ashok Chakra Emblem Circle */}
                      <div className="h-4 w-4 rounded-full border border-amber-300/80 flex items-center justify-center">
                        <div className="h-2 w-2 rounded-full bg-amber-300" />
                      </div>
                    </div>
                  </div>

                  {/* License Number Text */}
                  <div className="flex-1 text-center font-mono text-2xl md:text-3xl font-black tracking-widest text-white drop-shadow-[0_2px_4px_rgba(0,0,0,0.5)]">
                    {licenseNo}
                  </div>

                  {/* EV Green Tag Badge */}
                  <div className="rounded bg-emerald-950/60 px-2 py-0.5 text-[10px] font-extrabold text-emerald-300 border border-emerald-400/30">
                    CLEAN EV
                  </div>
                </div>
              </div>

              {/* AI HEALTH SCORE CARD */}
              <div className="flex items-center justify-between rounded-2xl border border-emerald-200 bg-emerald-50/70 p-4 dark:border-emerald-900/50 dark:bg-emerald-950/30">
                <div className="flex items-center gap-3">
                  <div className="flex h-11 w-11 items-center justify-center rounded-2xl bg-emerald-600 text-white shadow-md">
                    <Cpu className="h-6 w-6 animate-pulse" />
                  </div>
                  <div>
                    <h4 className="font-extrabold text-sm text-slate-900 dark:text-white">
                      AI Health Score: 98.4%
                    </h4>
                    <p className="text-xs text-slate-600 dark:text-slate-400">
                      Optimal cell balance • Zero thermal anomalies detected
                    </p>
                  </div>
                </div>
                <span className="rounded-full bg-emerald-600 px-3 py-1 text-xs font-bold text-white shadow">
                  EXCELLENT
                </span>
              </div>

              {/* NAVIGATION TABS FOR DETAILED AI METRICS */}
              <div className="flex rounded-xl bg-slate-100 p-1 dark:bg-slate-800">
                <button
                  onClick={() => setActiveTab('diagnostics')}
                  className={`flex-1 rounded-lg py-2 text-xs font-extrabold transition-all ${
                    activeTab === 'diagnostics'
                      ? 'bg-white text-slate-900 shadow dark:bg-slate-900 dark:text-white'
                      : 'text-slate-500 hover:text-slate-900 dark:hover:text-white'
                  }`}
                >
                  AI Diagnostics
                </button>
                <button
                  onClick={() => setActiveTab('specs')}
                  className={`flex-1 rounded-lg py-2 text-xs font-extrabold transition-all ${
                    activeTab === 'specs'
                      ? 'bg-white text-slate-900 shadow dark:bg-slate-900 dark:text-white'
                      : 'text-slate-500 hover:text-slate-900 dark:hover:text-white'
                  }`}
                >
                  Battery Specs
                </button>
                <button
                  onClick={() => setActiveTab('aiService')}
                  className={`flex-1 rounded-lg py-2 text-xs font-extrabold transition-all ${
                    activeTab === 'aiService'
                      ? 'bg-white text-slate-900 shadow dark:bg-slate-900 dark:text-white'
                      : 'text-slate-500 hover:text-slate-900 dark:hover:text-white'
                  }`}
                >
                  AI Predictive Care
                </button>
              </div>

              {/* TAB CONTENT PANELS */}
              <div className="rounded-2xl border border-slate-200/80 bg-white p-4 shadow-sm dark:border-slate-800 dark:bg-slate-900 flex-1">
                {activeTab === 'diagnostics' && (
                  <div className="space-y-3">
                    <div className="flex justify-between items-center text-xs pb-2 border-b border-slate-100 dark:border-slate-800">
                      <span className="text-slate-500 font-medium flex items-center gap-1.5">
                        <Activity className="h-4 w-4 text-emerald-500" /> Real-world Est. Range
                      </span>
                      <span className="font-bold text-slate-900 dark:text-white">450 km (City/Hwy)</span>
                    </div>
                    <div className="flex justify-between items-center text-xs pb-2 border-b border-slate-100 dark:border-slate-800">
                      <span className="text-slate-500 font-medium flex items-center gap-1.5">
                        <Thermometer className="h-4 w-4 text-blue-500" /> Battery Temp
                      </span>
                      <span className="font-bold text-emerald-600 dark:text-emerald-400">28.5°C (Optimal)</span>
                    </div>
                    <div className="flex justify-between items-center text-xs pb-2 border-b border-slate-100 dark:border-slate-800">
                      <span className="text-slate-500 font-medium flex items-center gap-1.5">
                        <Gauge className="h-4 w-4 text-amber-500" /> Degradation Rate
                      </span>
                      <span className="font-bold text-slate-900 dark:text-white">1.1% / year (Industry Best)</span>
                    </div>
                    <div className="flex justify-between items-center text-xs">
                      <span className="text-slate-500 font-medium flex items-center gap-1.5">
                        <CheckCircle2 className="h-4 w-4 text-emerald-500" /> Regenerative Braking
                      </span>
                      <span className="font-bold text-emerald-600 dark:text-emerald-400">94.2% Efficiency</span>
                    </div>
                  </div>
                )}

                {activeTab === 'specs' && (
                  <div className="space-y-3">
                    <div className="flex justify-between items-center text-xs pb-2 border-b border-slate-100 dark:border-slate-800">
                      <span className="text-slate-500 font-medium">Nominal Voltage</span>
                      <span className="font-bold text-slate-900 dark:text-white">400V High Voltage Architecture</span>
                    </div>
                    <div className="flex justify-between items-center text-xs pb-2 border-b border-slate-100 dark:border-slate-800">
                      <span className="text-slate-500 font-medium">AC Home Charge Rate</span>
                      <span className="font-bold text-slate-900 dark:text-white">11.0 kW (3-Phase)</span>
                    </div>
                    <div className="flex justify-between items-center text-xs pb-2 border-b border-slate-100 dark:border-slate-800">
                      <span className="text-slate-500 font-medium">10% to 80% DC Fast Time</span>
                      <span className="font-bold text-emerald-600 dark:text-emerald-400">28 minutes</span>
                    </div>
                    <div className="flex justify-between items-center text-xs">
                      <span className="text-slate-500 font-medium">Manufacturer Year</span>
                      <span className="font-bold text-slate-900 dark:text-white">{vehicleYear}</span>
                    </div>
                  </div>
                )}

                {activeTab === 'aiService' && (
                  <div className="space-y-3">
                    <div className="flex justify-between items-center text-xs pb-2 border-b border-slate-100 dark:border-slate-800">
                      <span className="text-slate-500 font-medium flex items-center gap-1.5">
                        <Wrench className="h-4 w-4 text-blue-500" /> Next Scheduled Service
                      </span>
                      <span className="font-bold text-slate-900 dark:text-white">In 8,400 km</span>
                    </div>
                    <div className="flex justify-between items-center text-xs pb-2 border-b border-slate-100 dark:border-slate-800">
                      <span className="text-slate-500 font-medium flex items-center gap-1.5">
                        <Info className="h-4 w-4 text-emerald-500" /> Tire Health Score
                      </span>
                      <span className="font-bold text-emerald-600 dark:text-emerald-400">89% Good</span>
                    </div>
                    <div className="flex justify-between items-center text-xs">
                      <span className="text-slate-500 font-medium flex items-center gap-1.5">
                        <AlertCircle className="h-4 w-4 text-amber-500" /> Coolant Fluid Level
                      </span>
                      <span className="font-bold text-slate-900 dark:text-white">Normal (Checked today)</span>
                    </div>
                  </div>
                )}
              </div>

              {/* AI COPILOT SMART CHARGING INSIGHT */}
              <div className="rounded-xl border border-emerald-300/60 bg-gradient-to-r from-emerald-500/10 via-teal-500/10 to-emerald-500/10 p-3 text-xs text-slate-700 dark:text-slate-300">
                <div className="flex items-start gap-2">
                  <Sparkles className="h-4 w-4 text-emerald-600 dark:text-emerald-400 shrink-0 mt-0.5" />
                  <div>
                    <span className="font-extrabold text-slate-900 dark:text-white">
                      BOSS AI Charging Recommendation:
                    </span>{' '}
                    Plug in during off-peak hours (11:00 PM – 06:00 AM) to optimize DISCOM grid frequency and unlock green tariff rewards!
                  </div>
                </div>
              </div>
            </div>
          </div>
        </motion.div>
      </div>
    </AnimatePresence>
  );
};
