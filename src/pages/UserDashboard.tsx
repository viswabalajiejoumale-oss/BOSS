import { useState, useMemo, useCallback, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import {
  LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer,
  BarChart, Bar, Cell,
} from 'recharts';
import {
  Zap, Car, MapPin, History, Battery, Clock, DollarSign, Navigation,
  AlertTriangle, X, CheckCircle, Ticket, TrendingUp, Gauge, Sparkles,
} from 'lucide-react';
import { useAuth } from '@/context/AuthContext';
import { useStations, useReservations } from '@/hooks/useData';
import {
  recommendStations, predictWaitTimeMin, dynamicPricePerKwh,
  getStationLoadPercent, getAvailableChargers, generateBookingCode,
  getCodeExpiry, getRedirectWithIncentive, isEmergencyPriority,
} from '@/lib/aiEngine';
import { supabase } from '@/lib/supabase';
import { MapView } from '@/components/MapView';
import type { Recommendation, Reservation, Station, BookingResult } from '@/types';

const USER_LAT = 40.715;
const USER_LON = -74.008;

export function UserDashboard() {
  const { profile, signOut } = useAuth();
  const { stations, chargers, loading } = useStations();
  const { reservations, refetch: refetchRes } = useReservations(profile?.id);

  const [selectedStationId, setSelectedStationId] = useState<string | null>(null);
  const [bookTime, setBookTime] = useState('');
  const [bookCurrent, setBookCurrent] = useState('32');
  const [batteryPct, setBatteryPct] = useState('50');
  const [bookingResult, setBookingResult] = useState<BookingResult | null>(null);
  const [bookingLoading, setBookingLoading] = useState(false);
  const [showEmergency, setShowEmergency] = useState(false);
  const [emergencyVehicle, setEmergencyVehicle] = useState(false);

  const chargersByStation = useMemo(() => {
    const map = new Map<string, typeof chargers>();
    chargers.forEach((c) => {
      const arr = map.get(c.station_id) ?? [];
      arr.push(c);
      map.set(c.station_id, arr);
    });
    return map;
  }, [chargers]);

  const recommendations = useMemo(() => {
    if (stations.length === 0) return [];
    return recommendStations(
      stations,
      chargersByStation,
      USER_LAT,
      USER_LON,
      parseInt(batteryPct) || 50,
      emergencyVehicle
    );
  }, [stations, chargersByStation, batteryPct, emergencyVehicle]);

  const selectedStation = stations.find((s) => s.id === selectedStationId) ?? null;
  const selectedChargers = selectedStation ? (chargersByStation.get(selectedStation.id) ?? []) : [];
  const selectedRec = recommendations.find((r) => r.station.id === selectedStationId);

  const usageData = useMemo(() => {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days.map((d) => ({
      day: d,
      kwh: Math.round(Math.random() * 30 + 10),
      cost: Math.round(Math.random() * 8 + 3),
    }));
  }, []);

  const handleBook = useCallback(async () => {
    if (!selectedStation || !bookTime || !profile) return;
    setBookingLoading(true);
    setBookingResult(null);

    try {
      const battery = parseInt(batteryPct) || 50;
      const isEm = isEmergencyPriority(battery, emergencyVehicle);

      // Crowded check: if load >= 90% and no available chargers and not emergency
      const load = getStationLoadPercent(selectedStation);
      const available = getAvailableChargers(selectedChargers);

      if (load >= 90 && available.length === 0 && !isEm) {
        // Check for redirect
        const redirect = getRedirectWithIncentive(stations, chargersByStation, selectedStation.id);
        if (redirect.targetStation) {
          setBookingResult({
            success: false,
            message: `Sorry, booking full. ${redirect.reason}`,
          });
        } else {
          setBookingResult({
            success: false,
            message: 'Sorry, booking full. All chargers are occupied and the station is at capacity. Please try another station or time.',
          });
        }
        setBookingLoading(false);
        return;
      }

      // Pick a charger
      const charger = available[0] ?? selectedChargers[0];
      if (!charger) {
        setBookingResult({ success: false, message: 'No chargers available at this station.' });
        setBookingLoading(false);
        return;
      }

      const code = generateBookingCode();
      const expiresAt = getCodeExpiry();
      const price = dynamicPricePerKwh(selectedStation, selectedChargers);
      const scheduledTime = new Date(bookTime).toISOString();
      const queuePos = available.length > 0 ? 1 : selectedChargers.filter((c) => c.status === 'occupied').length + 1;

      const insert = {
        user_id: profile.id,
        station_id: selectedStation.id,
        charger_id: charger.id,
        scheduled_time: scheduledTime,
        charge_current_a: parseFloat(bookCurrent) || 32,
        battery_percent: battery,
        status: 'confirmed',
        queue_position: queuePos,
        booking_code: code,
        code_expires_at: expiresAt,
        is_emergency: isEm,
        price: price * (battery > 0 ? Math.min(75 - battery, 50) : 30),
      };

      const { data, error } = await supabase.from('reservations').insert(insert).select().single();

      if (error) {
        setBookingResult({ success: false, message: `Booking failed: ${error.message}` });
      } else {
        const qrData = `BOSS|${code}|${selectedStation.name}|${scheduledTime}|${charger.label}`;
        setBookingResult({
          success: true,
          message: 'Booking confirmed!',
          reservation: data as Reservation,
          station: selectedStation,
          qrData,
        });
        refetchRes();
      }
    } catch {
      setBookingResult({ success: false, message: 'An unexpected error occurred during booking.' });
    } finally {
      setBookingLoading(false);
    }
  }, [selectedStation, selectedChargers, bookTime, bookCurrent, batteryPct, emergencyVehicle, profile, stations, chargersByStation, refetchRes]);

  const handleEmergency = useCallback(async () => {
    setEmergencyVehicle(true);
    setBatteryPct('8');
    setShowEmergency(false);
    // Auto-select the nearest available station
    if (recommendations.length > 0) {
      setSelectedStationId(recommendations[0].station.id);
    }
  }, [recommendations]);

  return (
    <div className="min-h-screen bg-[var(--boss-bg)] text-white">
      {/* Header */}
      <header className="sticky top-0 z-20 border-b border-[var(--boss-border)] bg-[var(--boss-bg)]/90 backdrop-blur">
        <div className="mx-auto flex max-w-7xl items-center justify-between px-4 py-4 md:px-6">
          <div className="flex items-center gap-3">
            <div className="flex h-9 w-9 items-center justify-center rounded-xl bg-[var(--boss-green)] text-black">
              <Zap className="h-5 w-5" />
            </div>
            <div>
              <h1 className="text-lg font-bold">Welcome, {profile?.name ?? 'User'}</h1>
              <p className="text-xs text-gray-500">EV Owner Dashboard</p>
            </div>
          </div>
          <div className="flex items-center gap-3">
            <button onClick={() => setShowEmergency(true)} className="boss-btn-danger text-sm">
              <AlertTriangle className="h-4 w-4" /> Emergency
            </button>
            <button onClick={signOut} className="boss-btn-ghost text-sm">Sign Out</button>
          </div>
        </div>
      </header>

      <main className="mx-auto max-w-7xl space-y-6 px-4 py-6 md:px-6">
        {/* Top row: Vehicle + Usage + Battery */}
        <div className="grid grid-cols-1 gap-4 md:grid-cols-3">
          {/* Vehicle details */}
          <div className="boss-card">
            <div className="mb-3 flex items-center gap-2">
              <Car className="h-5 w-5 text-[var(--boss-green-bright)]" />
              <h2 className="font-semibold">Vehicle Details</h2>
            </div>
            <dl className="space-y-2 text-sm">
              <div className="flex justify-between"><dt className="text-gray-400">Make</dt><dd>{profile?.vehicle_make ?? '—'}</dd></div>
              <div className="flex justify-between"><dt className="text-gray-400">Model</dt><dd>{profile?.vehicle_model ?? '—'}</dd></div>
              <div className="flex justify-between"><dt className="text-gray-400">Year</dt><dd>{profile?.vehicle_year ?? '—'}</dd></div>
              <div className="flex justify-between"><dt className="text-gray-400">Battery</dt><dd>{profile?.battery_capacity_kwh ? `${profile.battery_capacity_kwh} kWh` : '—'}</dd></div>
            </dl>
          </div>

          {/* Usage graph */}
          <div className="boss-card md:col-span-2">
            <div className="mb-3 flex items-center gap-2">
              <TrendingUp className="h-5 w-5 text-[var(--boss-green-bright)]" />
              <h2 className="font-semibold">Weekly Usage</h2>
            </div>
            <ResponsiveContainer width="100%" height={180}>
              <LineChart data={usageData}>
                <CartesianGrid strokeDasharray="3 3" stroke="#1a2a1a" />
                <XAxis dataKey="day" stroke="#666" fontSize={12} />
                <YAxis stroke="#666" fontSize={12} />
                <Tooltip contentStyle={{ background: '#111a11', border: '1px solid #1a2a1a', borderRadius: 8 }} />
                <Line type="monotone" dataKey="kwh" stroke="#22c55e" strokeWidth={2} dot={{ fill: '#22c55e' }} />
                <Line type="monotone" dataKey="cost" stroke="#4ade80" strokeWidth={2} strokeDasharray="5 5" dot={{ fill: '#4ade80' }} />
              </LineChart>
            </ResponsiveContainer>
          </div>
        </div>

        {/* Map + Nearby stations */}
        <div className="grid grid-cols-1 gap-4 lg:grid-cols-2">
          <div className="boss-card">
            <div className="mb-3 flex items-center gap-2">
              <MapPin className="h-5 w-5 text-[var(--boss-green-bright)]" />
              <h2 className="font-semibold">Charging Stations Nearby</h2>
            </div>
            <MapView stations={stations} userLat={USER_LAT} userLon={USER_LON} selectedId={selectedStationId ?? undefined} onSelect={setSelectedStationId} height="280px" />
          </div>

          {/* AI Recommendations */}
          <div className="boss-card">
            <div className="mb-3 flex items-center gap-2">
              <Sparkles className="h-5 w-5 text-[var(--boss-green-bright)]" />
              <h2 className="font-semibold">AI Recommended Stations</h2>
            </div>
            {loading ? (
              <p className="text-sm text-gray-500">Loading recommendations...</p>
            ) : (
              <div className="space-y-3 max-h-[280px] overflow-y-auto pr-1">
                {recommendations.slice(0, 5).map((rec) => (
                  <button
                    key={rec.station.id}
                    onClick={() => setSelectedStationId(rec.station.id)}
                    className={`w-full rounded-xl border p-3 text-left transition ${selectedStationId === rec.station.id ? 'border-[var(--boss-green)] bg-[var(--boss-green)]/10' : 'border-[var(--boss-border)] hover:border-[var(--boss-green-dim)]'}`}
                  >
                    <div className="flex items-center justify-between">
                      <span className="font-medium">{rec.station.name}</span>
                      <span className="rounded-full bg-[var(--boss-green)]/20 px-2 py-0.5 text-xs font-bold text-[var(--boss-green-bright)]">
                        Score: {rec.score}
                      </span>
                    </div>
                    <div className="mt-1 flex flex-wrap gap-3 text-xs text-gray-400">
                      <span>{rec.distanceKm} km</span>
                      <span>{rec.availableChargers} available</span>
                      <span>Wait: {rec.waitTimeMin}m</span>
                      <span className="text-[var(--boss-green-bright)]">${rec.pricePerKwh}/kWh</span>
                      <span className={rec.loadPercent >= 90 ? 'text-red-400' : ''}>Load: {rec.loadPercent}%</span>
                    </div>
                  </button>
                ))}
              </div>
            )}
          </div>
        </div>

        {/* Book Slot area - main feature */}
        <div className="boss-card border-[var(--boss-green)]/30 ring-1 ring-[var(--boss-green)]/20">
          <div className="mb-4 flex items-center gap-2">
            <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-[var(--boss-green)] text-black">
              <Zap className="h-5 w-5" />
            </div>
            <h2 className="text-lg font-bold">Book Slot</h2>
            {emergencyVehicle && (
              <span className="ml-2 rounded-full bg-red-600/20 px-3 py-0.5 text-xs font-semibold text-red-400">
                Emergency Priority Active
              </span>
            )}
          </div>

          <div className="grid grid-cols-1 gap-4 lg:grid-cols-3">
            {/* Left: Locations nearby */}
            <div className="space-y-2">
              <h3 className="text-sm font-semibold text-gray-400">Locations Nearby</h3>
              <div className="space-y-2 max-h-[320px] overflow-y-auto pr-1">
                {recommendations.map((rec) => (
                  <button
                    key={rec.station.id}
                    onClick={() => setSelectedStationId(rec.station.id)}
                    className={`w-full rounded-lg border p-2.5 text-left text-sm transition ${selectedStationId === rec.station.id ? 'border-[var(--boss-green)] bg-[var(--boss-green)]/10' : 'border-[var(--boss-border)] hover:border-[var(--boss-green-dim)]'}`}
                  >
                    <div className="font-medium">{rec.station.name}</div>
                    <div className="text-xs text-gray-500">{rec.distanceKm} km • {rec.availableChargers} available</div>
                  </button>
                ))}
              </div>
            </div>

            {/* Middle: Queue status */}
            <div className="space-y-3">
              <h3 className="text-sm font-semibold text-gray-400">Queue Status</h3>
              {selectedStation ? (
                <div className="space-y-3">
                  <div className="rounded-xl border border-[var(--boss-border)] bg-black/30 p-4">
                    <div className="mb-2 flex items-center justify-between">
                      <span className="text-sm text-gray-400">Transformer Load</span>
                      <span className={`font-bold ${getStationLoadPercent(selectedStation) >= 90 ? 'text-red-400' : 'text-[var(--boss-green-bright)]'}`}>
                        {getStationLoadPercent(selectedStation).toFixed(0)}%
                      </span>
                    </div>
                    <div className="h-2 overflow-hidden rounded-full bg-gray-800">
                      <div
                        className={`h-full rounded-full transition-all ${getStationLoadPercent(selectedStation) >= 90 ? 'bg-red-500' : 'bg-[var(--boss-green)]'}`}
                        style={{ width: `${Math.min(getStationLoadPercent(selectedStation), 100)}%` }}
                      />
                    </div>
                  </div>
                  <div className="grid grid-cols-3 gap-2 text-center">
                    <div className="rounded-lg bg-black/30 p-2">
                      <div className="text-lg font-bold text-[var(--boss-green-bright)]">{getAvailableChargers(selectedChargers).length}</div>
                      <div className="text-xs text-gray-500">Available</div>
                    </div>
                    <div className="rounded-lg bg-black/30 p-2">
                      <div className="text-lg font-bold text-yellow-400">{selectedChargers.filter((c) => c.status === 'occupied').length}</div>
                      <div className="text-xs text-gray-500">Occupied</div>
                    </div>
                    <div className="rounded-lg bg-black/30 p-2">
                      <div className="text-lg font-bold text-red-400">{selectedChargers.filter((c) => c.status === 'fault').length}</div>
                      <div className="text-xs text-gray-500">Fault</div>
                    </div>
                  </div>
                  <div className="rounded-lg bg-black/30 p-3 text-sm">
                    <div className="flex items-center gap-2 text-gray-400">
                      <Clock className="h-4 w-4" /> Est. Wait: <span className="font-bold text-white">{predictWaitTimeMin(selectedChargers, parseInt(batteryPct) || 50)} min</span>
                    </div>
                  </div>
                  {selectedRec && (
                    <div className="rounded-lg border border-[var(--boss-border)] bg-black/20 p-3">
                      <p className="mb-1 text-xs font-semibold text-[var(--boss-green-bright)]">Why this station?</p>
                      <ul className="space-y-0.5 text-xs text-gray-400">
                        {selectedRec.explanation.map((e, i) => (
                          <li key={i}>• {e}</li>
                        ))}
                      </ul>
                    </div>
                  )}
                </div>
              ) : (
                <div className="flex h-full min-h-[200px] items-center justify-center rounded-xl border border-dashed border-[var(--boss-border)] text-sm text-gray-500">
                  Select a station to see queue status
                </div>
              )}
            </div>

            {/* Right: Booking inputs */}
            <div className="space-y-3">
              <h3 className="text-sm font-semibold text-gray-400">Booking Details</h3>
              <div>
                <label className="boss-label">Station</label>
                <select className="boss-input" value={selectedStationId ?? ''} onChange={(e) => setSelectedStationId(e.target.value || null)}>
                  <option value="">Select station...</option>
                  {stations.map((s) => <option key={s.id} value={s.id}>{s.name}</option>)}
                </select>
              </div>
              <div>
                <label className="boss-label">Time</label>
                <input className="boss-input" type="datetime-local" value={bookTime} onChange={(e) => setBookTime(e.target.value)} />
              </div>
              <div className="grid grid-cols-2 gap-3">
                <div>
                  <label className="boss-label">Charge Current (A)</label>
                  <select className="boss-input" value={bookCurrent} onChange={(e) => setBookCurrent(e.target.value)}>
                    <option value="16">16A</option>
                    <option value="32">32A</option>
                    <option value="64">64A</option>
                  </select>
                </div>
                <div>
                  <label className="boss-label">Battery %</label>
                  <input className="boss-input" type="number" min="0" max="100" value={batteryPct} onChange={(e) => setBatteryPct(e.target.value)} />
                </div>
              </div>
              {selectedStation && (
                <div className="flex items-center justify-between rounded-lg bg-black/30 px-3 py-2 text-sm">
                  <span className="flex items-center gap-1 text-gray-400"><DollarSign className="h-4 w-4" /> Est. Price</span>
                  <span className="font-bold text-[var(--boss-green-bright)]">
                    ${((dynamicPricePerKwh(selectedStation, selectedChargers)) * Math.min(75 - (parseInt(batteryPct) || 50), 50)).toFixed(2)}
                  </span>
                </div>
              )}
              <button
                onClick={handleBook}
                disabled={!selectedStation || !bookTime || bookingLoading}
                className="boss-btn-primary w-full"
              >
                {bookingLoading ? 'Booking...' : 'Book'}
              </button>
            </div>
          </div>

          {/* Booking result */}
          <AnimatePresence>
            {bookingResult && (
              <motion.div
                initial={{ opacity: 0, y: 10 }}
                animate={{ opacity: 1, y: 0 }}
                exit={{ opacity: 0, y: -10 }}
                className={`mt-4 rounded-xl border p-4 ${bookingResult.success ? 'border-[var(--boss-green)]/40 bg-[var(--boss-green)]/10' : 'border-red-500/40 bg-red-500/10'}`}
              >
                <div className="flex items-start gap-3">
                  {bookingResult.success ? (
                    <CheckCircle className="h-5 w-5 shrink-0 text-[var(--boss-green-bright)]" />
                  ) : (
                    <AlertTriangle className="h-5 w-5 shrink-0 text-red-400" />
                  )}
                  <div className="flex-1">
                    <p className={`font-semibold ${bookingResult.success ? 'text-[var(--boss-green-bright)]' : 'text-red-400'}`}>
                      {bookingResult.success ? 'Booking Confirmed!' : 'Sorry, booking full'}
                    </p>
                    <p className="text-sm text-gray-400">{bookingResult.message}</p>
                    {bookingResult.success && bookingResult.reservation && bookingResult.station && (
                      <div className="mt-3 space-y-1 text-sm">
                        <div className="flex gap-2"><span className="text-gray-500">Station:</span> <span>{bookingResult.station.name}</span></div>
                        <div className="flex gap-2"><span className="text-gray-500">Time:</span> <span>{new Date(bookingResult.reservation.scheduled_time).toLocaleString()}</span></div>
                        <div className="flex gap-2 items-center">
                          <span className="text-gray-500">Code:</span>
                          <span className="rounded-lg bg-[var(--boss-green)] px-3 py-1 font-mono font-bold text-black">{bookingResult.reservation.booking_code}</span>
                          <span className="text-xs text-gray-500">(valid 5 min)</span>
                        </div>
                        {bookingResult.qrData && (
                          <div className="mt-3 flex items-center gap-3 rounded-lg bg-black/30 p-3">
                            <QRCodeDisplay data={bookingResult.qrData} />
                            <div className="text-xs text-gray-400">
                              <p>Scan this QR code at the charger to start your session.</p>
                              <p className="mt-1 text-gray-500">Code expires at {new Date(bookingResult.reservation.code_expires_at!).toLocaleTimeString()}</p>
                            </div>
                          </div>
                        )}
                      </div>
                    )}
                  </div>
                  <button onClick={() => setBookingResult(null)} className="text-gray-500 hover:text-white">
                    <X className="h-4 w-4" />
                  </button>
                </div>
              </motion.div>
            )}
          </AnimatePresence>
        </div>

        {/* Reservation history */}
        <div className="boss-card">
          <div className="mb-3 flex items-center gap-2">
            <History className="h-5 w-5 text-[var(--boss-green-bright)]" />
            <h2 className="font-semibold">Reserved History</h2>
          </div>
          {reservations.length === 0 ? (
            <p className="text-sm text-gray-500">No reservations yet. Book a slot above!</p>
          ) : (
            <div className="overflow-x-auto">
              <table className="w-full text-sm">
                <thead>
                  <tr className="border-b border-[var(--boss-border)] text-left text-xs text-gray-500">
                    <th className="pb-2 pr-4">Station</th>
                    <th className="pb-2 pr-4">Time</th>
                    <th className="pb-2 pr-4">Code</th>
                    <th className="pb-2 pr-4">Status</th>
                    <th className="pb-2 pr-4">Price</th>
                  </tr>
                </thead>
                <tbody>
                  {reservations.map((r) => {
                    const st = stations.find((s) => s.id === r.station_id);
                    return (
                      <tr key={r.id} className="border-b border-[var(--boss-border)]/50">
                        <td className="py-2 pr-4">{st?.name ?? '—'}</td>
                        <td className="py-2 pr-4">{new Date(r.scheduled_time).toLocaleDateString()}</td>
                        <td className="py-2 pr-4 font-mono">{r.booking_code ?? '—'}</td>
                        <td className="py-2 pr-4">
                          <span className={`rounded-full px-2 py-0.5 text-xs ${
                            r.status === 'confirmed' ? 'bg-[var(--boss-green)]/20 text-[var(--boss-green-bright)]' :
                            r.status === 'completed' ? 'bg-blue-500/20 text-blue-400' :
                            'bg-gray-700 text-gray-400'
                          }`}>
                            {r.status}
                          </span>
                        </td>
                        <td className="py-2 pr-4">${r.price?.toFixed(2) ?? '—'}</td>
                      </tr>
                    );
                  })}
                </tbody>
              </table>
            </div>
          )}
        </div>
      </main>

      {/* Emergency modal */}
      <AnimatePresence>
        {showEmergency && (
          <motion.div
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            className="fixed inset-0 z-50 flex items-center justify-center bg-black/60 p-4"
            onClick={() => setShowEmergency(false)}
          >
            <motion.div
              initial={{ scale: 0.9 }}
              animate={{ scale: 1 }}
              exit={{ scale: 0.9 }}
              className="boss-card max-w-sm border-red-500/40"
              onClick={(e) => e.stopPropagation()}
            >
              <div className="mb-3 flex items-center gap-2">
                <AlertTriangle className="h-6 w-6 text-red-500" />
                <h2 className="text-lg font-bold text-red-400">Emergency Charging</h2>
              </div>
              <p className="mb-4 text-sm text-gray-400">
                Activate emergency priority for immediate allocation. This is for emergency vehicles (Ambulance, Police, Fire) or when your battery is below 10%.
              </p>
              <div className="space-y-3">
                <label className="flex items-center gap-2 text-sm">
                  <input type="checkbox" checked={emergencyVehicle} onChange={(e) => setEmergencyVehicle(e.target.checked)} className="h-4 w-4 accent-[var(--boss-green)]" />
                  Emergency vehicle (Ambulance / Police / Fire)
                </label>
                <div>
                  <label className="boss-label">Battery Level (%)</label>
                  <input className="boss-input" type="number" min="0" max="100" value={batteryPct} onChange={(e) => setBatteryPct(e.target.value)} />
                </div>
              </div>
              <div className="mt-4 flex gap-2">
                <button onClick={handleEmergency} className="boss-btn-danger flex-1">Activate Priority</button>
                <button onClick={() => setShowEmergency(false)} className="boss-btn-ghost">Cancel</button>
              </div>
            </motion.div>
          </motion.div>
        )}
      </AnimatePresence>
    </div>
  );
}

// QR code component using inline SVG generation
function QRCodeDisplay({ data }: { data: string }) {
  const [qrUrl, setQrUrl] = useState<string>('');

  useEffect(() => {
    import('qrcode').then((QRCode) => {
      QRCode.toDataURL(data, { margin: 1, width: 120, color: { dark: '#0a0f0a', light: '#22c55e' } })
        .then(setQrUrl)
        .catch(() => setQrUrl(''));
    });
  }, [data]);

  return qrUrl ? <img src={qrUrl} alt="Booking QR" className="h-24 w-24 rounded-lg" /> : <div className="h-24 w-24 animate-pulse rounded-lg bg-gray-800" />;
}
