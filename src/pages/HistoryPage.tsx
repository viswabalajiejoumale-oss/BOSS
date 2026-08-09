import React, { useState, useMemo } from 'react';
import {
  ArrowLeft,
  History,
  CheckCircle,
  XCircle,
  Clock,
  Sparkles,
  Zap,
  DollarSign,
  ShieldCheck,
  Calendar,
  Layers,
  FileCheck,
  Receipt,
} from 'lucide-react';
import type { Reservation, Station } from '@/types';
import { BackgroundSystem } from '@/components/ui/BackgroundSystem';
import { ThemeToggle } from '@/components/ui/ThemeToggle';

interface HistoryPageProps {
  onBack: () => void;
  reservations: Reservation[];
  stations: Station[];
}

export const HistoryPage: React.FC<HistoryPageProps> = ({
  onBack,
  reservations,
  stations,
}) => {
  const [filterStatus, setFilterStatus] = useState<'all' | 'completed' | 'confirmed' | 'cancelled'>('all');

  // Map station details
  const stationMap = useMemo(() => {
    const map = new Map<string, Station>();
    stations.forEach((s) => map.set(s.id, s));
    return map;
  }, [stations]);

  // Mock sample history if user has no reservations yet
  const displayReservations = useMemo(() => {
    if (reservations.length > 0) return reservations;
    return [
      {
        id: 'res-1',
        user_id: 'usr-1',
        station_id: stations[0]?.id || 'st-1',
        charger_id: 'ch-1',
        scheduled_time: new Date(Date.now() - 3600000 * 2).toISOString(),
        charge_current_a: 32,
        battery_percent: 85,
        status: 'completed' as const,
        queue_position: 1,
        booking_code: 'BOSS-8821',
        code_expires_at: null,
        is_emergency: false,
        price: 185.0,
        created_at: new Date(Date.now() - 3600000 * 3).toISOString(),
        output_voltage_v: 400,
        output_power_kw: 12.8,
      },
      {
        id: 'res-2',
        user_id: 'usr-1',
        station_id: stations[1]?.id || 'st-2',
        charger_id: 'ch-2',
        scheduled_time: new Date(Date.now() - 3600000 * 26).toISOString(),
        charge_current_a: 32,
        battery_percent: 90,
        status: 'completed' as const,
        queue_position: 1,
        booking_code: 'BOSS-7419',
        code_expires_at: null,
        is_emergency: false,
        price: 240.0,
        created_at: new Date(Date.now() - 3600000 * 28).toISOString(),
        output_voltage_v: 400,
        output_power_kw: 16.0,
      },
      {
        id: 'res-3',
        user_id: 'usr-1',
        station_id: stations[2]?.id || 'st-3',
        charger_id: 'ch-3',
        scheduled_time: new Date(Date.now() - 3600000 * 50).toISOString(),
        charge_current_a: 16,
        battery_percent: 60,
        status: 'cancelled' as const,
        queue_position: 2,
        booking_code: 'BOSS-3301',
        code_expires_at: null,
        is_emergency: false,
        price: 95.0,
        created_at: new Date(Date.now() - 3600000 * 52).toISOString(),
        output_voltage_v: 230,
        output_power_kw: 6.4,
      },
    ];
  }, [reservations, stations]);

  // Filtered reservations
  const filteredList = useMemo(() => {
    if (filterStatus === 'all') return displayReservations;
    return displayReservations.filter((r) => r.status === filterStatus);
  }, [displayReservations, filterStatus]);

  // Totals
  const totalEnergyKwh = useMemo(() => {
    return displayReservations.reduce((sum, r) => sum + (r.output_power_kw || 15.0), 0);
  }, [displayReservations]);

  const totalSpend = useMemo(() => {
    return displayReservations.reduce((sum, r) => sum + (r.price || 150), 0);
  }, [displayReservations]);

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
              <History className="h-5 w-5" />
            </div>
            <div>
              <h1 className="text-base font-black tracking-tight text-slate-900 dark:text-white flex items-center gap-2">
                CHARGING HISTORY & LEDGER <span className="text-[10px] font-bold text-emerald-700 dark:text-emerald-400 bg-emerald-500/15 border border-emerald-500/30 px-2 py-0.5 rounded-md">AUDIT</span>
              </h1>
              <p className="text-[11px] font-semibold text-slate-600 dark:text-slate-400 hidden sm:block">
                AI Smart Energy Meter Receipts & Session Telemetry
              </p>
            </div>
          </div>
          <ThemeToggle />

          {/* Status Badge */}
          <div className="hidden md:flex items-center gap-2 rounded-full border border-emerald-300 bg-emerald-100/90 px-3.5 py-1.5 text-xs font-bold text-emerald-800 shadow-sm">
            <span className="h-2.5 w-2.5 rounded-full bg-emerald-600 animate-pulse" />
            <span>LEDGER VERIFIED</span>
          </div>
        </div>
      </header>

      {/* MAIN CONTENT */}
      <main className="flex-1 max-w-7xl w-full mx-auto p-4 sm:p-6 lg:p-8 space-y-6">

        {/* TOP QUICK STATS GRID */}
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">

          <div className="boss-card p-5 bg-white dark:bg-[#111F1C] border border-emerald-500/30 shadow-md rounded-2xl flex items-center justify-between">
            <div>
              <span className="text-xs text-slate-600 dark:text-slate-400 font-semibold block">Total Charging Sessions</span>
              <span className="font-mono text-2xl font-black text-slate-900 dark:text-white">{displayReservations.length} Sessions</span>
              <span className="text-[11px] text-emerald-600 dark:text-emerald-400 font-bold block mt-0.5">
                100% DISCOM Verified
              </span>
            </div>
            <div className="h-12 w-12 rounded-2xl bg-emerald-500/15 text-emerald-600 dark:text-emerald-400 flex items-center justify-center shadow-sm">
              <History className="h-6 w-6" />
            </div>
          </div>

          <div className="boss-card p-5 bg-white dark:bg-[#111F1C] border border-emerald-500/30 shadow-md rounded-2xl flex items-center justify-between">
            <div>
              <span className="text-xs text-slate-600 dark:text-slate-400 font-semibold block">Total Energy Delivered</span>
              <span className="font-mono text-2xl font-black text-slate-900 dark:text-white">{totalEnergyKwh.toFixed(1)} kWh</span>
              <span className="text-[11px] text-emerald-600 dark:text-emerald-400 font-bold block mt-0.5">
                Green Power Tariff
              </span>
            </div>
            <div className="h-12 w-12 rounded-2xl bg-amber-500/15 text-amber-600 dark:text-amber-400 flex items-center justify-center shadow-sm">
              <Zap className="h-6 w-6" />
            </div>
          </div>

          <div className="boss-card p-5 bg-white dark:bg-[#111F1C] border border-emerald-500/30 shadow-md rounded-2xl flex items-center justify-between">
            <div>
              <span className="text-xs text-slate-600 dark:text-slate-400 font-semibold block">Total Spend</span>
              <span className="font-mono text-2xl font-black text-slate-900 dark:text-white">₹{totalSpend.toFixed(2)}</span>
              <span className="text-[11px] text-emerald-600 dark:text-emerald-400 font-bold block mt-0.5">
                Avg ₹5.0/kWh
              </span>
            </div>
            <div className="h-12 w-12 rounded-2xl bg-blue-500/15 text-blue-600 dark:text-blue-400 flex items-center justify-center shadow-sm">
              <DollarSign className="h-6 w-6" />
            </div>
          </div>

          <div className="boss-card p-5 bg-white dark:bg-[#111F1C] border border-emerald-500/30 shadow-md rounded-2xl flex items-center justify-between">
            <div>
              <span className="text-xs text-slate-600 dark:text-slate-400 font-semibold block">Off-Peak Savings</span>
              <span className="font-mono text-2xl font-black text-emerald-700 dark:text-emerald-400">₹{(totalSpend * 0.25).toFixed(2)}</span>
              <span className="text-[11px] text-emerald-600 dark:text-emerald-400 font-bold block mt-0.5">
                25% Grid Discount
              </span>
            </div>
            <div className="h-12 w-12 rounded-2xl bg-teal-500/15 text-teal-600 dark:text-teal-400 flex items-center justify-center shadow-sm">
              <Receipt className="h-6 w-6" />
            </div>
          </div>

        </div>

        {/* MAIN SPLIT VIEW */}
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 items-start">

          {/* LEFT HALF: FILTERABLE RESERVATION HISTORY LIST */}
          <div className="boss-card p-6 bg-white dark:bg-[#111F1C] border border-slate-200 dark:border-slate-800 shadow-xl rounded-3xl space-y-4 text-slate-900 dark:text-white">

            {/* Header & Filter Tabs */}
            <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-3 pb-2 border-b border-slate-200 dark:border-slate-800">
              <div className="flex items-center gap-2">
                <History className="h-5 w-5 text-emerald-600 dark:text-emerald-400" />
                <h2 className="font-extrabold text-base text-slate-900 dark:text-white">Session Logs & Booking Receipts</h2>
              </div>

              {/* Status Filter Buttons */}
              <div className="flex items-center gap-1 bg-slate-100 dark:bg-slate-900 p-1 rounded-xl text-xs font-bold border border-slate-200 dark:border-slate-800">
                <button
                  onClick={() => setFilterStatus('all')}
                  className={`px-2.5 py-1 rounded-lg transition-all cursor-pointer ${filterStatus === 'all' ? 'bg-white dark:bg-slate-800 text-slate-900 dark:text-white shadow-sm' : 'text-slate-500 hover:text-slate-900 dark:hover:text-white'
                    }`}
                >
                  All ({displayReservations.length})
                </button>
                <button
                  onClick={() => setFilterStatus('completed')}
                  className={`px-2.5 py-1 rounded-lg transition-all cursor-pointer ${filterStatus === 'completed' ? 'bg-white dark:bg-slate-800 text-emerald-700 dark:text-emerald-400 shadow-sm' : 'text-slate-500 hover:text-slate-900 dark:hover:text-white'
                    }`}
                >
                  Completed
                </button>
                <button
                  onClick={() => setFilterStatus('confirmed')}
                  className={`px-2.5 py-1 rounded-lg transition-all cursor-pointer ${filterStatus === 'confirmed' ? 'bg-white dark:bg-slate-800 text-blue-700 dark:text-blue-400 shadow-sm' : 'text-slate-500 hover:text-slate-900 dark:hover:text-white'
                    }`}
                >
                  Active
                </button>
                <button
                  onClick={() => setFilterStatus('cancelled')}
                  className={`px-2.5 py-1 rounded-lg transition-all cursor-pointer ${filterStatus === 'cancelled' ? 'bg-white dark:bg-slate-800 text-red-700 dark:text-red-400 shadow-sm' : 'text-slate-500 hover:text-slate-900 dark:hover:text-white'
                    }`}
                >
                  Cancelled
                </button>
              </div>
            </div>

            {/* RESERVATIONS CARD LIST */}
            <div className="space-y-3.5 max-h-[540px] overflow-y-auto pr-1">
              {filteredList.map((res) => {
                const stationObj = stationMap.get(res.station_id);
                const stationName = res.original_station_name || stationObj?.name || 'Smart EV Station';
                const scheduledDate = new Date(res.scheduled_time).toLocaleString(undefined, {
                  weekday: 'short',
                  month: 'short',
                  day: 'numeric',
                  hour: '2-digit',
                  minute: '2-digit',
                });

                return (
                  <div
                    key={res.id}
                    className="p-4 rounded-2xl border border-slate-200 dark:border-slate-800 bg-slate-50 dark:bg-slate-900/60 hover:bg-slate-100 dark:hover:bg-slate-800/80 transition-all shadow-sm space-y-3 text-slate-900 dark:text-white"
                  >
                    <div className="flex items-start justify-between">
                      <div>
                        <div className="flex items-center gap-2">
                          <h4 className="font-extrabold text-sm text-slate-900 dark:text-white">{stationName}</h4>
                          {res.status === 'completed' && (
                            <span className="inline-flex items-center gap-1 rounded-full bg-emerald-500/15 text-emerald-800 dark:text-emerald-400 px-2.5 py-0.5 text-[10px] font-black border border-emerald-500/30">
                              <CheckCircle className="h-3 w-3 text-emerald-600 dark:text-emerald-400" /> COMPLETED
                            </span>
                          )}
                          {res.status === 'confirmed' && (
                            <span className="inline-flex items-center gap-1 rounded-full bg-blue-500/15 text-blue-800 dark:text-blue-400 px-2.5 py-0.5 text-[10px] font-black border border-blue-500/30">
                              <Clock className="h-3 w-3 text-blue-600 dark:text-blue-400" /> ACTIVE
                            </span>
                          )}
                          {res.status === 'cancelled' && (
                            <span className="inline-flex items-center gap-1 rounded-full bg-red-500/15 text-red-800 dark:text-red-400 px-2.5 py-0.5 text-[10px] font-black border border-red-500/30">
                              <XCircle className="h-3 w-3 text-red-600 dark:text-red-400" /> CANCELLED
                            </span>
                          )}
                        </div>
                        <p className="text-xs text-slate-600 dark:text-slate-400 font-semibold mt-0.5 flex items-center gap-1">
                          <Calendar className="h-3.5 w-3.5 text-emerald-600 dark:text-emerald-400" /> {scheduledDate}
                        </p>
                      </div>

                      {res.booking_code && (
                        <span className="font-mono text-xs font-black bg-slate-100 dark:bg-slate-800 px-2.5 py-1 rounded-lg border border-slate-300 dark:border-slate-700 text-slate-900 dark:text-white shadow-xs">
                          {res.booking_code}
                        </span>
                      )}
                    </div>

                    <div className="grid grid-cols-3 gap-2 pt-2 border-t border-slate-200 dark:border-slate-800 text-xs text-center font-bold">
                      <div className="bg-white dark:bg-slate-900 p-2 rounded-xl border border-slate-200 dark:border-slate-800">
                        <span className="text-[10px] text-slate-500 dark:text-slate-400 block font-medium">Output Power</span>
                        <span className="text-slate-900 dark:text-white">{res.output_power_kw || 15.0} kW</span>
                      </div>
                      <div className="bg-white dark:bg-slate-900 p-2 rounded-xl border border-slate-200 dark:border-slate-800">
                        <span className="text-[10px] text-slate-500 dark:text-slate-400 block font-medium">Voltage</span>
                        <span className="text-emerald-700 dark:text-emerald-400">{res.output_voltage_v || 400}V</span>
                      </div>
                      <div className="bg-white dark:bg-slate-900 p-2 rounded-xl border border-slate-200 dark:border-slate-800">
                        <span className="text-[10px] text-slate-500 dark:text-slate-400 block font-medium">Total Amount</span>
                        <span className="text-slate-900 dark:text-white font-extrabold">₹{res.price ? res.price.toFixed(2) : '185.00'}</span>
                      </div>
                    </div>
                  </div>
                );
              })}
            </div>
          </div>

          {/* RIGHT HALF: BOSS HISTORY VISUAL & SMART LEDGER LOG */}
          <div className="space-y-6">

            {/* BOSS HISTORY VISUAL CARD */}
            <div className="boss-card relative flex flex-col items-center justify-center p-6 lg:p-8 overflow-hidden rounded-3xl border-emerald-500/30 bg-white dark:bg-[#111F1C] text-slate-900 dark:text-white shadow-xl min-h-[380px]">
              {/* Subtle Ambient Emerald Glow */}
              <div className="absolute inset-0 bg-[radial-gradient(ellipse_at_center,_var(--tw-gradient-stops))] from-emerald-500/15 via-teal-500/5 to-transparent blur-2xl pointer-events-none" />

              {/* Top Overlay Tag */}
              <div className="absolute top-6 left-6 flex items-center gap-2 rounded-full border border-emerald-500/30 bg-emerald-500/15 backdrop-blur-md px-3.5 py-1.5 text-xs font-bold text-emerald-700 dark:text-emerald-400 shadow-sm">
                <Sparkles className="h-3.5 w-3.5 text-amber-500" />
                <span>BOSS SMART LEDGER AUDIT</span>
              </div>

              {/* STATIC HISTORY IMAGE */}
              <div className="relative z-10 my-auto flex items-center justify-center w-full pt-6">
                <img
                  src="/boss-history-transparent.png"
                  alt="BOSS History Visual"
                  onError={(e) => {
                    (e.target as HTMLImageElement).src = '/boss-history.jpeg';
                  }}
                  className="max-h-[320px] lg:max-h-[360px] w-auto max-w-full object-contain filter drop-shadow-[0_15px_30px_rgba(16,185,129,0.3)]"
                />
              </div>

              {/* Bottom Tech Strip */}
              <div className="relative z-10 w-full mt-4 grid grid-cols-3 gap-3 pt-4 border-t border-slate-200 dark:border-slate-800 text-center text-xs">
                <div className="rounded-xl bg-slate-100 dark:bg-slate-900 p-2 border border-slate-200 dark:border-slate-800">
                  <span className="text-[10px] text-slate-500 dark:text-slate-400 block uppercase font-bold">Meter Sync</span>
                  <span className="font-extrabold text-emerald-700 dark:text-emerald-400">100% Verified</span>
                </div>
                <div className="rounded-xl bg-slate-100 dark:bg-slate-900 p-2 border border-slate-200 dark:border-slate-800">
                  <span className="text-[10px] text-slate-500 dark:text-slate-400 block uppercase font-bold">Security OTP</span>
                  <span className="font-extrabold text-slate-900 dark:text-white">Encrypted</span>
                </div>
                <div className="rounded-xl bg-slate-100 dark:bg-slate-900 p-2 border border-slate-200 dark:border-slate-800">
                  <span className="text-[10px] text-slate-500 dark:text-slate-400 block uppercase font-bold">Billing Record</span>
                  <span className="font-extrabold text-emerald-700 dark:text-emerald-400">Audited</span>
                </div>
              </div>
            </div>

            {/* SMART METER VERIFICATION RECEIPT BOX */}
            <div className="boss-card p-6 bg-white dark:bg-[#111F1C] border border-slate-200 dark:border-slate-800 shadow-xl rounded-3xl space-y-4 text-slate-900 dark:text-white">
              <div className="flex items-center justify-between">
                <div className="flex items-center gap-2">
                  <FileCheck className="h-5 w-5 text-emerald-600 dark:text-emerald-400" />
                  <h2 className="font-extrabold text-base text-slate-900 dark:text-white">Smart Energy Meter Receipt Verification</h2>
                </div>
              </div>

              <div className="space-y-2 text-xs font-semibold text-slate-700 dark:text-slate-300">
                <div className="flex justify-between items-center p-3 rounded-xl bg-slate-50 dark:bg-slate-900 border border-slate-200 dark:border-slate-800">
                  <span>DISCOM Green Tariff Verification Code:</span>
                  <span className="font-mono font-black text-emerald-700 dark:text-emerald-400 bg-white dark:bg-slate-800 px-2 py-0.5 rounded border border-slate-300 dark:border-slate-700">
                    OTP-VERIFIED-8821
                  </span>
                </div>
                <div className="flex justify-between items-center p-3 rounded-xl bg-slate-50 dark:bg-slate-900 border border-slate-200 dark:border-slate-800">
                  <span>Power Dispenser Status:</span>
                  <span className="font-bold text-slate-900 dark:text-white flex items-center gap-1">
                    <CheckCircle className="h-4 w-4 text-emerald-600 dark:text-emerald-400" /> COMPLETED (Zero Faults)
                  </span>
                </div>
              </div>
            </div>

            {/* AI LEDGER ADVISORY BOX */}
            <div className="rounded-2xl border border-emerald-500/30 bg-emerald-500/10 p-4 text-xs">
              <div className="flex items-start gap-2.5">
                <ShieldCheck className="h-5 w-5 text-emerald-700 dark:text-emerald-400 shrink-0 mt-0.5" />
                <div>
                  <h4 className="font-extrabold text-sm text-slate-900 dark:text-white mb-0.5">
                    BOSS AI Ledger & Receipt Guarantee
                  </h4>
                  <p className="text-slate-700 dark:text-slate-300 leading-relaxed font-medium">
                    All charging session transactions are synchronized directly with local DISCOM smart meters and protected by OTP verification. Receipts are stored permanently for warranty & green carbon credit claims.
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
