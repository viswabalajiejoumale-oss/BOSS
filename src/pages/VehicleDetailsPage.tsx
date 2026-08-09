import React from 'react';
import {
  ArrowLeft,
  Zap,
  ShieldCheck,
  Cpu,
  Gauge,
  Thermometer,
  RotateCcw,
  Sparkles,
  Activity,
  Car,
  Calendar,
  Layers,
  Award,
} from 'lucide-react';
import type { Profile } from '@/types';

interface VehicleDetailsPageProps {
  onBack: () => void;
  profile: Profile | null;
}

import { BackgroundSystem } from '@/components/ui/BackgroundSystem';
import { ThemeToggle } from '@/components/ui/ThemeToggle';

export const VehicleDetailsPage: React.FC<VehicleDetailsPageProps> = ({
  onBack,
  profile,
}) => {
  const vehicleMake = profile?.vehicle_make || 'Tesla';
  const vehicleModel = profile?.vehicle_model || 'Model 3 Performance';
  const vehicleYear = profile?.vehicle_year || 2024;
  const batteryCapKwh = profile?.battery_capacity_kwh || 75;
  const licenseNo = profile?.license_no || 'KA 05 EV 2026';

  return (
    <BackgroundSystem variant="dashboard">
      {/* TOP HEADER BAR */}
      <header className="sticky top-0 z-40 border-b border-slate-200/80 dark:border-slate-800/80 bg-white/90 dark:bg-slate-950/80 backdrop-blur-xl px-4 lg:px-8 py-3.5 shadow-lg text-slate-900 dark:text-slate-100">
        <div className="max-w-7xl mx-auto flex items-center justify-between">
          {/* Back Button */}
          <button
            onClick={onBack}
            className="inline-flex items-center gap-2 rounded-xl border border-slate-700 bg-slate-800/60 px-4 py-2 text-xs font-bold text-slate-200 hover:bg-slate-800 hover:border-emerald-500/50 hover:text-white transition-all shadow-md active:scale-95 cursor-pointer"
          >
            <ArrowLeft className="h-4 w-4 text-emerald-400" />
            <span>Back to Dashboard</span>
          </button>

          {/* Page Branding */}
          <div className="flex items-center gap-2.5">
            <div className="flex h-9 w-9 items-center justify-center rounded-xl bg-emerald-500/20 border border-emerald-500/40 text-emerald-400 shadow-md">
              <Car className="h-5 w-5" />
            </div>
            <div>
              <h1 className="text-base font-black tracking-tight text-slate-900 dark:text-white flex items-center gap-2">
                EV BATTERY TELEMETRY <span className="text-[10px] font-bold text-emerald-700 dark:text-emerald-400 bg-emerald-500/15 border border-emerald-500/30 px-2 py-0.5 rounded-md">HEALTH MONITOR</span>
              </h1>
              <p className="text-[11px] font-semibold text-slate-600 dark:text-slate-400 hidden sm:block">
                State of Charge (SoC), Cell Temperatures & Range Projections
              </p>
            </div>
          </div>
          <ThemeToggle />

          {/* Status Badge */}
          <div className="hidden md:flex items-center gap-2 rounded-full border border-emerald-300 bg-emerald-100/90 px-3.5 py-1.5 text-xs font-bold text-emerald-800 shadow-sm">
            <span className="h-2.5 w-2.5 rounded-full bg-emerald-600 animate-pulse" />
            <span>VEHICLE SYNCED</span>
          </div>
        </div>
      </header>

      {/* MAIN FULL PAGE SPLIT CONTENT */}
      <main className="flex-1 max-w-7xl w-full mx-auto p-4 sm:p-6 lg:p-8 flex flex-col justify-center">
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 items-center">

          {/* LEFT HALF: MASSIVE VEHICLE SHOWCASE */}
          <div className="boss-card relative flex flex-col items-center justify-center min-h-[480px] md:min-h-[560px] lg:min-h-[640px] p-6 lg:p-10 overflow-hidden rounded-3xl border-emerald-500/30 bg-white dark:bg-[#111F1C] text-slate-900 dark:text-white shadow-xl">
            {/* Subtle Ambient Emerald Glow */}
            <div className="absolute inset-0 bg-[radial-gradient(ellipse_at_center,_var(--tw-gradient-stops))] from-emerald-500/15 via-teal-500/5 to-transparent blur-2xl pointer-events-none" />

            {/* Top Badge Overlay */}
            <div className="absolute top-6 left-6 flex items-center gap-2 rounded-full border border-emerald-500/30 bg-emerald-500/15 backdrop-blur-md px-3.5 py-1.5 text-xs font-bold text-emerald-700 dark:text-emerald-400 shadow-sm">
              <Sparkles className="h-3.5 w-3.5 text-amber-500" />
              <span>HIGH-PERFORMANCE EV PLATFORM</span>
            </div>

            {/* BIG STATIC IMAGE DISPLAY (NO MOTION) */}
            <div className="relative z-10 my-auto flex items-center justify-center w-full">
              <img
                src="/boss-vehicle-transparent.png"
                alt="BOSS EV Vehicle"
                onError={(e) => {
                  (e.target as HTMLImageElement).src = '/boss-vehicle.jpeg';
                }}
                className="max-h-[400px] md:max-h-[480px] lg:max-h-[540px] w-auto max-w-full object-contain filter drop-shadow-[0_15px_30px_rgba(16,185,129,0.3)]"
              />
            </div>

            {/* Bottom Tech Strip */}
            <div className="relative z-10 w-full mt-6 grid grid-cols-3 gap-3 pt-4 border-t border-slate-200 dark:border-slate-800 text-center text-xs">
              <div className="rounded-xl bg-slate-100 dark:bg-slate-900 p-2.5 border border-slate-200 dark:border-slate-800">
                <span className="text-[10px] text-slate-500 dark:text-slate-400 block uppercase font-bold">Architecture</span>
                <span className="font-extrabold text-emerald-700 dark:text-emerald-400">400V High Voltage</span>
              </div>
              <div className="rounded-xl bg-slate-100 dark:bg-slate-900 p-2.5 border border-slate-200 dark:border-slate-800">
                <span className="text-[10px] text-slate-500 dark:text-slate-400 block uppercase font-bold">Motor Type</span>
                <span className="font-extrabold text-slate-900 dark:text-white">Dual Permanent Magnet</span>
              </div>
              <div className="rounded-xl bg-slate-100 dark:bg-slate-900 p-2.5 border border-slate-200 dark:border-slate-800">
                <span className="text-[10px] text-slate-500 dark:text-slate-400 block uppercase font-bold">Fast Charge</span>
                <span className="font-extrabold text-emerald-700 dark:text-emerald-400">CCS2 / 150kW DC</span>
              </div>
            </div>
          </div>

          {/* RIGHT HALF: DETAILED METRICS & SPECIFICATIONS */}
          <div className="boss-card p-6 md:p-8 space-y-6 shadow-xl border-emerald-500/30 bg-white dark:bg-[#111F1C] text-slate-900 dark:text-white rounded-3xl">

            {/* 1. REGISTRATION LICENSE NUMBER PLATE */}
            <div className="rounded-2xl border border-slate-200 dark:border-slate-800 bg-slate-50 dark:bg-slate-900/60 p-4 shadow-sm">
              <div className="text-xs font-bold text-slate-600 dark:text-slate-400 uppercase tracking-wider mb-2.5 flex items-center justify-between">
                <span>Vehicle Registration Plate No.</span>
                <span className="text-emerald-700 dark:text-emerald-400 font-extrabold flex items-center gap-1">
                  <ShieldCheck className="h-4 w-4" /> BHARAT GREEN EV
                </span>
              </div>

              {/* Metallic Green Indian EV License Plate */}
              <div className="relative flex items-center justify-between rounded-xl border-2 border-emerald-700 bg-emerald-600 px-5 py-3.5 shadow-lg overflow-hidden">
                <div className="flex items-center gap-2.5 border-r border-emerald-400/40 pr-4">
                  <div className="flex flex-col items-center justify-center text-white">
                    <span className="text-xs font-black tracking-widest text-amber-300">IND</span>
                    <div className="h-4 w-4 rounded-full border border-amber-300/90 flex items-center justify-center my-0.5">
                      <div className="h-2 w-2 rounded-full bg-amber-300 animate-ping" />
                    </div>
                  </div>
                </div>
                <div className="flex-1 text-center font-mono text-3xl md:text-4xl font-black tracking-widest text-white drop-shadow-[0_2px_4px_rgba(0,0,0,0.4)]">
                  {licenseNo}
                </div>
                <div className="rounded bg-emerald-950/70 px-2.5 py-1 text-[10px] font-extrabold text-emerald-300 border border-emerald-400/40">
                  ZERO EMISSION
                </div>
              </div>
            </div>

            {/* 2. MODEL DETAILS */}
            <div className="rounded-2xl border border-emerald-500/30 bg-emerald-500/10 p-4">
              <div className="flex items-center gap-2 mb-3">
                <Car className="h-5 w-5 text-emerald-600 dark:text-emerald-400" />
                <h3 className="font-extrabold text-base text-slate-900 dark:text-white">Model Details</h3>
              </div>
              <div className="grid grid-cols-2 gap-3 text-sm">
                <div className="flex justify-between items-center p-2.5 rounded-xl bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 shadow-sm">
                  <span className="text-slate-500 dark:text-slate-400 font-medium flex items-center gap-1.5">
                    <Layers className="h-4 w-4 text-emerald-600 dark:text-emerald-400" /> Make
                  </span>
                  <span className="font-bold text-slate-900 dark:text-white">{vehicleMake}</span>
                </div>
                <div className="flex justify-between items-center p-2.5 rounded-xl bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 shadow-sm">
                  <span className="text-slate-500 dark:text-slate-400 font-medium flex items-center gap-1.5">
                    <Award className="h-4 w-4 text-emerald-600 dark:text-emerald-400" /> Model
                  </span>
                  <span className="font-bold text-slate-900 dark:text-white">{vehicleModel}</span>
                </div>
                <div className="flex justify-between items-center p-2.5 rounded-xl bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 shadow-sm">
                  <span className="text-slate-500 dark:text-slate-400 font-medium flex items-center gap-1.5">
                    <Calendar className="h-4 w-4 text-emerald-600 dark:text-emerald-400" /> Year
                  </span>
                  <span className="font-bold text-slate-900 dark:text-white">{vehicleYear}</span>
                </div>
                <div className="flex justify-between items-center p-2.5 rounded-xl bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 shadow-sm">
                  <span className="text-slate-500 dark:text-slate-400 font-medium flex items-center gap-1.5">
                    <Zap className="h-4 w-4 text-amber-500" /> Drivetrain
                  </span>
                  <span className="font-bold text-emerald-700 dark:text-emerald-400">Dual Motor AWD</span>
                </div>
              </div>
            </div>

            {/* 3. REQUESTED TELEMETRY PARAMETERS GRID */}
            <div className="space-y-3">
              <h3 className="font-extrabold text-sm text-slate-900 dark:text-white uppercase tracking-wider flex items-center gap-2">
                <Cpu className="h-4 w-4 text-emerald-600 dark:text-emerald-400" /> Live AI Telemetry & Battery Specs
              </h3>

              <div className="grid grid-cols-1 md:grid-cols-2 gap-3">

                {/* Battery kWh (Capacity in kWh, explicitly not percentage) */}
                <div className="rounded-2xl border border-emerald-500/30 bg-emerald-500/10 p-4 flex items-center justify-between shadow-sm">
                  <div>
                    <span className="text-xs text-slate-600 dark:text-slate-400 font-semibold block">
                      Battery Capacity
                    </span>
                    <span className="font-mono text-2xl font-black text-emerald-800 dark:text-emerald-400">
                      {batteryCapKwh} kWh
                    </span>
                    <span className="text-[10px] text-emerald-700 dark:text-emerald-400 font-bold block mt-0.5">
                      Li-ion Liquid-Cooled Pack
                    </span>
                  </div>
                  <div className="h-12 w-12 rounded-2xl bg-emerald-600 text-white flex items-center justify-center shadow-md">
                    <Zap className="h-6 w-6" />
                  </div>
                </div>

                {/* Real-world Est. Range */}
                <div className="rounded-2xl border border-slate-200 dark:border-slate-800 bg-white dark:bg-slate-900 p-4 flex items-center justify-between shadow-sm">
                  <div>
                    <span className="text-xs text-slate-600 dark:text-slate-400 font-semibold block">
                      Real-world Est. Range
                    </span>
                    <span className="font-mono text-2xl font-black text-slate-900 dark:text-white">
                      450 km
                    </span>
                    <span className="text-[10px] text-slate-500 dark:text-slate-400 font-medium block mt-0.5">
                      Combined City & Highway
                    </span>
                  </div>
                  <div className="h-12 w-12 rounded-2xl bg-blue-500/15 text-blue-600 dark:text-blue-400 flex items-center justify-center">
                    <Activity className="h-6 w-6" />
                  </div>
                </div>

                {/* Battery Temp */}
                <div className="rounded-2xl border border-slate-200 dark:border-slate-800 bg-white dark:bg-slate-900 p-4 flex items-center justify-between shadow-sm">
                  <div>
                    <span className="text-xs text-slate-600 dark:text-slate-400 font-semibold block">
                      Battery Temp
                    </span>
                    <span className="font-mono text-2xl font-black text-slate-900 dark:text-white">
                      28.5°C
                    </span>
                    <span className="text-[10px] text-emerald-700 dark:text-emerald-400 font-bold block mt-0.5">
                      Ideal Thermal Zone
                    </span>
                  </div>
                  <div className="h-12 w-12 rounded-2xl bg-amber-500/15 text-amber-600 dark:text-amber-400 flex items-center justify-center">
                    <Thermometer className="h-6 w-6" />
                  </div>
                </div>

                {/* Degradation Rate */}
                <div className="rounded-2xl border border-slate-200 dark:border-slate-800 bg-white dark:bg-slate-900 p-4 flex items-center justify-between shadow-sm">
                  <div>
                    <span className="text-xs text-slate-600 dark:text-slate-400 font-semibold block">
                      Degradation Rate
                    </span>
                    <span className="font-mono text-2xl font-black text-slate-900 dark:text-white">
                      1.1% / yr
                    </span>
                    <span className="text-[10px] text-emerald-700 dark:text-emerald-400 font-bold block mt-0.5">
                      Industry Leading Health
                    </span>
                  </div>
                  <div className="h-12 w-12 rounded-2xl bg-teal-500/15 text-teal-600 dark:text-teal-400 flex items-center justify-center">
                    <Gauge className="h-6 w-6" />
                  </div>
                </div>

              </div>

              {/* Regenerative Braking (Full Width Bar) */}
              <div className="rounded-2xl border border-slate-200 dark:border-slate-800 bg-white dark:bg-slate-900 p-4 flex items-center justify-between shadow-sm">
                <div>
                  <span className="text-xs text-slate-600 dark:text-slate-400 font-semibold block">
                    Regenerative Braking
                  </span>
                  <div className="flex items-baseline gap-2">
                    <span className="font-mono text-2xl font-black text-emerald-700 dark:text-emerald-400">
                      94.2%
                    </span>
                    <span className="text-xs font-bold text-slate-700 dark:text-slate-300">
                      Energy Recovery Efficiency
                    </span>
                  </div>
                </div>
                <div className="h-12 w-12 rounded-2xl bg-emerald-500/15 text-emerald-600 dark:text-emerald-400 flex items-center justify-center">
                  <RotateCcw className="h-6 w-6" />
                </div>
              </div>

            </div>

            {/* AI INSIGHT SUMMARY BOX */}
            <div className="rounded-2xl border border-emerald-500/30 bg-emerald-500/10 p-4 text-xs">
              <div className="flex items-start gap-2.5">
                <Sparkles className="h-5 w-5 text-emerald-700 dark:text-emerald-400 shrink-0 mt-0.5" />
                <div>
                  <h4 className="font-extrabold text-sm text-slate-900 dark:text-white mb-0.5">
                    BOSS AI Health & Grid Optimization Summary
                  </h4>
                  <p className="text-slate-700 dark:text-slate-300 leading-relaxed font-medium">
                    Vehicle battery pack operates with 98.4% cell balance health. Off-peak smart charging is recommended to maximize longevity and minimize grid load on local DISCOM transformers.
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
