import React, { useState, useMemo } from 'react';
import { motion } from 'framer-motion';
import confetti from 'canvas-confetti';
import {
  ArrowLeft,
  Calendar,
  Clock,
  Zap,
  Sparkles,
  ShieldCheck,
  CheckCircle,
  Building2,
  Lock,
  Check,
  Loader2,
  Camera,
} from 'lucide-react';
import type { Station, BookingResult, SOCVerificationResult } from '@/types';
import { bookSlotBackendService } from '@/lib/backendServices';
import { BackgroundSystem } from '@/components/ui/BackgroundSystem';
import { ThemeToggle } from '@/components/ui/ThemeToggle';
import { SOCVerificationModal } from '@/components/SOCVerificationModal';

interface BookSlotPageProps {
  onBack: () => void;
  stations: Station[];
  selectedStationId: string | null;
  userId?: string;
  onBookingSuccess: (result: BookingResult) => void;
}

export const BookSlotPage: React.FC<BookSlotPageProps> = ({
  onBack,
  stations,
  selectedStationId,
  userId,
  onBookingSuccess,
}) => {
  const selectedStationObj = useMemo(() => {
    return stations.find((st) => st.id === selectedStationId) || stations[0];
  }, [stations, selectedStationId]);

  const todayDateStr = useMemo(
    () =>
      new Date().toLocaleDateString(undefined, {
        weekday: 'short',
        year: 'numeric',
        month: 'short',
        day: 'numeric',
      }),
    []
  );

  const [selectedSlotHour, setSelectedSlotHour] = useState<number>(() => new Date().getHours());
  const [bookCurrent, setBookCurrent] = useState('32');
  const [batteryPct, setBatteryPct] = useState('50');
  const [bookingLoading, setBookingLoading] = useState(false);
  const [bookingResultMsg, setBookingResultMsg] = useState<{ success: boolean; message: string } | null>(null);

  // Mandatory Camera SOC & Voltage Verification state
  const [showSOCModal, setShowSOCModal] = useState(false);
  const [socVerificationResult, setSocVerificationResult] = useState<SOCVerificationResult | null>(null);

  // Generate 24 1-hour slots for TODAY ONLY
  const todaySlots = useMemo(() => {
    const now = new Date();
    const currentHour = now.getHours();
    const slots = [];
    for (let h = 0; h < 24; h++) {
      const startFormatted = new Date(now.getFullYear(), now.getMonth(), now.getDate(), h).toLocaleTimeString([], {
        hour: '2-digit',
        minute: '2-digit',
      });
      const endFormatted = new Date(now.getFullYear(), now.getMonth(), now.getDate(), h + 1).toLocaleTimeString([], {
        hour: '2-digit',
        minute: '2-digit',
      });
      const isPassed = h < currentHour;
      const isCurrent = h === currentHour;
      slots.push({
        hour: h,
        label: `${startFormatted} — ${endFormatted}${isCurrent ? ' (Current)' : ''}`,
        isPassed,
        isCurrent,
      });
    }
    return slots;
  }, []);

  const selectedSlotObj = todaySlots.find((s) => s.hour === selectedSlotHour) || todaySlots[0];

  const handleBookSlot = async () => {
    if (!userId || !selectedStationObj) return;

    setBookingLoading(true);
    setBookingResultMsg(null);

    try {
      const now = new Date();
      const scheduledDate = new Date(now.getFullYear(), now.getMonth(), now.getDate(), selectedSlotHour, 0, 0);

      const currentBattery = parseFloat(batteryPct) || 50;

      const result = await bookSlotBackendService({
        userId,
        station: selectedStationObj,
        allStations: stations,
        chargersByStation: new Map(),
        scheduledTime: scheduledDate.toISOString(),
        chargeCurrentA: parseFloat(bookCurrent) || 32,
        batteryPercent: currentBattery,
        isEmergency: false,
      });

      if (result.success) {
        setBookingResultMsg({ success: true, message: result.message });
        onBookingSuccess(result);
        confetti({ particleCount: 120, spread: 80, origin: { y: 0.4 } });
      } else {
        setBookingResultMsg({ success: false, message: result.message });
      }
    } catch {
      setBookingResultMsg({ success: false, message: 'Failed to complete reservation.' });
    } finally {
      setBookingLoading(false);
    }
  };

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
              <Calendar className="h-5 w-5" />
            </div>
            <div>
              <h1 className="text-base font-black tracking-tight text-slate-900 dark:text-white flex items-center gap-2">
                SLOT BOOKING & POWER DISPATCH <span className="text-[10px] font-bold text-emerald-700 dark:text-emerald-400 bg-emerald-500/15 border border-emerald-500/30 px-2 py-0.5 rounded-md">LIVE SLOTS</span>
              </h1>
              <p className="text-[11px] font-semibold text-slate-600 dark:text-slate-400 hidden sm:block">
                Smart Meter 1-Hour Time Window Reservation Engine
              </p>
            </div>
          </div>

          {/* Status Badge & Theme Toggle */}
          <div className="flex items-center gap-3">
            <ThemeToggle />
            <div className="hidden md:flex boss-badge-green">
              <span className="h-2.5 w-2.5 rounded-full bg-emerald-400 animate-pulse" />
              <span>TODAY ONLY LOCK</span>
            </div>
          </div>
        </div>
      </header>

      {/* MAIN CONTENT */}
      <main className="flex-1 max-w-7xl w-full mx-auto p-4 sm:p-6 lg:p-8 space-y-6">

        {/* TOP QUICK STATS GRID */}
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">

          <div className="boss-card p-5 bg-white dark:bg-[#111F1C] border border-emerald-500/30 shadow-md rounded-2xl flex items-center justify-between">
            <div>
              <span className="text-xs text-slate-600 dark:text-slate-400 font-semibold block">Target Charging Station</span>
              <span className="font-mono text-base font-black text-slate-900 dark:text-white truncate max-w-[150px] block">
                {selectedStationObj?.name || 'Smart EV Station'}
              </span>
              <span className="text-[11px] text-emerald-600 dark:text-emerald-400 font-bold block mt-0.5">
                {selectedStationObj?.city || 'Selected Region'}
              </span>
            </div>
            <div className="h-12 w-12 rounded-2xl bg-emerald-500/15 text-emerald-600 dark:text-emerald-400 flex items-center justify-center shadow-sm">
              <Building2 className="h-6 w-6" />
            </div>
          </div>

          <div className="boss-card p-5 bg-white dark:bg-[#111F1C] border border-emerald-500/30 shadow-md rounded-2xl flex items-center justify-between">
            <div>
              <span className="text-xs text-slate-600 dark:text-slate-400 font-semibold block">Booking Window</span>
              <span className="font-mono text-sm font-black text-slate-900 dark:text-white block">{todayDateStr}</span>
              <span className="text-[11px] text-emerald-600 dark:text-emerald-400 font-bold block mt-0.5">
                {selectedSlotObj?.label.split(' — ')[0]} Slot
              </span>
            </div>
            <div className="h-12 w-12 rounded-2xl bg-amber-500/15 text-amber-600 dark:text-amber-400 flex items-center justify-center shadow-sm">
              <Clock className="h-6 w-6" />
            </div>
          </div>

          <div className="boss-card p-5 bg-white dark:bg-[#111F1C] border border-emerald-500/30 shadow-md rounded-2xl flex items-center justify-between">
            <div>
              <span className="text-xs text-slate-600 dark:text-slate-400 font-semibold block">Charging Output</span>
              <span className="font-mono text-2xl font-black text-slate-900 dark:text-white">{bookCurrent} A</span>
              <span className="text-[11px] text-emerald-600 dark:text-emerald-400 font-bold block mt-0.5">
                400V DC Fast Charge
              </span>
            </div>
            <div className="h-12 w-12 rounded-2xl bg-blue-500/15 text-blue-600 dark:text-blue-400 flex items-center justify-center shadow-sm">
              <Zap className="h-6 w-6" />
            </div>
          </div>

          <div className="boss-card p-5 bg-white dark:bg-[#111F1C] border border-emerald-500/30 shadow-md rounded-2xl flex items-center justify-between">
            <div>
              <span className="text-xs text-slate-600 dark:text-slate-400 font-semibold block">Guaranteed Rate</span>
              <span className="font-mono text-2xl font-black text-emerald-700 dark:text-emerald-400">₹185.00</span>
              <span className="text-[11px] text-emerald-600 dark:text-emerald-400 font-bold block mt-0.5">
                OTP Smart Meter Lock
              </span>
            </div>
            <div className="h-12 w-12 rounded-2xl bg-teal-500/15 text-teal-600 dark:text-teal-400 flex items-center justify-center shadow-sm">
              <Lock className="h-6 w-6" />
            </div>
          </div>

        </div>

        {/* MAIN SPLIT VIEW */}
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 items-start">

          {/* LEFT HALF: 24 1-HOUR SLOT SELECTOR & CONTROLS */}
          <div className="boss-card p-6 bg-white dark:bg-[#111F1C] border border-slate-200 dark:border-slate-800 shadow-xl rounded-3xl space-y-5 text-slate-900 dark:text-white">

            {/* Header & Date Lock Banner */}
            <div className="flex items-center justify-between pb-2 border-b border-slate-200 dark:border-slate-800">
              <div className="flex items-center gap-2">
                <Calendar className="h-5 w-5 text-emerald-600 dark:text-emerald-400" />
                <h2 className="font-extrabold text-base text-slate-900 dark:text-white">Prebook Charging Slot (TODAY ONLY)</h2>
              </div>
              <span className="text-xs font-black text-emerald-800 dark:text-emerald-400 bg-emerald-500/15 px-3 py-1 rounded-full border border-emerald-500/30">
                📅 {todayDateStr}
              </span>
            </div>

            {/* 24 1-HOUR SLOT SELECTOR GRID */}
            <div className="space-y-2">
              <label className="text-xs font-extrabold text-slate-700 dark:text-slate-300 uppercase tracking-wider block">
                Select 1-Hour Time Slot (24-Hour Cycle):
              </label>
              <div className="grid grid-cols-2 sm:grid-cols-3 gap-2 max-h-[220px] overflow-y-auto pr-1">
                {todaySlots.map((s) => {
                  const isSelected = selectedSlotHour === s.hour;
                  return (
                    <button
                      key={s.hour}
                      disabled={s.isPassed}
                      onClick={() => setSelectedSlotHour(s.hour)}
                      className={`p-2.5 rounded-xl text-left border text-xs transition-all cursor-pointer ${s.isPassed
                        ? 'bg-slate-100 dark:bg-slate-900/80 text-slate-400 dark:text-slate-500 border-slate-200 dark:border-slate-800 cursor-not-allowed opacity-60'
                        : isSelected
                          ? 'bg-emerald-600 text-white font-extrabold border-emerald-700 shadow-md ring-2 ring-emerald-500/30 scale-102'
                          : s.isCurrent
                            ? 'bg-emerald-500/15 text-emerald-900 dark:text-emerald-300 border-emerald-500/40 font-bold hover:bg-emerald-500/25'
                            : 'bg-white dark:bg-slate-900 text-slate-800 dark:text-slate-200 border-slate-200 dark:border-slate-800 hover:border-emerald-500/50 hover:bg-slate-100 dark:hover:bg-slate-800 font-semibold'
                        }`}
                    >
                      <div className="font-mono text-xs">{s.label.split(' — ')[0]}</div>
                      <div className="text-[10px] opacity-80">{s.isCurrent ? 'Current Hour' : s.isPassed ? 'Passed' : 'Available'}</div>
                    </button>
                  );
                })}
              </div>
            </div>

            {/* PARAMETERS: CURRENT & BATTERY % */}
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-4 pt-2">
              <div>
                <label className="text-xs font-extrabold text-slate-700 dark:text-slate-300 block mb-1.5">
                  Select Charge Current (Amps)
                </label>
                <select
                  value={bookCurrent}
                  onChange={(e) => setBookCurrent(e.target.value)}
                  className="boss-input text-xs font-bold rounded-xl"
                >
                  <option value="16">16 A (Normal AC Charge - 3.7 kW)</option>
                  <option value="32">32 A (Fast AC Charge - 7.4 kW)</option>
                  <option value="64">64 A (Super AC Charge - 15 kW)</option>
                  <option value="150">150 A (Ultra DC Fast Charge - 50 kW)</option>
                </select>
              </div>

              <div>
                <label className="text-xs font-extrabold text-slate-700 dark:text-slate-300 block mb-1.5">
                  Current Battery Level ({batteryPct}%)
                </label>
                <input
                  type="range"
                  min="5"
                  max="95"
                  value={batteryPct}
                  onChange={(e) => setBatteryPct(e.target.value)}
                  className="w-full accent-emerald-600 cursor-pointer h-2 bg-slate-200 dark:bg-slate-800 rounded-lg mt-3"
                />
              </div>
            </div>

            {/* INSTANT SLOT BOOKING BUTTON */}
            <div className="pt-2 space-y-2">
              <button
                onClick={handleBookSlot}
                disabled={bookingLoading}
                className={`w-full py-3.5 px-4 rounded-2xl text-xs sm:text-sm font-black tracking-wide shadow-lg cursor-pointer transition-all active:scale-95 disabled:opacity-50 flex items-center justify-center gap-2 border ${
                  socVerificationResult?.status === 'verified'
                    ? 'bg-gradient-to-r from-emerald-600 via-teal-600 to-emerald-700 text-white border-emerald-400/50 shadow-emerald-600/30'
                    : 'bg-gradient-to-r from-amber-600 via-orange-600 to-amber-700 text-white border-amber-400/50 shadow-amber-600/30'
                }`}
              >
                {bookingLoading ? (
                  <>
                    <Loader2 className="h-5 w-5 animate-spin" />
                    <span>Reserving 1-Hour Slot...</span>
                  </>
                ) : socVerificationResult?.status === 'verified' ? (
                  <>
                    <Sparkles className="h-5 w-5 text-amber-300" />
                    <span>CONFIRM & DISPATCH 1-HOUR SLOT RECEIPT ({socVerificationResult.requiredVoltageV || 400}V DC)</span>
                  </>
                ) : (
                  <>
                    <Camera className="h-5 w-5 text-white animate-pulse" />
                    <span>📸 STEP 1: VERIFY DASHBOARD CAMERA PHOTO (MANDATORY)</span>
                  </>
                )}
              </button>

              {bookingResultMsg && (
                <div
                  className={`p-3 rounded-xl text-xs font-bold ${bookingResultMsg.success
                    ? 'bg-emerald-500/15 text-emerald-900 dark:text-emerald-300 border border-emerald-500/30'
                    : 'bg-amber-500/15 text-amber-900 dark:text-amber-300 border border-amber-500/30'
                    }`}
                >
                  {bookingResultMsg.message}
                </div>
              )}
            </div>

          </div>

          {/* RIGHT HALF: BOSS BOOK SLOT VISUAL & AI ADVISORY */}
          <div className="space-y-6">

            {/* BOSS BOOK SLOT VISUAL CARD */}
            <div className="boss-card relative flex flex-col items-center justify-center p-6 lg:p-8 overflow-hidden rounded-3xl border-emerald-500/30 bg-white dark:bg-[#111F1C] text-slate-900 dark:text-white shadow-xl min-h-[380px]">
              {/* Subtle Ambient Emerald Glow */}
              <div className="absolute inset-0 bg-[radial-gradient(ellipse_at_center,_var(--tw-gradient-stops))] from-emerald-500/15 via-teal-500/5 to-transparent blur-2xl pointer-events-none" />

              {/* Top Overlay Tag */}
              <div className="absolute top-6 left-6 flex items-center gap-2 rounded-full border border-emerald-500/30 bg-emerald-500/15 backdrop-blur-md px-3.5 py-1.5 text-xs font-bold text-emerald-700 dark:text-emerald-400 shadow-sm">
                <Sparkles className="h-3.5 w-3.5 text-amber-500" />
                <span>BOSS SMART DISPATCH ENGINE</span>
              </div>

              {/* STATIC BOOK SLOT IMAGE */}
              <div className="relative z-10 my-auto flex items-center justify-center w-full pt-6">
                <img
                  src="/boss-book-slot-transparent.png"
                  alt="BOSS Book Slot Visual"
                  onError={(e) => {
                    (e.target as HTMLImageElement).src = '/boss-book-slot.jpeg';
                  }}
                  className="max-h-[320px] lg:max-h-[360px] w-auto max-w-full object-contain filter drop-shadow-[0_15px_30px_rgba(16,185,129,0.3)]"
                />
              </div>

              {/* Bottom Tech Strip */}
              <div className="relative z-10 w-full mt-4 grid grid-cols-3 gap-3 pt-4 border-t border-slate-200 dark:border-slate-800 text-center text-xs">
                <div className="rounded-xl bg-slate-100 dark:bg-slate-900 p-2 border border-slate-200 dark:border-slate-800">
                  <span className="text-[10px] text-slate-500 dark:text-slate-400 block uppercase font-bold">Time Window</span>
                  <span className="font-extrabold text-emerald-700 dark:text-emerald-400">1 Hour Guaranteed</span>
                </div>
                <div className="rounded-xl bg-slate-100 dark:bg-slate-900 p-2 border border-slate-200 dark:border-slate-800">
                  <span className="text-[10px] text-slate-500 dark:text-slate-400 block uppercase font-bold">OTP Code</span>
                  <span className="font-extrabold text-slate-900 dark:text-white">Auto Generated</span>
                </div>
                <div className="rounded-xl bg-slate-100 dark:bg-slate-900 p-2 border border-slate-200 dark:border-slate-800">
                  <span className="text-[10px] text-slate-500 dark:text-slate-400 block uppercase font-bold">Cancellation</span>
                  <span className="font-extrabold text-emerald-700 dark:text-emerald-400">Instant Refund</span>
                </div>
              </div>
            </div>

            {/* AI TRANSFORMER LOAD & GREEN TARIFF ADVISORY */}
            <div className="rounded-2xl border border-emerald-500/30 bg-emerald-500/10 p-4 text-xs">
              <div className="flex items-start gap-2.5">
                <ShieldCheck className="h-5 w-5 text-emerald-700 dark:text-emerald-400 shrink-0 mt-0.5" />
                <div>
                  <h4 className="font-extrabold text-sm text-slate-900 dark:text-white mb-0.5">
                    BOSS AI Smart Meter Verification Guarantee
                  </h4>
                  <p className="text-slate-700 dark:text-slate-300 leading-relaxed font-medium">
                    Reserving your 1-hour slot automatically generates a 6-digit smart meter OTP code. Upon arriving at the station, enter the code on the smart meter keypad to start power dispensing immediately.
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
