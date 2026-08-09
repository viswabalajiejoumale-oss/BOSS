import { useState, useMemo, useCallback, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import confetti from 'canvas-confetti';
import {
  LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer,
} from 'recharts';
import {
  Zap, Car, MapPin, History, Clock,
  AlertTriangle, X, CheckCircle, TrendingUp, Sparkles, Search, Map as MapIcon, ShieldCheck, Cpu, ArrowRight, RefreshCw, Check, Camera,
} from 'lucide-react';
import { useAuth } from '@/context/AuthContext';
import { useStations, useReservations } from '@/hooks/useData';
import {
  recommendStations,
  getStationLoadPercent,
  getAvailableChargers,
  isEmergencyPriority,
  calculateOutputVoltageAndPower,
} from '@/lib/aiEngine';
import {
  bookSlotBackendService,
  verifySmartMeterCodeBackendService,
  rejectReservationBackendService,
  cancelReservationBackendService,
} from '@/lib/backendServices';
import { SOCVerificationModal } from '@/components/SOCVerificationModal';
import { MapView } from '@/components/MapView';
import { LiveChargerDistribution } from '@/components/LiveChargerDistribution';
import { LiveUserUsageCard } from '@/components/LiveUserUsageCard';
import { AICopilotChat } from '@/components/AICopilotChat';
import { ShinyButton } from '@/components/ui/shiny-button';
import { BackgroundSystem } from '@/components/ui/BackgroundSystem';
import { ThemeToggle } from '@/components/ui/ThemeToggle';
import { NotificationCenter } from '@/components/ui/NotificationCenter';
import { BossMascotMessage } from '@/components/ui/BossMascotMessage';
import { BossAiInsight } from '@/components/ui/BossAiInsight';
import { VehicleDetailsModal } from '@/components/VehicleDetailsModal';
import { EmergencyModal } from '@/components/EmergencyModal';
import { VehicleDetailsPage } from '@/pages/VehicleDetailsPage';
import { AnalyticsPage } from '@/pages/AnalyticsPage';
import { FullMapPage } from '@/pages/FullMapPage';
import { HistoryPage } from '@/pages/HistoryPage';
import { BookSlotPage } from '@/pages/BookSlotPage';
import type { Reservation, BookingResult, SOCVerificationResult } from '@/types';

// Default center coordinates for India EV Station Map
const INDIA_CENTER_LAT = 20.5937;
const INDIA_CENTER_LON = 78.9629;

// Top Indian States with center coordinates & zoom levels
const INDIAN_STATES = [
  { name: 'All India', lat: 20.5937, lon: 78.9629, zoom: 5 },
  { name: 'Maharashtra', lat: 19.7515, lon: 75.7139, zoom: 7 },
  { name: 'Karnataka', lat: 15.3173, lon: 75.7139, zoom: 7 },
  { name: 'Tamil Nadu', lat: 11.1271, lon: 78.6569, zoom: 7 },
  { name: 'Delhi', lat: 28.7041, lon: 77.1025, zoom: 10 },
  { name: 'Kerala', lat: 10.8505, lon: 76.2711, zoom: 8 },
  { name: 'Gujarat', lat: 22.2587, lon: 71.1924, zoom: 7 },
  { name: 'Rajasthan', lat: 27.0238, lon: 74.2179, zoom: 7 },
  { name: 'Telangana', lat: 18.1124, lon: 79.0193, zoom: 8 },
  { name: 'West Bengal', lat: 22.9868, lon: 87.8550, zoom: 7 },
  { name: 'Uttar Pradesh', lat: 26.8467, lon: 80.9462, zoom: 7 },
  { name: 'Madhya Pradesh', lat: 22.9734, lon: 78.6569, zoom: 7 },
];

export function UserDashboard() {
  const { profile, signOut } = useAuth();
  const { stations, chargers, loading } = useStations();
  const { reservations, refetch: refetchRes } = useReservations(profile?.id);

  const [userLat, setUserLat] = useState(INDIA_CENTER_LAT);
  const [userLon, setUserLon] = useState(INDIA_CENTER_LON);
  const [mapZoom, setMapZoom] = useState(5);

  const [selectedStationId, setSelectedStationId] = useState<string | null>(null);
  const [searchQuery, setSearchQuery] = useState('');
  const [selectedState, setSelectedState] = useState('All India');
  const [selectedDistrict, setSelectedDistrict] = useState('All Districts');

  // Current Date Prebooking Slot Selection state (Date locked to TODAY ONLY)
  const todayDateStr = useMemo(
    () => new Date().toLocaleDateString(undefined, { weekday: 'short', year: 'numeric', month: 'short', day: 'numeric' }),
    []
  );
  const [selectedSlotHour, setSelectedSlotHour] = useState<number>(() => new Date().getHours());
  const [cancellingResId, setCancellingResId] = useState<string | null>(null);

  // Generate 24 1-hour slots for TODAY ONLY
  const todaySlots = useMemo(() => {
    const now = new Date();
    const currentHour = now.getHours();
    const slots = [];
    for (let h = 0; h < 24; h++) {
      const startFormatted = new Date(now.getFullYear(), now.getMonth(), now.getDate(), h).toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
      const endFormatted = new Date(now.getFullYear(), now.getMonth(), now.getDate(), h + 1).toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
      const isPassed = h < currentHour;
      const isCurrent = h === currentHour;
      slots.push({
        hour: h,
        label: `${startFormatted} — ${endFormatted}${isCurrent ? ' (Current Slot)' : isPassed ? ' (Passed)' : ''}`,
        isPassed,
        isCurrent,
      });
    }
    return slots;
  }, []);

  const [bookCurrent, setBookCurrent] = useState('32');
  const [batteryPct, setBatteryPct] = useState('50');

  const [bookingResult, setBookingResult] = useState<BookingResult | null>(null);
  const [bookingLoading, setBookingLoading] = useState(false);
  const [showEmergency, setShowEmergency] = useState(false);
  const [emergencyVehicle, setEmergencyVehicle] = useState(false);
  const [showSOCModal, setShowSOCModal] = useState(false);
  const [socVerificationResult, setSocVerificationResult] = useState<SOCVerificationResult | null>(null);
  const [showVehicleModal, setShowVehicleModal] = useState(false);
  const [currentView, setCurrentView] = useState<'dashboard' | 'vehicleDetails' | 'analytics' | 'map' | 'history' | 'bookSlot'>('dashboard');

  // Meter Code Verification state
  const [verificationSuccess, setVerificationSuccess] = useState(false);
  const [isTimerRunning, setIsTimerRunning] = useState(true);

  // User Smart Meter Input State
  const [userSmartMeterInputCode, setUserSmartMeterInputCode] = useState('');
  const [userVerificationMsg, setUserVerificationMsg] = useState<{ success: boolean; message: string } | null>(null);
  const [userVerifying, setUserVerifying] = useState(false);

  const handleUserVerifySmartMeterCode = async (e?: React.FormEvent) => {
    if (e) e.preventDefault();
    if (!profile?.id || !bookingResult?.reservation) return;
    const targetCode = userSmartMeterInputCode.trim().toUpperCase() || bookingResult.reservation.booking_code;
    if (!targetCode) return;

    setUserVerifying(true);
    setUserVerificationMsg(null);

    try {
      const res = await verifySmartMeterCodeBackendService(profile.id, targetCode);
      if (res.success) {
        setVerificationSuccess(true);
        setIsTimerRunning(false);
        setUserVerificationMsg({
          success: true,
          message: `✅ Smart Energy Meter verified code ${targetCode}! Power dispensing active. Status: COMPLETED.`
        });
        setBookingResult((prev) =>
          prev && prev.reservation
            ? {
              ...prev,
              reservation: { ...prev.reservation, status: 'completed' as const },
            }
            : prev
        );
        refetchRes();
        confetti({ particleCount: 100, spread: 70, origin: { y: 0.5 } });
      } else {
        setUserVerificationMsg({ success: false, message: res.message });
      }
    } catch {
      setUserVerificationMsg({ success: false, message: 'Verification error.' });
    } finally {
      setUserVerifying(false);
    }
  };

  // Mobile Battery Rescue Request State
  const [mobileBatteryDispatched, setMobileBatteryDispatched] = useState<{
    etaMinutes: number;
    unitId: string;
    batterySize: string;
    locationAddress: string;
    driverName: string;
    driverPhone: string;
  } | null>(null);

  const [emergencyReceivedMsg, setEmergencyReceivedMsg] = useState<string | null>(null);

  const handleDispatchMobileBattery = (batterySize: string, locName: string) => {
    const unitNumber = Math.floor(Math.random() * 89) + 10;
    setMobileBatteryDispatched({
      etaMinutes: 15,
      unitId: `BOSS-RESCUE-UNIT-${unitNumber}`,
      batterySize: `${batterySize} kWh Rapid Power Pack`,
      locationAddress: locName,
      driverName: 'Rajesh Kumar (EV Mobile Rescue Pilot)',
      driverPhone: '+91 98765 43210',
    });
    setShowEmergency(false);
  };

  // Group chargers by station ID
  const chargersByStation = useMemo(() => {
    const map = new Map<string, typeof chargers>();
    chargers.forEach((c) => {
      const arr = map.get(c.station_id) ?? [];
      arr.push(c);
      map.set(c.station_id, arr);
    });
    return map;
  }, [chargers]);

  // Dynamic districts/cities available in selected state
  const availableDistricts = useMemo(() => {
    const distSet = new Set<string>();
    stations.forEach((s) => {
      if (
        (selectedState === 'All India' || selectedState === 'All' || s.state === selectedState) &&
        s.city &&
        s.city !== 'Unknown' &&
        s.city !== 'India'
      ) {
        distSet.add(s.city);
      }
    });
    return ['All Districts', ...Array.from(distSet).sort()];
  }, [stations, selectedState]);

  // Filtered stations based on multi-field search query, state & district selection
  const filteredStations = useMemo(() => {
    const q = searchQuery.trim().toLowerCase();

    return stations.filter((s) => {
      // 1. Text Search matching across all fields
      const matchesSearch =
        !q ||
        s.name.toLowerCase().includes(q) ||
        (s.city && s.city.toLowerCase().includes(q)) ||
        (s.state && s.state.toLowerCase().includes(q)) ||
        (s.operator && s.operator.toLowerCase().includes(q)) ||
        (s.address && s.address.toLowerCase().includes(q));

      if (!matchesSearch) return false;

      // If user typed a search query, prioritize the query over rigid dropdown filters
      if (q) {
        // If state is selected, check if station matches state OR query matches state/city
        if (selectedState !== 'All India' && selectedState !== 'All') {
          const stateMatch =
            s.state === selectedState ||
            (selectedState === 'Delhi' && (s.state === 'Delhi' || s.city === 'Delhi' || s.state === 'New Delhi')) ||
            s.state?.toLowerCase().includes(q) ||
            s.city?.toLowerCase().includes(q);
          if (!stateMatch) return false;
        }

        // If district is selected, allow matching if station city matches district OR matches search query
        if (selectedDistrict !== 'All Districts') {
          const distMatch =
            s.city === selectedDistrict ||
            s.city?.toLowerCase().includes(q) ||
            s.name.toLowerCase().includes(q);
          if (!distMatch) return false;
        }

        return true;
      }

      // Default dropdown matching when search bar is empty
      const matchesState =
        selectedState === 'All India' ||
        selectedState === 'All' ||
        s.state === selectedState ||
        (selectedState === 'Delhi' && (s.state === 'Delhi' || s.city === 'Delhi' || s.state === 'New Delhi'));

      const matchesDistrict =
        selectedDistrict === 'All Districts' ||
        s.city === selectedDistrict;

      return matchesState && matchesDistrict;
    });
  }, [stations, searchQuery, selectedState, selectedDistrict]);

  // AI recommendations scored on distance, load, wait time, emergency
  const recommendations = useMemo(() => {
    if (filteredStations.length === 0) return [];
    return recommendStations(
      filteredStations,
      chargersByStation,
      userLat,
      userLon,
      parseInt(batteryPct) || 50,
      emergencyVehicle
    );
  }, [filteredStations, chargersByStation, userLat, userLon, batteryPct, emergencyVehicle]);

  // Auto-select first matching station when search query changes
  useEffect(() => {
    if (searchQuery.trim().length >= 2 && recommendations.length > 0) {
      setSelectedStationId(recommendations[0].station.id);
    }
  }, [searchQuery, recommendations]);

  const selectedStation = stations.find((s) => s.id === selectedStationId) ?? null;
  const selectedChargers = selectedStation ? (chargersByStation.get(selectedStation.id) ?? []) : [];

  // Calculate unedited Machine Output Voltage and Power Rate based on battery % and Current
  const { outputVoltageV, outputPowerKw } = useMemo(() => {
    return calculateOutputVoltageAndPower(parseInt(batteryPct) || 50, parseFloat(bookCurrent) || 32);
  }, [batteryPct, bookCurrent]);

  // Weekly usage chart data
  const usageData = useMemo(() => {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days.map((d) => ({
      day: d,
      kwh: Math.round(Math.random() * 30 + 10),
      cost: Math.round(Math.random() * 8 + 3),
    }));
  }, []);

  // Handle state button click
  const handleStateClick = (stateObj: typeof INDIAN_STATES[0]) => {
    setSelectedState(stateObj.name);
    setSelectedDistrict('All Districts');
    setUserLat(stateObj.lat);
    setUserLon(stateObj.lon);
    setMapZoom(stateObj.zoom);
  };

  // Main Slot Booking Handler connected to Backend Service
  const handleBook = useCallback(async () => {
    if (!selectedStation || !profile) return;

    setBookingLoading(true);
    setBookingResult(null);
    setVerificationSuccess(false);
    setIsTimerRunning(true);

    try {
      const battery = parseInt(batteryPct) || 50;
      const scheduledDateObj = new Date();
      scheduledDateObj.setHours(selectedSlotHour, 0, 0, 0);

      const res = await bookSlotBackendService({
        userId: profile.id,
        station: selectedStation,
        allStations: stations,
        chargersByStation,
        scheduledTime: scheduledDateObj.toISOString(),
        chargeCurrentA: parseFloat(bookCurrent) || 32,
        batteryPercent: battery,
        selectedDistrict,
        isEmergency: emergencyVehicle,
      });

      setBookingResult(res);

      if (res.success && res.station) {
        setSelectedStationId(res.station.id);
        refetchRes();
      }
    } catch {
      setBookingResult({ success: false, message: 'An unexpected error occurred during slot booking.' });
    } finally {
      setBookingLoading(false);
    }
  }, [selectedStation, stations, chargersByStation, selectedSlotHour, bookCurrent, batteryPct, emergencyVehicle, profile, selectedDistrict, refetchRes]);

  // Cancel Booking Code Handler
  const handleCancelBooking = useCallback(async (reservationId: string) => {
    if (!profile?.id) return;
    setCancellingResId(reservationId);
    try {
      const res = await cancelReservationBackendService(profile.id, reservationId);
      if (res.success) {
        setIsTimerRunning(false);
        setBookingResult((prev) =>
          prev && prev.reservation?.id === reservationId
            ? {
              ...prev,
              success: false,
              message: 'Booking slot code has been cancelled.',
              reservation: { ...prev.reservation, status: 'cancelled' as const },
            }
            : prev
        );
        refetchRes();
      }
    } catch (err) {
      console.error('Error cancelling reservation:', err);
    } finally {
      setCancellingResId(null);
    }
  }, [profile, refetchRes]);

  // Polling for remote admin verification status updates
  useEffect(() => {
    if (!bookingResult?.success || !bookingResult.reservation?.id || !isTimerRunning) return;

    const interval = setInterval(() => {
      refetchRes();
    }, 3000);

    return () => clearInterval(interval);
  }, [bookingResult, isTimerRunning, refetchRes]);

  // Sync active reservation status changes from database to UI
  useEffect(() => {
    if (!bookingResult?.success || !bookingResult.reservation?.id) return;

    const activeRes = reservations.find((r) => r.id === bookingResult.reservation?.id);
    if (activeRes) {
      if (activeRes.status === 'completed' && !verificationSuccess) {
        setIsTimerRunning(false);
        setVerificationSuccess(true);
        confetti({ particleCount: 150, spread: 90, origin: { y: 0.5 } });
        // Update bookingResult to completed and reflect output voltage/power details
        setBookingResult((prev) => {
          if (!prev) return null;
          const updatedRes = prev.reservation
            ? { ...prev.reservation, status: 'completed' as const }
            : undefined;
          return {
            ...prev,
            reservation: updatedRes,
            output_voltage_v: activeRes.output_voltage_v || prev.output_voltage_v,
            output_power_kw: activeRes.output_power_kw || prev.output_power_kw,
          };
        });
      } else if (activeRes.status === 'expired' && isTimerRunning) {
        setIsTimerRunning(false);
        setBookingResult((prev) => prev ? {
          ...prev,
          success: false,
          message: 'Code Expired! You were late to verify at the station meter. Please book a new slot.'
        } : null);
      }
    }
  }, [reservations, bookingResult, verificationSuccess, isTimerRunning]);

  const handleActivateEmergencyPriority = useCallback(async (isEmergencyVeh: boolean, batteryPctVal: number) => {
    setEmergencyVehicle(isEmergencyVeh || batteryPctVal <= 10);
    setBatteryPct(batteryPctVal.toString());
    setShowEmergency(false);
    if (recommendations.length > 0) {
      setSelectedStationId(recommendations[0].station.id);
    }
  }, [recommendations]);

  const handleNotifyBatteryReceived = () => {
    setEmergencyVehicle(false);
    setBatteryPct('85');
    setEmergencyReceivedMsg('⚡ Emergency Battery Pack Received & Confirmed! Vehicle state-of-charge restored to 85%. Standard charging queue rules resumed.');
    setTimeout(() => {
      setEmergencyReceivedMsg(null);
    }, 8000);
  };

  // Prevent background scrolling during emergency modal
  useEffect(() => {
    if (showEmergency) {
      document.body.style.overflow = 'hidden';
    } else {
      document.body.style.overflow = '';
    }
    return () => {
      document.body.style.overflow = '';
    };
  }, [showEmergency]);

  if (currentView === 'vehicleDetails') {
    return <VehicleDetailsPage onBack={() => setCurrentView('dashboard')} profile={profile} />;
  }

  if (currentView === 'analytics') {
    return <AnalyticsPage onBack={() => setCurrentView('dashboard')} />;
  }

  if (currentView === 'map') {
    return (
      <FullMapPage
        onBack={() => setCurrentView('dashboard')}
        stations={stations}
        chargers={chargers}
        userLat={userLat}
        userLon={userLon}
        selectedStationId={selectedStationId}
        onSelectStation={(id) => setSelectedStationId(id)}
      />
    );
  }

  if (currentView === 'history') {
    return (
      <HistoryPage
        onBack={() => setCurrentView('dashboard')}
        reservations={reservations}
        stations={stations}
      />
    );
  }

  if (currentView === 'bookSlot') {
    return (
      <BookSlotPage
        onBack={() => setCurrentView('dashboard')}
        stations={stations}
        selectedStationId={selectedStationId}
        userId={profile?.id}
        onBookingSuccess={(res) => {
          setBookingResult(res);
          refetchRes();
        }}
      />
    );
  }

  return (
    <BackgroundSystem variant="dashboard">
      {/* Header */}
      <header className="sticky top-0 z-30 border-b border-slate-200/80 dark:border-slate-800/80 bg-white/90 dark:bg-slate-950/80 backdrop-blur-xl shadow-lg transition-colors">
        <div className="mx-auto flex max-w-7xl items-center justify-between px-4 py-3.5 md:px-6">
          <div className="flex items-center gap-3">
            <div className="flex items-center justify-center">
              <img src="/boss-logo-transparent.png" alt="BOSS Logo" className="h-9 w-auto object-contain" />
            </div>
            <div>
              <h1 className="text-base font-extrabold text-slate-900 dark:text-white flex items-center gap-2">
                EV COMMAND CENTER <span className="text-[10px] font-bold text-emerald-700 dark:text-emerald-400 bg-emerald-500/15 border border-emerald-500/30 px-2 py-0.5 rounded-md">LIVE NETWORK</span>
              </h1>
              <p className="text-xs text-slate-600 dark:text-slate-400 font-medium">Welcome back, {profile?.name ?? 'EV Driver'}</p>
            </div>
          </div>
          <div className="flex items-center gap-2 sm:gap-3">
            <ThemeToggle />
            <NotificationCenter />
            <button
              onClick={() => setShowEmergency(true)}
              className="relative flex items-center gap-2 overflow-hidden rounded-xl bg-gradient-to-r from-red-600 via-rose-600 to-red-700 px-3.5 py-2 text-xs font-black text-white shadow-lg shadow-red-600/30 transition-all duration-300 hover:scale-105 hover:shadow-red-600/50 hover:from-red-500 hover:to-rose-500 cursor-pointer border border-red-400/40 group"
            >
              <span className="relative flex h-2.5 w-2.5">
                <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-red-300 opacity-75"></span>
                <span className="relative inline-flex rounded-full h-2.5 w-2.5 bg-white"></span>
              </span>
              <AlertTriangle className="relative h-4 w-4 text-white group-hover:rotate-12 transition-transform" />
              <span className="relative hidden sm:inline tracking-wider uppercase font-black">EMERGENCY RESCUE</span>
            </button>
            <button onClick={signOut} className="boss-btn-ghost text-xs cursor-pointer py-2 px-3 border-slate-300 dark:border-slate-700 hover:border-red-500/40 hover:text-red-600 dark:hover:text-red-400">
              Sign Out
            </button>
          </div>
        </div>
      </header>

      <main className="mx-auto max-w-7xl space-y-6 px-4 py-6 md:px-6">
        {/* Mobile Battery Dispatch Status Tracking PRO Telemetry HUD */}
        {mobileBatteryDispatched && (
          <div className="relative overflow-hidden rounded-2xl border border-red-500/50 bg-gradient-to-r from-[#1b0505] via-[#2a0808] to-[#140404] p-4 text-white shadow-2xl shadow-red-950/60 backdrop-blur-xl">
            <div className="absolute top-0 left-0 right-0 h-1 bg-gradient-to-r from-red-500 via-amber-400 to-rose-600 animate-pulse" />

            <div className="flex flex-wrap items-center justify-between gap-4">
              <div className="flex items-center gap-3.5">
                <div className="relative flex h-12 w-12 items-center justify-center rounded-2xl bg-gradient-to-br from-red-600 to-rose-700 text-2xl shadow-lg shadow-red-600/50">
                  🚚
                  <span className="absolute -top-1 -right-1 flex h-3 w-3">
                    <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-amber-400 opacity-75"></span>
                    <span className="relative inline-flex rounded-full h-3 w-3 bg-amber-400"></span>
                  </span>
                </div>

                <div>
                  <div className="flex items-center gap-2 flex-wrap">
                    <span className="rounded-full bg-red-500/20 px-2.5 py-0.5 text-[9px] font-black uppercase text-red-400 border border-red-500/30 tracking-widest flex items-center gap-1">
                      <span className="h-1.5 w-1.5 rounded-full bg-red-400 animate-ping" /> MOBILE RESCUE EN ROUTE
                    </span>
                    <span className="text-xs text-amber-300 font-mono font-black bg-amber-500/10 px-2 py-0.5 rounded border border-amber-500/30">
                      ETA: {mobileBatteryDispatched.etaMinutes} MINS
                    </span>
                    <span className="text-[10px] text-gray-400 font-mono">
                      UNIT: {mobileBatteryDispatched.unitId}
                    </span>
                  </div>

                  <h3 className="font-black text-base text-white mt-0.5 tracking-tight flex items-center gap-2">
                    Emergency Mobile EV Battery Rescue Dispatched
                  </h3>

                  <p className="text-xs text-red-200/90 font-medium flex items-center gap-3 flex-wrap mt-0.5">
                    <span>⚡ Pack: <b>{mobileBatteryDispatched.batterySize}</b></span>
                    <span>📍 Location: <b>{mobileBatteryDispatched.locationAddress}</b></span>
                    <span>👨‍✈️ Pilot: <b>{mobileBatteryDispatched.driverName}</b></span>
                  </p>
                </div>
              </div>

              <div className="flex items-center gap-2">
                <a
                  href={`tel:${mobileBatteryDispatched.driverPhone}`}
                  className="rounded-xl border border-emerald-500/40 bg-emerald-500/15 px-3 py-2 text-xs font-black text-emerald-400 hover:bg-emerald-500/25 transition cursor-pointer flex items-center gap-1.5"
                >
                  📞 Call Pilot
                </a>
                <button
                  onClick={() => setMobileBatteryDispatched(null)}
                  className="rounded-xl border border-red-500/40 bg-red-500/15 px-3 py-2 text-xs font-bold text-red-300 hover:bg-red-500/25 transition cursor-pointer"
                >
                  Dismiss Tracking
                </button>
              </div>
            </div>
          </div>
        )}

        {/* Emergency Battery Received Toast Notification Banner */}
        {emergencyReceivedMsg && (
          <div className="rounded-2xl border border-emerald-500/50 bg-gradient-to-r from-emerald-950 via-teal-900 to-black p-4 text-white shadow-xl flex items-center justify-between gap-4 animate-bounce">
            <div className="flex items-center gap-3">
              <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-emerald-600 text-white font-bold shadow-lg shadow-emerald-600/40">
                <CheckCircle className="h-6 w-6" />
              </div>
              <div>
                <span className="rounded-full bg-emerald-500/30 px-2 py-0.5 text-[9px] font-black uppercase text-emerald-300 tracking-wider border border-emerald-400/40">
                  BATTERY SERVICE COMPLETED
                </span>
                <p className="text-xs font-bold text-emerald-200 mt-0.5">{emergencyReceivedMsg}</p>
              </div>
            </div>
            <button
              onClick={() => setEmergencyReceivedMsg(null)}
              className="rounded-xl border border-emerald-400/40 bg-emerald-500/20 px-3 py-1.5 text-xs font-bold text-emerald-200 hover:bg-emerald-500/40 transition cursor-pointer shrink-0"
            >
              Dismiss
            </button>
          </div>
        )}

        {/* Critical Emergency Priority Active Alert HUD */}
        {emergencyVehicle && (
          <div className="relative overflow-hidden rounded-2xl border border-red-500/60 bg-gradient-to-r from-[#1c0606] via-[#2c0909] to-[#0f0303] p-4 text-white shadow-xl flex flex-wrap items-center justify-between gap-4">
            <div className="flex items-center gap-3">
              <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-red-600 text-white font-bold animate-bounce shadow-lg shadow-red-600/40">
                🚨
              </div>
              <div>
                <div className="flex items-center gap-2">
                  <span className="rounded-full bg-red-500/30 px-2 py-0.5 text-[9px] font-black uppercase text-red-300 tracking-wider border border-red-400/40">
                    EMERGENCY PRIORITY PROTOCOL ENGAGED
                  </span>
                  <span className="text-xs text-amber-300 font-mono font-bold">BYPASSING QUEUES</span>
                </div>
                <h4 className="text-sm font-extrabold text-white">High Priority Station Slot Allocation Active</h4>
                <p className="text-xs text-red-200/80 font-medium">
                  Grid stations are overriding general reservation queues & transformer caps to assign immediate fast charger ports.
                </p>
              </div>
            </div>

            <div className="flex items-center gap-2 shrink-0">
              <button
                onClick={handleNotifyBatteryReceived}
                className="rounded-xl border border-emerald-500/50 bg-emerald-600/30 px-3.5 py-2 text-xs font-black text-emerald-300 hover:bg-emerald-600 hover:text-white transition cursor-pointer shadow-lg flex items-center gap-1.5 animate-pulse"
              >
                <CheckCircle className="h-4 w-4 text-emerald-400" />
                <span>Notify Battery Received</span>
              </button>
              <button
                onClick={() => setEmergencyVehicle(false)}
                className="rounded-xl border border-red-400/40 bg-red-500/20 px-3 py-2 text-xs font-bold text-red-200 hover:bg-red-500/40 transition cursor-pointer"
              >
                Disable Priority
              </button>
            </div>
          </div>
        )}

        {/* Active User Charging Session Telemetry (LIVE ONLY) */}
        {bookingResult?.success && bookingResult.reservation && (
          <div className="my-4">
            <LiveUserUsageCard
              reservation={bookingResult.reservation}
              station={bookingResult.station || selectedStation || undefined}
              onCancel={(id) => handleCancelBooking(id)}
            />
          </div>
        )}

        {/* Top summary row: Vehicle Specs + Charging Analytics */}
        <div className="grid grid-cols-1 gap-4 md:grid-cols-3">
          <div className="boss-card">
            <div className="mb-3 flex items-center justify-between">
              <div className="flex items-center gap-2">
                <Car className="h-5 w-5 text-emerald-600 dark:text-emerald-400" />
                <h2 className="font-bold text-slate-900 dark:text-white text-base">Vehicle Specs</h2>
              </div>
              <ShinyButton
                onClick={() => setCurrentView('vehicleDetails')}
                className="bg-emerald-600 text-white shadow-md shadow-emerald-600/25 hover:shadow-lg hover:shadow-emerald-600/35 px-3 py-1 text-xs font-bold"
              >
                <div className="flex items-center gap-1.5">
                  <Sparkles className="h-3.5 w-3.5 text-amber-300" />
                  <span>MORE INFO</span>
                </div>
              </ShinyButton>
            </div>
            <dl className="space-y-2 text-sm">
              <div className="flex justify-between"><dt className="text-slate-600 dark:text-slate-400 font-medium">Make</dt><dd className="font-semibold text-slate-900 dark:text-white">{profile?.vehicle_make ?? 'Tesla'}</dd></div>
              <div className="flex justify-between"><dt className="text-slate-600 dark:text-slate-400 font-medium">Model</dt><dd className="font-semibold text-slate-900 dark:text-white">{profile?.vehicle_model ?? 'Model 3'}</dd></div>
              <div className="flex justify-between"><dt className="text-slate-600 dark:text-slate-400 font-medium">Year</dt><dd className="font-semibold text-slate-900 dark:text-white">{profile?.vehicle_year ?? 2024}</dd></div>
              <div className="flex justify-between"><dt className="text-slate-600 dark:text-slate-400 font-medium">Battery Capacity</dt><dd className="font-bold text-emerald-600 dark:text-emerald-400">{profile?.battery_capacity_kwh ? `${profile.battery_capacity_kwh} kWh` : '75 kWh'}</dd></div>
            </dl>
          </div>

          <div className="boss-card md:col-span-2">
            <div className="mb-3 flex items-center justify-between">
              <div className="flex items-center gap-2">
                <TrendingUp className="h-5 w-5 text-emerald-600 dark:text-emerald-400" />
                <h2 className="font-bold text-slate-900 dark:text-white text-base">Weekly Charging Energy Analytics</h2>
              </div>
              <ShinyButton
                onClick={() => setCurrentView('analytics')}
                className="bg-emerald-600 text-white shadow-md shadow-emerald-600/25 hover:shadow-lg hover:shadow-emerald-600/35 px-3 py-1 text-xs font-bold"
              >
                <div className="flex items-center gap-1.5">
                  <Sparkles className="h-3.5 w-3.5 text-amber-300" />
                  <span>MORE INFO</span>
                </div>
              </ShinyButton>
            </div>
            <ResponsiveContainer width="100%" height={140}>
              <LineChart data={usageData}>
                <CartesianGrid strokeDasharray="3 3" stroke="#e2e8f0" />
                <XAxis dataKey="day" stroke="#64748b" fontSize={12} />
                <YAxis stroke="#64748b" fontSize={12} />
                <Tooltip contentStyle={{ background: '#ffffff', border: '1px solid #cbd5e1', borderRadius: 8, color: '#0f172a' }} />
                <Line type="monotone" dataKey="kwh" stroke="#16a34a" strokeWidth={2.5} dot={{ fill: '#16a34a', r: 4 }} name="Energy (kWh)" />
              </LineChart>
            </ResponsiveContainer>
          </div>
        </div>

        {/* INDIAN STATES INTERACTIVE BUTTONS BAR */}
        <div className="boss-card p-4 space-y-3">
          <div className="flex flex-wrap items-center justify-between gap-2">
            <div className="flex items-center gap-2">
              <MapIcon className="h-5 w-5 text-emerald-600 dark:text-emerald-400" />
              <h2 className="font-bold text-base text-slate-900 dark:text-white">Select Indian State / Region</h2>
            </div>
            <div className="flex items-center gap-3">
              <span className="text-xs text-slate-600 dark:text-slate-400 font-semibold hidden sm:inline">
                Showing: <b className="text-emerald-700 dark:text-emerald-400 font-extrabold">{selectedState}</b> ({filteredStations.length} stations)
              </span>
              <ShinyButton
                onClick={() => setCurrentView('map')}
                className="bg-emerald-600 text-white shadow-md shadow-emerald-600/25 hover:shadow-lg hover:shadow-emerald-600/35 px-3 py-1 text-xs font-bold"
              >
                <div className="flex items-center gap-1.5">
                  <Sparkles className="h-3.5 w-3.5 text-amber-300" />
                  <span>MORE INFO</span>
                </div>
              </ShinyButton>
            </div>
          </div>

          {/* Interactive State Buttons */}
          <div className="flex flex-wrap gap-2 pt-1">
            {INDIAN_STATES.map((st) => {
              const isActive = selectedState === st.name;
              return (
                <button
                  key={st.name}
                  onClick={() => handleStateClick(st)}
                  className={`px-3.5 py-1.5 rounded-xl text-xs font-bold transition-all duration-200 cursor-pointer ${isActive
                    ? 'bg-emerald-600 text-white font-extrabold shadow-md shadow-emerald-500/30 scale-105 border-2 border-emerald-700'
                    : 'bg-slate-100 dark:bg-slate-800 text-slate-800 dark:text-slate-200 border border-slate-300 dark:border-slate-700 hover:border-emerald-600 hover:bg-emerald-50 dark:hover:bg-emerald-950/40 hover:text-emerald-800 dark:hover:text-emerald-300'
                    }`}
                >
                  ⚡ {st.name}
                </button>
              );
            })}
          </div>
        </div>

        {/* MAIN LAYOUT: AI Recommended Stations & Filters (LEFT) & Bigger Map View (RIGHT) */}
        <div className="grid grid-cols-1 gap-6 lg:grid-cols-12">
          {/* LEFT SIDE (5 columns): District Filter, Search & AI Recommended Stations */}
          <div className="lg:col-span-5 space-y-4">
            <div className="boss-card space-y-3">
              <div className="flex items-center justify-between">
                <div className="flex items-center gap-2">
                  <Sparkles className="h-5 w-5 text-emerald-600 dark:text-emerald-400" />
                  <h2 className="font-bold text-base text-slate-900 dark:text-white">AI Recommended Stations</h2>
                </div>
                <span className="rounded-full bg-emerald-500/15 px-2.5 py-0.5 text-xs font-bold text-emerald-700 dark:text-emerald-400 border border-emerald-500/30">
                  {recommendations.length} Stations
                </span>
              </div>

              {/* District Dropdown Selector */}
              <div>
                <label className="boss-label text-xs flex items-center gap-1">
                  <MapPin className="h-3.5 w-3.5 text-emerald-600 dark:text-emerald-400" /> Select District / City
                </label>
                <select
                  value={selectedDistrict}
                  onChange={(e) => setSelectedDistrict(e.target.value)}
                  className="boss-input text-xs py-2 font-semibold"
                >
                  {availableDistricts.map((dist) => (
                    <option key={dist} value={dist}>
                      {dist}
                    </option>
                  ))}
                </select>
              </div>

              {/* Search Box with clear button */}
              <div className="space-y-1">
                <div className="relative">
                  <Search className="absolute left-3 top-2.5 h-4 w-4 text-slate-400" />
                  <input
                    type="text"
                    placeholder="Search by Station, District, State, or Operator (e.g. Tata, Pune, Ather)..."
                    value={searchQuery}
                    onChange={(e) => setSearchQuery(e.target.value)}
                    className="boss-input pl-9 pr-8 text-xs font-semibold"
                  />
                  {searchQuery && (
                    <button
                      onClick={() => setSearchQuery('')}
                      className="absolute right-2.5 top-2.5 text-slate-400 hover:text-slate-700 transition cursor-pointer"
                      title="Clear search"
                    >
                      <X className="h-4 w-4" />
                    </button>
                  )}
                </div>
                {searchQuery && (
                  <div className="flex items-center justify-between text-[11px] font-semibold px-1 text-slate-600">
                    <span>Searching: "{searchQuery}"</span>
                    <span className="text-emerald-700 font-bold">{filteredStations.length} station(s) found</span>
                  </div>
                )}
              </div>
              {/* Recommended Stations Scrollable List */}
              {loading ? (
                <div className="py-8 text-center text-sm text-slate-500 dark:text-slate-400 animate-pulse font-medium">
                  Loading India EV stations...
                </div>
              ) : recommendations.length === 0 ? (
                <div className="py-8 text-center text-sm text-slate-500 dark:text-slate-400 font-medium">
                  No stations match "{searchQuery || selectedDistrict}". Try searching another keyword or selecting "All Districts".
                </div>
              ) : (
                <div className="space-y-2.5 max-h-[440px] overflow-y-auto pr-1">
                  {recommendations.slice(0, 30).map((rec) => {
                    const isSelected = selectedStationId === rec.station.id;
                    return (
                      <motion.button
                        key={rec.station.id}
                        whileHover={{ scale: 1.015, x: 3 }}
                        whileTap={{ scale: 0.98 }}
                        onClick={() => setSelectedStationId(rec.station.id)}
                        className={`w-full rounded-xl border p-3 text-left transition-all cursor-pointer ${isSelected
                            ? 'border-emerald-600 dark:border-emerald-500 bg-emerald-50 dark:bg-emerald-950/50 shadow-md shadow-emerald-500/10 ring-2 ring-emerald-500/50'
                            : 'border-slate-200 dark:border-slate-800 bg-white dark:bg-slate-900/60 text-slate-900 dark:text-white hover:border-emerald-500/50 hover:bg-slate-100 dark:hover:bg-slate-800/80'
                          }`}
                      >
                        <div className="flex items-start justify-between gap-2">
                          <div>
                            <span className="font-bold text-sm text-slate-900 dark:text-white block">
                              ⚡ {rec.station.name}
                            </span>
                            <span className="text-xs text-slate-600 dark:text-slate-400 font-medium">
                              District: <b className="text-slate-900 dark:text-white">{rec.station.city || 'India'}</b> • {rec.station.state || 'State'}
                            </span>
                          </div>
                          <span className="shrink-0 rounded-full bg-emerald-500/15 px-2 py-0.5 text-xs font-bold text-emerald-700 dark:text-emerald-400 border border-emerald-500/30">
                            Score: {rec.score}
                          </span>
                        </div>
                        <div className="mt-2 flex flex-wrap gap-2 text-xs font-semibold">
                          <span className="rounded bg-slate-100 dark:bg-slate-800 text-slate-800 dark:text-slate-200 px-1.5 py-0.5 border border-slate-300 dark:border-slate-700">
                            {rec.availableChargers} Available
                          </span>
                          <span className={`rounded px-1.5 py-0.5 border ${rec.loadPercent >= 80 ? 'bg-red-500/15 text-red-600 dark:text-red-400 border-red-500/30 font-bold' : 'bg-slate-100 dark:bg-slate-800 text-slate-800 dark:text-slate-200 border-slate-300 dark:border-slate-700'}`}>
                            Load: {rec.loadPercent}% {rec.loadPercent >= 80 ? '(>80% Rule Redirect)' : ''}
                          </span>
                        </div>
                      </motion.button>
                    );
                  })}
                </div>
              )}
            </div>
          </div>

          {/* RIGHT SIDE (7 columns): Bigger Map View */}
          <div className="lg:col-span-7">
            <div className="boss-card p-4 space-y-3 h-full flex flex-col justify-between">
              <div className="flex flex-wrap items-center justify-between gap-2">
                <div className="flex items-center gap-2">
                  <MapPin className="h-5 w-5 text-emerald-600 dark:text-emerald-400" />
                  <h2 className="font-extrabold text-base text-slate-900 dark:text-white">India Charging Station Map</h2>
                </div>
                <div className="flex items-center gap-2">
                  <span className="h-2 w-2 rounded-full bg-emerald-500 animate-ping" />
                  <span className="text-xs text-slate-600 dark:text-slate-400 font-extrabold">
                    1,000 India Stations Pinpointed
                  </span>
                </div>
              </div>

              {/* Map Canvas with automatic resize observer */}
              <div className="w-full flex-1 min-h-[460px] rounded-xl overflow-hidden border border-slate-200 dark:border-slate-800 shadow-md">
                <MapView
                  stations={filteredStations}
                  userLat={userLat}
                  userLon={userLon}
                  zoom={mapZoom}
                  selectedId={selectedStationId}
                  onSelect={(id) => setSelectedStationId(id)}
                  height="480px"
                />
              </div>
            </div>
          </div>
        </div>

        {/* Live Charger Port Telemetry & Distribution Gauge */}
        {selectedStation && (
          <div className="my-6">
            <LiveChargerDistribution
              station={selectedStation}
              chargers={selectedChargers}
              onSelectCharger={() => {
                document.getElementById('book-slot-section')?.scrollIntoView({ behavior: 'smooth' });
              }}
            />
          </div>
        )}

        {/* BOOK SLOT SECTION (Refactored 80% EV Load Rule, 1-Hour Slot, Output Voltage Display) */}
        <div id="book-slot-section" className="boss-card border-emerald-500/30 ring-1 ring-emerald-500/20 shadow-xl">
          <div className="mb-4 flex items-center justify-between">
            <div className="flex items-center gap-2">
              <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-emerald-600 text-white font-bold shadow-md">
                <Zap className="h-5 w-5" />
              </div>
              <div>
                <h2 className="text-lg font-extrabold text-slate-900 dark:text-white">Book Slot at Station</h2>
                <p className="text-xs text-slate-600 dark:text-slate-400 font-medium">Fixed 1-Hour Slot Allocation & Smart Energy Meter Verification</p>
              </div>
            </div>
            <div className="flex items-center gap-3">
              {emergencyVehicle && (
                <span className="rounded-full bg-red-100 border border-red-300 px-3 py-0.5 text-xs font-extrabold text-red-700 animate-pulse">
                  Emergency Priority Active
                </span>
              )}
              <ShinyButton
                onClick={() => setCurrentView('bookSlot')}
                className="bg-emerald-600 text-white shadow-md shadow-emerald-600/25 hover:shadow-lg hover:shadow-emerald-600/35 px-3 py-1 text-xs font-bold"
              >
                <div className="flex items-center gap-1.5">
                  <Sparkles className="h-3.5 w-3.5 text-amber-300" />
                  <span>MORE INFO</span>
                </div>
              </ShinyButton>
            </div>
          </div>

          <div className="grid grid-cols-1 gap-6 lg:grid-cols-3">
            {/* Selected Station & District Details */}
            <div className="space-y-3">
              <h3 className="text-xs font-bold uppercase tracking-wider text-slate-700 dark:text-slate-300">Selected Station</h3>
              {selectedStation ? (
                <div className="rounded-xl border border-slate-200 dark:border-slate-800 bg-slate-50 dark:bg-slate-900/60 p-4 space-y-2.5">
                  <h4 className="font-bold text-base text-emerald-800 dark:text-emerald-400">{selectedStation.name}</h4>
                  <p className="text-xs text-slate-600 dark:text-slate-300 font-medium">📍 {selectedStation.address}</p>
                  <div className="grid grid-cols-2 gap-2 text-xs">
                    <div className="rounded bg-white dark:bg-slate-800 border border-slate-200 dark:border-slate-700 p-2">
                      <span className="text-slate-500 dark:text-slate-400 block font-medium">District / City</span>
                      <span className="font-bold text-slate-900 dark:text-white">{selectedStation.city || 'India'}</span>
                    </div>
                    <div className="rounded bg-white dark:bg-slate-800 border border-slate-200 dark:border-slate-700 p-2">
                      <span className="text-slate-500 dark:text-slate-400 block font-medium">State</span>
                      <span className="font-bold text-slate-900 dark:text-white">{selectedStation.state || 'State'}</span>
                    </div>
                  </div>
                  {selectedStation.availability_timing && (
                    <div className="rounded bg-emerald-50/50 dark:bg-emerald-950/30 border border-emerald-250 dark:border-emerald-500/30 p-2 text-xs">
                      <span className="text-emerald-700 dark:text-emerald-400 block font-bold text-[11px]">⏰ Operating Hours / Timings</span>
                      <span className="font-semibold text-slate-800 dark:text-slate-200">{selectedStation.availability_timing}</span>
                    </div>
                  )}
                </div>
              ) : (
                <div className="flex h-36 items-center justify-center rounded-xl border border-dashed border-slate-300 dark:border-slate-700 text-xs text-slate-500 dark:text-slate-400 text-center font-medium p-4">
                  Select a station from the list or click a Thunder Green ⚡ pin on the map.
                </div>
              )}
            </div>

            {/* Queue & Load Status (EV 80% Rule Indicator) */}
            <div className="space-y-3">
              <h3 className="text-xs font-bold uppercase tracking-wider text-slate-700 dark:text-slate-300">Transformer Capacity & EV 80% Rule</h3>
              {selectedStation ? (
                <div className="space-y-3">
                  <div className="rounded-xl border border-slate-200 dark:border-slate-800 bg-slate-50 dark:bg-slate-900/60 p-3.5">
                    <div className="mb-1.5 flex items-center justify-between text-xs font-bold">
                      <span className="text-slate-700 dark:text-slate-300">Station Transformer Load</span>
                      <span className={`${getStationLoadPercent(selectedStation) >= 80 ? 'text-red-600 dark:text-red-400 font-extrabold' : 'text-emerald-700 dark:text-emerald-400'}`}>
                        {getStationLoadPercent(selectedStation).toFixed(0)}% {getStationLoadPercent(selectedStation) >= 80 ? '(Rule: >80% Redirect)' : ''}
                      </span>
                    </div>
                    <div className="h-2 overflow-hidden rounded-full bg-slate-200 dark:bg-slate-800">
                      <div
                        className={`h-full rounded-full transition-all ${getStationLoadPercent(selectedStation) >= 80 ? 'bg-red-600' : 'bg-emerald-600'}`}
                        style={{ width: `${Math.min(getStationLoadPercent(selectedStation), 100)}%` }}
                      />
                    </div>
                    <div className="mt-2 flex items-center justify-between text-[11px] font-semibold text-slate-600 dark:text-slate-400">
                      <span>EV Load: <strong className="text-emerald-700 dark:text-emerald-400 font-bold">{selectedStation.current_load_kva.toFixed(1)} kW</strong></span>
                      <span>Limit: {selectedStation.transformer_load_capacity_kva || 500} kVA</span>
                    </div>
                  </div>
                  <div className="grid grid-cols-3 gap-2 text-center">
                    <div className="rounded-lg bg-emerald-50 dark:bg-emerald-950/40 border border-emerald-200 dark:border-emerald-500/30 p-2">
                      <div className="text-base font-bold text-emerald-800 dark:text-emerald-400">{getAvailableChargers(selectedChargers).length}</div>
                      <div className="text-[10px] font-bold text-emerald-700 dark:text-emerald-400">Available</div>
                    </div>
                    <div className="rounded-lg bg-amber-50 dark:bg-amber-950/40 border border-amber-200 dark:border-amber-500/30 p-2">
                      <div className="text-base font-bold text-amber-800 dark:text-amber-400">{selectedChargers.filter((c) => c.status === 'occupied').length}</div>
                      <div className="text-[10px] font-bold text-amber-700 dark:text-amber-400">Occupied</div>
                    </div>
                    <div className="rounded-lg bg-red-50 dark:bg-red-950/40 border border-red-200 dark:border-red-500/30 p-2">
                      <div className="text-base font-bold text-red-800 dark:text-red-400">{selectedChargers.filter((c) => c.status === 'fault').length}</div>
                      <div className="text-[10px] font-bold text-red-700 dark:text-red-400">Fault</div>
                    </div>
                  </div>
                </div>
              ) : (
                <div className="flex h-36 items-center justify-center rounded-xl border border-dashed border-slate-300 text-xs text-slate-500 font-medium">
                  Select station to view capacity load
                </div>
              )}
            </div>

            {/* Booking Form Inputs & Unedited Machine Output Voltage Display */}
            <div className="space-y-3">
              <h3 className="text-xs font-bold uppercase tracking-wider text-slate-600">Slot Configuration</h3>
              <div>
                <label className="boss-label text-xs">Station Selection</label>
                <select className="boss-input text-xs font-semibold" value={selectedStationId ?? ''} onChange={(e) => setSelectedStationId(e.target.value || null)}>
                  <option value="">Select station in district...</option>
                  {filteredStations.slice(0, 50).map((s) => (
                    <option key={s.id} value={s.id}>{s.name} ({s.city || 'District'})</option>
                  ))}
                </select>
              </div>

              {/* Locked Date Input for Current Date Only */}
              <div>
                <label className="boss-label text-xs flex items-center justify-between">
                  <span>Prebook Date</span>
                  <span className="text-[10px] text-amber-700 dark:text-amber-400 font-bold uppercase bg-amber-500/15 px-1.5 py-0.5 rounded border border-amber-500/30">Current Date Only</span>
                </label>
                <input
                  type="text"
                  disabled
                  value={`📅 ${todayDateStr} (Fixed to Current Date)`}
                  className="boss-input text-xs font-bold bg-slate-100 dark:bg-slate-800 text-slate-700 dark:text-slate-200 cursor-not-allowed border-slate-300 dark:border-slate-700"
                />
              </div>

              {/* Today's 1-Hour Slot Timing Selector */}
              <div>
                <label className="boss-label text-xs flex items-center justify-between">
                  <span>1-Hour Slot Timing (Today)</span>
                  <span className="text-[10px] text-emerald-700 dark:text-emerald-400 font-bold">Expires sharply at slot end</span>
                </label>
                <select
                  className="boss-input text-xs font-semibold"
                  value={selectedSlotHour}
                  onChange={(e) => setSelectedSlotHour(Number(e.target.value))}
                >
                  {todaySlots.map((s) => (
                    <option key={s.hour} value={s.hour} disabled={s.isPassed}>
                      ⏰ {s.label}
                    </option>
                  ))}
                </select>
              </div>

              <div className="grid grid-cols-2 gap-2">
                <div>
                  <label className="boss-label text-xs">Charge Current (A)</label>
                  <select className="boss-input text-xs font-semibold" value={bookCurrent} onChange={(e) => setBookCurrent(e.target.value)}>
                    <option value="16">16A Standard</option>
                    <option value="32">32A Fast</option>
                    <option value="64">64A Supercharge</option>
                  </select>
                </div>
                <div>
                  <label className="boss-label text-xs">Battery Level (%)</label>
                  <input className="boss-input text-xs font-semibold" type="number" min="0" max="100" value={batteryPct} onChange={(e) => setBatteryPct(e.target.value)} />
                </div>
              </div>

              {/* UNEDITED CALCULATED MACHINE OUTPUT VOLTAGE DISPLAY (Powered by Trained ML Model) */}
              <div className="rounded-xl border border-emerald-300 dark:border-emerald-500/30 bg-emerald-50/80 dark:bg-emerald-950/40 p-3 space-y-1.5 shadow-sm">
                <div className="flex items-center justify-between text-xs font-bold text-emerald-900 dark:text-emerald-300">
                  <span className="flex items-center gap-1"><Cpu className="h-3.5 w-3.5 text-emerald-700 dark:text-emerald-400" /> ML Calculated Machine Voltage</span>
                  <span className="text-sm font-extrabold text-emerald-800 dark:text-emerald-400">{outputVoltageV} V DC</span>
                </div>
                <div className="flex items-center justify-between text-xs text-slate-700 dark:text-slate-300 font-semibold">
                  <span>Delivered Charging Rate</span>
                  <span className="font-bold text-emerald-800 dark:text-emerald-400">{outputPowerKw} kW</span>
                </div>
                <div className="pt-1 border-t border-emerald-200 dark:border-emerald-500/20 flex items-center justify-between text-[10px] text-slate-600 dark:text-slate-400 font-medium">
                  <span className="flex items-center gap-1"><Sparkles className="h-3 w-3 text-emerald-600 dark:text-emerald-400" /> ML Regressor Trained</span>
                  <span className="font-mono text-emerald-800 dark:text-emerald-400 font-bold">64,945 Dataset Records</span>
                </div>
              </div>

              <ShinyButton
                onClick={handleBook}
                disabled={!selectedStation || bookingLoading}
                className="w-full text-xs md:text-sm font-extrabold py-2.5 shadow-md bg-emerald-600 text-white border-emerald-500 rounded-xl hover:bg-emerald-700 block text-center cursor-pointer"
              >
                {bookingLoading ? 'Reserving...' : '⚡ Reserve 1-Hour Slot'}
              </ShinyButton>

              {/* Extra Feature: AI Camera Ticket Pass & Dashboard Scanner */}
              <button
                type="button"
                onClick={() => setShowSOCModal(true)}
                className="w-full py-2.5 px-3 rounded-xl bg-slate-900 dark:bg-slate-800 hover:bg-slate-800 text-emerald-400 border border-emerald-500/40 text-xs font-bold transition flex items-center justify-center gap-2 cursor-pointer shadow-sm"
              >
                <Camera className="w-4 h-4 text-emerald-400 animate-pulse" />
                <span>
                  {socVerificationResult?.status === 'verified'
                    ? `✓ AI Camera Ticket Verified (${socVerificationResult.extractedSOC}%) — Retake Scan`
                    : '📸 Open AI Camera Ticket & Dashboard Scanner'}
                </span>
              </button>
            </div>
          </div>

          {/* BOOKING CONFIRMATION & 6-DIGIT BOLD RED CODE DISPLAY WITH LIVE 5-MIN TIMER */}
          <AnimatePresence>
            {bookingResult && (
              <motion.div
                initial={{ opacity: 0, y: 10 }}
                animate={{ opacity: 1, y: 0 }}
                exit={{ opacity: 0, y: -10 }}
                className={`mt-6 rounded-2xl border p-5 ${bookingResult.success
                  ? 'border-emerald-300 bg-emerald-50/60 shadow-lg'
                  : 'border-red-300 bg-red-50/60'
                  }`}
              >
                <div className="flex items-start justify-between gap-3 border-b border-slate-200 pb-3">
                  <div className="flex items-center gap-3">
                    {bookingResult.success ? (
                      <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-emerald-600 text-white font-bold shadow-md">
                        <CheckCircle className="h-6 w-6" />
                      </div>
                    ) : (
                      <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-red-600 text-white font-bold shadow-md">
                        <AlertTriangle className="h-6 w-6" />
                      </div>
                    )}
                    <div>
                      <h3 className={`font-extrabold text-base ${bookingResult.success ? 'text-emerald-900' : 'text-red-700'}`}>
                        {bookingResult.success ? '1-Hour Slot Reserved' : 'Slot Reservation Error'}
                      </h3>
                      <p className="text-xs text-slate-600 font-medium">{bookingResult.message}</p>
                    </div>
                  </div>
                  <button onClick={() => setBookingResult(null)} className="text-slate-400 hover:text-slate-700 cursor-pointer">
                    <X className="h-5 w-5" />
                  </button>
                </div>

                {bookingResult.success && bookingResult.reservation && bookingResult.station && (
                  <div className="mt-4 space-y-4">
                    {/* Redirect Notice if EV 80% Rule triggered */}
                    {bookingResult.is_redirected && (
                      <div className="rounded-xl border border-amber-300 bg-amber-50 p-3 text-xs text-amber-900 flex items-start gap-2">
                        <AlertTriangle className="h-4 w-4 shrink-0 text-amber-600 mt-0.5" />
                        <div>
                          <p className="font-bold">EV 80% Load Rule Redirect Applied</p>
                          <p className="text-amber-800 mt-0.5">
                            Original station <b>{bookingResult.original_station_name}</b> exceeded 80% load capacity. Slot successfully allocated at <b>{bookingResult.station.name}</b> in <b>{bookingResult.district}</b>.
                          </p>
                        </div>
                      </div>
                    )}

                    {/* Slot Details Summary */}
                    <div className="grid grid-cols-1 gap-3 sm:grid-cols-3 text-xs">
                      <div className="rounded-xl bg-white p-3 border border-slate-200 shadow-sm">
                        <span className="text-slate-500 font-medium block">Station & District</span>
                        <span className="font-bold text-slate-900 text-sm">{bookingResult.station.name}</span>
                        <span className="text-slate-500 block mt-0.5">📍 {bookingResult.station.address}</span>
                      </div>
                      <div className="rounded-xl bg-white p-3 border border-slate-200 shadow-sm">
                        <span className="text-slate-500 font-medium block">Fixed 1-Hour Slot Window</span>
                        <span className="font-bold text-emerald-700 text-sm flex items-center gap-1">
                          <Clock className="h-4 w-4" /> {new Date(bookingResult.reservation.scheduled_time).toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' })} — {bookingResult.slot_end_time}
                        </span>
                      </div>
                      <div className="rounded-xl bg-white p-3 border border-slate-200 shadow-sm">
                        <span className="text-slate-500 font-medium block">Machine Voltage & Power</span>
                        <span className="font-bold text-slate-900 text-sm">{bookingResult.output_voltage_v} V DC ({bookingResult.output_power_kw} kW)</span>
                        <span className="text-emerald-700 block mt-0.5 font-bold">Smart Meter Ready</span>
                      </div>
                    </div>

                    {/* 6-DIGIT BOLD RED CODE & LIVE 1-HOUR SLOT COUNTDOWN TIMER */}
                    <div className="rounded-2xl border-2 border-red-500 bg-red-50 p-5 text-center shadow-md relative overflow-hidden">
                      <span className="text-xs uppercase font-extrabold text-red-700 tracking-wider block mb-1">Smart Energy Meter Verification Code</span>

                      {/* BOLD RED COLOR BIG SIZE FONT CODE */}
                      <span className="text-4xl md:text-5xl font-black font-mono tracking-[0.3em] text-red-600 block my-2 drop-shadow-sm">
                        {bookingResult.reservation.booking_code}
                      </span>

                      {/* Live 1-Hour Slot Expiry Countdown Timer */}
                      <SlotTimer
                        expiresAt={bookingResult.reservation.code_expires_at}
                        isRunning={isTimerRunning}
                        onExpire={() => {
                          setBookingResult((prev) => prev ? { ...prev, success: false, message: 'Code Expired! The slot timing window (1 hr) has ended. Please book a new slot.' } : null);
                        }}
                      />

                      {/* Extra Feature: Camera Ticket Verification Pass */}
                      <button
                        type="button"
                        onClick={() => setShowSOCModal(true)}
                        className="mt-3 w-full py-2.5 px-4 rounded-xl bg-slate-900 text-emerald-400 hover:bg-slate-800 border border-emerald-500/50 text-xs font-bold transition flex items-center justify-center gap-2 cursor-pointer shadow-md"
                      >
                        <Camera className="w-4 h-4 text-emerald-400 animate-pulse" />
                        <span>
                          {socVerificationResult?.status === 'verified'
                            ? `✓ AI Camera Ticket Verified (${socVerificationResult.extractedSOC}%) — Retake Camera Pass`
                            : `📸 Open Camera: Verify Ticket #${bookingResult.reservation.booking_code} & Battery SOC via AI`}
                        </span>
                      </button>

                      {/* CANCEL BOOKING CODE BUTTON */}
                      {bookingResult.reservation.status === 'confirmed' && (
                        <ShinyButton
                          onClick={() => handleCancelBooking(bookingResult.reservation!.id)}
                          disabled={cancellingResId === bookingResult.reservation.id}
                          className="mt-4 w-full rounded-xl border border-red-300 bg-red-600 text-white py-2 px-4 text-xs font-extrabold hover:bg-red-700 transition flex items-center justify-center gap-1.5 shadow-md disabled:opacity-50"
                        >
                          <span className="flex items-center justify-center gap-1.5"><X className="h-4 w-4" /> {cancellingResId === bookingResult.reservation.id ? 'Cancelling...' : 'Cancel Booking Code'}</span>
                        </ShinyButton>
                      )}
                    </div>

                    {/* BOOKING DETAILS & SPECIFICATIONS (Station, Port, Timing, Voltage/Current) */}
                    <div className="rounded-2xl border border-slate-200 bg-slate-50 p-4 space-y-3 text-left shadow-sm">
                      <div className="flex items-center justify-between border-b border-slate-200 pb-2">
                        <span className="text-xs font-extrabold uppercase tracking-wider text-slate-700 flex items-center gap-1.5">
                          <MapPin className="h-4 w-4 text-emerald-600" /> Reserved Booking Details
                        </span>
                        <span className="rounded-full bg-emerald-100 border border-emerald-300 px-2.5 py-0.5 text-[10px] font-bold text-emerald-800">
                          1-Hour Reserved Slot
                        </span>
                      </div>

                      <div className="grid grid-cols-1 md:grid-cols-2 gap-3 text-xs">
                        <div className="bg-white p-2.5 rounded-xl border border-slate-200 space-y-1">
                          <span className="text-slate-400 font-semibold block text-[11px]">Station Name & Address</span>
                          <span className="font-bold text-slate-900 block truncate">{bookingResult.station?.name || selectedStation?.name}</span>
                          <span className="text-slate-500 text-[11px] block truncate">{bookingResult.station?.address || selectedStation?.address}</span>
                        </div>

                        <div className="bg-white p-2.5 rounded-xl border border-slate-200 space-y-1">
                          <span className="text-slate-400 font-semibold block text-[11px]">Assigned Charger Port</span>
                          <span className="font-extrabold text-emerald-700 block text-sm flex items-center gap-1">
                            🔌 Port A (150 kW CCS Fast Charger)
                          </span>
                          <span className="text-slate-500 text-[11px] block">Connector Option: CCS (Combo 2)</span>
                        </div>

                        <div className="bg-white p-2.5 rounded-xl border border-slate-200 space-y-1">
                          <span className="text-slate-400 font-semibold block text-[11px]">Reserved Time Slot Window</span>
                          <span className="font-bold text-slate-900 block font-mono">
                            {new Date(bookingResult.reservation.scheduled_time).toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' })} to {bookingResult.slot_end_time || 'Next Hour'}
                          </span>
                          <span className="text-slate-500 text-[11px] block">Queue Position: #{bookingResult.reservation.queue_position || 1}</span>
                        </div>

                        <div className="bg-white p-2.5 rounded-xl border border-slate-200 space-y-1">
                          <span className="text-slate-400 font-semibold block text-[11px]">Charging Power & Current Specs</span>
                          <span className="font-bold text-slate-900 block font-mono">
                            {bookingResult.output_voltage_v || 400} V DC @ {bookCurrent || 32} A
                          </span>
                          <span className="text-emerald-600 text-[11px] font-bold block">Power Dispensing Output: {bookingResult.output_power_kw || 50} kW</span>
                        </div>
                      </div>
                    </div>
                  </div>
                )}
              </motion.div>
            )}
          </AnimatePresence>
        </div>

        {/* Reservation History */}
        <div className="boss-card">
          <div className="mb-3 flex items-center justify-between">
            <div className="flex items-center gap-2">
              <History className="h-5 w-5 text-emerald-600 dark:text-emerald-400" />
              <h2 className="font-bold text-slate-900 dark:text-white text-base">Charging Booking History</h2>
            </div>
            <ShinyButton
              onClick={() => setCurrentView('history')}
              className="bg-emerald-600 text-white shadow-md shadow-emerald-600/25 hover:shadow-lg hover:shadow-emerald-600/35 px-3 py-1 text-xs font-bold"
            >
              <div className="flex items-center gap-1.5">
                <Sparkles className="h-3.5 w-3.5 text-amber-300" />
                <span>MORE INFO</span>
              </div>
            </ShinyButton>
          </div>
          {reservations.length === 0 ? (
            <p className="text-sm text-slate-500 dark:text-slate-400 font-medium">No active or historical reservations yet.</p>
          ) : (
            <div className="overflow-x-auto">
              <table className="w-full text-sm">
                <thead>
                  <tr className="border-b border-slate-200 dark:border-slate-800 text-left text-xs font-bold text-slate-600 dark:text-slate-400 uppercase">
                    <th className="pb-2 pr-4">Station</th>
                    <th className="pb-2 pr-4">Time Window (1 Hr)</th>
                    <th className="pb-2 pr-4">Verification Code</th>
                    <th className="pb-2 pr-4">Status</th>
                  </tr>
                </thead>
                <tbody>
                  {reservations.map((r) => {
                    const st = stations.find((s) => s.id === r.station_id);
                    const startTime = new Date(r.scheduled_time);
                    const endTime = new Date(startTime.getTime() + 60 * 60 * 1000);
                    return (
                      <tr key={r.id} className="border-b border-slate-100 dark:border-slate-800 hover:bg-slate-50 dark:hover:bg-slate-900/60 transition">
                        <td className="py-2.5 pr-4 font-bold text-slate-900 dark:text-white">{st?.name ?? 'India EV Station'}</td>
                        <td className="py-2.5 pr-4 text-slate-700 dark:text-slate-300 font-medium text-xs">
                          {startTime.toLocaleDateString()} ({startTime.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' })} - {endTime.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' })})
                        </td>
                        <td className="py-2.5 pr-4 font-mono font-black text-red-600 dark:text-red-400 text-base">{r.booking_code ?? '—'}</td>
                        <td className="py-2.5 pr-4">
                          <div className="flex items-center gap-2">
                            <span className={`rounded-full px-2.5 py-0.5 text-xs font-extrabold capitalize ${r.status === 'confirmed' ? 'bg-emerald-500/15 text-emerald-800 dark:text-emerald-300 border border-emerald-500/30' :
                              r.status === 'completed' ? 'bg-blue-500/15 text-blue-800 dark:text-blue-300 border border-blue-500/30' :
                                r.status === 'cancelled' ? 'bg-slate-500/15 text-slate-700 dark:text-slate-300 border border-slate-500/30 font-bold' :
                                  r.status === 'rejected' ? 'bg-red-500/15 text-red-700 dark:text-red-300 border border-red-500/30 shadow-sm' :
                                    'bg-slate-100 dark:bg-slate-800 text-slate-700 dark:text-slate-300 border border-slate-300 dark:border-slate-700'
                              }`}>
                              {r.status}
                            </span>
                            {r.status === 'confirmed' && (
                              <ShinyButton
                                onClick={() => handleCancelBooking(r.id)}
                                disabled={cancellingResId === r.id}
                                className="rounded-lg border border-red-500/30 bg-red-500/15 px-2 py-0.5 text-[10px] font-bold text-red-700 dark:text-red-300 hover:bg-red-500/25 transition disabled:opacity-50"
                                title="Cancel this booking code"
                              >
                                {cancellingResId === r.id ? 'Cancelling...' : 'Cancel Code'}
                              </ShinyButton>
                            )}
                          </div>
                        </td>
                      </tr>
                    );
                  })}
                </tbody>
              </table>
            </div>
          )}
        </div>
      </main>

      {/* Pro Emergency Command Center Modal */}
      <EmergencyModal
        isOpen={showEmergency}
        onClose={() => setShowEmergency(false)}
        onDispatchMobileBattery={handleDispatchMobileBattery}
        onActivateEmergencyPriority={handleActivateEmergencyPriority}
        stations={stations}
        selectedStationId={selectedStationId}
        userLat={userLat}
        userLon={userLon}
        currentBatteryPct={parseFloat(batteryPct) || 8}
        isEmergencyActive={emergencyVehicle}
      />

      {/* Floating OpenRouter AI Copilot Chatbot */}
      <AICopilotChat
        selectedStationName={selectedStation?.name}
        stationLoadPct={selectedStation ? Math.round(getStationLoadPercent(selectedStation)) : undefined}
        availablePortsCount={getAvailableChargers(selectedChargers).length}
        userBatteryPct={parseInt(batteryPct) || 50}
        userState={selectedState}
        activeReservation={bookingResult?.reservation}
      />

      <SOCVerificationModal
        isOpen={showSOCModal}
        onClose={() => setShowSOCModal(false)}
        userId={profile?.id || 'ev_user_001'}
        claimedSOC={parseFloat(batteryPct) || 50}
        bookingCode={bookingResult?.reservation?.booking_code || undefined}
        stationName={bookingResult?.station?.name || selectedStation?.name}
        onVerificationComplete={(res) => {
          setSocVerificationResult(res);
          if (res.extractedSOC !== null) {
            setBatteryPct(String(res.extractedSOC));
          }
          if (bookingResult && bookingResult.success) {
            const verifiedSocVal = res.extractedSOC !== null ? res.extractedSOC : parseFloat(batteryPct) || 50;
            const verifiedVoltage = res.requiredVoltageV || Math.round(380 + (100 - verifiedSocVal) * 0.4);
            setBookingResult((prev) => prev ? {
              ...prev,
              output_voltage_v: verifiedVoltage,
              is_soc_verified: true,
              message: `✓ AI Camera Verified Telemetry! Extracted Battery: ${verifiedSocVal}%, Required Voltage: ${verifiedVoltage}V DC (Timestamp: ${res.captureTimestamp || 'Just Now'}).`,
            } : null);
          }
        }}
      />

      <VehicleDetailsModal
        isOpen={showVehicleModal}
        onClose={() => setShowVehicleModal(false)}
        profile={profile}
      />
    </BackgroundSystem>
  );
}


// Live 1-Hour Slot Expiry Countdown Component (Supports Timer Freeze)
function SlotTimer({ expiresAt, isRunning = true, onExpire }: { expiresAt?: string | null; isRunning?: boolean; onExpire: () => void }) {
  const [secondsLeft, setSecondsLeft] = useState<number>(() => {
    if (!expiresAt) return 3600;
    const diff = Math.floor((new Date(expiresAt).getTime() - Date.now()) / 1000);
    return diff > 0 ? diff : 0;
  });

  useEffect(() => {
    if (expiresAt) {
      const diff = Math.floor((new Date(expiresAt).getTime() - Date.now()) / 1000);
      setSecondsLeft(diff > 0 ? diff : 0);
    }
  }, [expiresAt]);

  useEffect(() => {
    if (!isRunning || secondsLeft <= 0) {
      if (secondsLeft <= 0) onExpire();
      return;
    }

    const interval = setInterval(() => {
      setSecondsLeft((prev) => {
        if (prev <= 1) {
          clearInterval(interval);
          onExpire();
          return 0;
        }
        return prev - 1;
      });
    }, 1000);

    return () => clearInterval(interval);
  }, [secondsLeft, isRunning, onExpire]);

  const hrs = Math.floor(secondsLeft / 3600);
  const mins = Math.floor((secondsLeft % 3600) / 60);
  const secs = secondsLeft % 60;

  const timeFormatted = hrs > 0
    ? `${String(hrs).padStart(2, '0')}:${String(mins).padStart(2, '0')}:${String(secs).padStart(2, '0')}`
    : `${String(mins).padStart(2, '0')}:${String(secs).padStart(2, '0')}`;

  const expiryTimeStr = expiresAt ? new Date(expiresAt).toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' }) : '';

  return (
    <div className="mt-2 flex flex-col items-center justify-center gap-1 text-xs font-bold">
      <div className="flex flex-wrap items-center justify-center gap-2">
        <span className="text-red-700">Slot Code Valid Until: <b>{expiryTimeStr || 'End of Slot'}</b></span>
        <span className={`font-mono text-base font-black px-2.5 py-0.5 rounded-lg border ${!isRunning ? 'bg-slate-200 text-slate-700 border-slate-300' : secondsLeft <= 300 ? 'bg-red-600 text-white animate-pulse border-red-700' : 'bg-red-100 text-red-800 border-red-300'}`}>
          ⏳ {isRunning ? timeFormatted : secondsLeft <= 0 ? '00:00 (EXPIRED)' : `${timeFormatted} (STOPPED)`}
        </span>
      </div>
      {secondsLeft <= 0 && <span className="text-red-600 font-extrabold block">EXPIRED — 1-Hour Slot Window Ended</span>}
    </div>
  );
}

// Backwards compatibility alias
const FiveMinuteTimer = SlotTimer;

