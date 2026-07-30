import { useMemo, useState } from 'react';
import {
  LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer,
  PieChart, Pie, Cell, AreaChart, Area,
} from 'recharts';
import {
  Zap, Bell, Gauge, BarChart3, Users, AlertTriangle, CheckCircle,
  TrendingUp, Activity, Power, X,
} from 'lucide-react';
import { useAuth } from '@/context/AuthContext';
import { useAdminStations, useNotifications } from '@/hooks/useData';
import { getStationLoadPercent, getAvailableChargers } from '@/lib/aiEngine';
import { supabase } from '@/lib/supabase';
import type { Charger } from '@/types';

export function AdminDashboard() {
  const { profile, signOut } = useAuth();
  const { stations, chargers, loading, refetch } = useAdminStations(profile?.id);
  const { notifications, markRead } = useNotifications(profile?.id);
  const [showNotifPanel, setShowNotifPanel] = useState(false);

  const station = stations[0] ?? null;
  const stationChargers = useMemo(() => chargers.filter((c) => station && c.station_id === station.id), [chargers, station]);

  const loadPercent = station ? getStationLoadPercent(station) : 0;
  const availableCount = getAvailableChargers(stationChargers).length;
  const occupiedCount = stationChargers.filter((c) => c.status === 'occupied').length;
  const faultCount = stationChargers.filter((c) => c.status === 'fault').length;

  const analyticsData = useMemo(() => {
    const hours = Array.from({ length: 24 }, (_, h) => ({
      hour: `${h}:00`,
      load: Math.round((Math.sin(h / 3) * 0.3 + 0.5) * (station?.transformer_load_capacity_kva ?? 500)),
      sessions: Math.round(Math.sin(h / 3) * 3 + 5),
    }));
    return hours;
  }, [station]);

  const pieData = [
    { name: 'Available', value: availableCount, color: '#22c55e' },
    { name: 'Occupied', value: occupiedCount, color: '#eab308' },
    { name: 'Fault', value: faultCount, color: '#ef4444' },
  ];

  const weeklyData = useMemo(() => {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days.map((d) => ({
      day: d,
      sessions: Math.round(Math.random() * 20 + 10),
      revenue: Math.round(Math.random() * 200 + 100),
    }));
  }, []);

  async function toggleCharger(charger: Charger) {
    const newStatus = charger.status === 'available' ? 'occupied' : 'available';
    await supabase.from('chargers').update({
      status: newStatus,
      current_load_kw: newStatus === 'occupied' ? charger.power_kw * 0.9 : 0,
    }).eq('id', charger.id);
    refetch();
  }

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-[var(--boss-bg)]">
        <Zap className="h-8 w-8 animate-pulse text-[var(--boss-green)]" />
      </div>
    );
  }

  if (!station) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-[var(--boss-bg)] text-gray-400">
        <div className="text-center">
          <p>No station found for this admin.</p>
          <button onClick={signOut} className="mt-4 boss-btn-ghost">Sign Out</button>
        </div>
      </div>
    );
  }

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
              <h1 className="text-lg font-bold">Welcome, Admin</h1>
              <p className="text-xs text-gray-500">{station.name}</p>
            </div>
          </div>
          <div className="flex items-center gap-3">
            <button onClick={() => setShowNotifPanel(true)} className="relative boss-btn-ghost text-sm">
              <Bell className="h-4 w-4" />
              {notifications.filter((n) => !n.is_read).length > 0 && (
                <span className="absolute -right-1 -top-1 flex h-4 w-4 items-center justify-center rounded-full bg-red-500 text-[10px] font-bold text-white">
                  {notifications.filter((n) => !n.is_read).length}
                </span>
              )}
            </button>
            <button onClick={signOut} className="boss-btn-ghost text-sm">Sign Out</button>
          </div>
        </div>
      </header>

      <main className="mx-auto max-w-7xl space-y-6 px-4 py-6 md:px-6">
        {/* Top row: Reports + Transformer + Charger status */}
        <div className="grid grid-cols-1 gap-4 md:grid-cols-3">
          {/* Current reports */}
          <div className="boss-card">
            <div className="mb-3 flex items-center gap-2">
              <BarChart3 className="h-5 w-5 text-[var(--boss-green-bright)]" />
              <h2 className="font-semibold">Current Reports</h2>
            </div>
            <div className="space-y-2 text-sm">
              <div className="flex justify-between"><span className="text-gray-400">Total Chargers</span><span className="font-bold">{stationChargers.length}</span></div>
              <div className="flex justify-between"><span className="text-gray-400">Available</span><span className="font-bold text-[var(--boss-green-bright)]">{availableCount}</span></div>
              <div className="flex justify-between"><span className="text-gray-400">Occupied</span><span className="font-bold text-yellow-400">{occupiedCount}</span></div>
              <div className="flex justify-between"><span className="text-gray-400">Faulty</span><span className="font-bold text-red-400">{faultCount}</span></div>
              <div className="flex justify-between"><span className="text-gray-400">Active Sessions</span><span className="font-bold">{occupiedCount}</span></div>
            </div>
          </div>

          {/* Transformer capacity */}
          <div className="boss-card md:col-span-2">
            <div className="mb-3 flex items-center gap-2">
              <Gauge className="h-5 w-5 text-[var(--boss-green-bright)]" />
              <h2 className="font-semibold">Transformer Capacity</h2>
            </div>
            <div className="mb-3 flex items-end justify-between">
              <div>
                <span className="text-3xl font-bold">{loadPercent.toFixed(0)}%</span>
                <span className="ml-2 text-sm text-gray-400">utilization</span>
              </div>
              <div className="text-right text-sm">
                <div className="text-gray-400">{station.current_load_kva.toFixed(0)} / {station.transformer_load_capacity_kva} kVA</div>
                {loadPercent >= 90 && <span className="text-red-400">OVERLOAD RISK</span>}
              </div>
            </div>
            <div className="h-4 overflow-hidden rounded-full bg-gray-800">
              <div
                className={`h-full rounded-full transition-all ${loadPercent >= 90 ? 'bg-red-500' : loadPercent >= 70 ? 'bg-yellow-500' : 'bg-[var(--boss-green)]'}`}
                style={{ width: `${Math.min(loadPercent, 100)}%` }}
              />
            </div>
            <p className="mt-2 text-xs text-gray-500">
              {loadPercent >= 90
                ? 'Critical: New users will be redirected to nearby stations to prevent grid failure.'
                : loadPercent >= 70
                ? 'Warning: Approaching capacity. Monitor closely.'
                : 'Normal: Transformer operating within safe limits.'}
            </p>
          </div>
        </div>

        {/* Charger ports - per port capacity */}
        <div className="boss-card">
          <div className="mb-4 flex items-center gap-2">
            <Power className="h-5 w-5 text-[var(--boss-green-bright)]" />
            <h2 className="font-semibold">Charger Ports — Per Port Load</h2>
          </div>
          <div className="grid grid-cols-2 gap-3 sm:grid-cols-3 lg:grid-cols-6">
            {stationChargers.map((c) => {
              const portLoad = c.power_kw > 0 ? (c.current_load_kw / c.power_kw) * 100 : 0;
              return (
                <div
                  key={c.id}
                  className={`rounded-xl border p-3 text-center ${
                    c.status === 'available' ? 'border-[var(--boss-green)]/30 bg-[var(--boss-green)]/5' :
                    c.status === 'occupied' ? 'border-yellow-500/30 bg-yellow-500/5' :
                    'border-red-500/30 bg-red-500/5'
                  }`}
                >
                  <div className="text-sm font-bold">{c.label}</div>
                  <div className="text-xs text-gray-500">{c.power_kw} kW</div>
                  <div className="mt-2 h-1.5 overflow-hidden rounded-full bg-gray-800">
                    <div
                      className={`h-full rounded-full ${c.status === 'available' ? 'bg-[var(--boss-green)]' : c.status === 'occupied' ? 'bg-yellow-500' : 'bg-red-500'}`}
                      style={{ width: `${portLoad}%` }}
                    />
                  </div>
                  <div className="mt-1.5">
                    <span className={`text-xs font-semibold ${
                      c.status === 'available' ? 'text-[var(--boss-green-bright)]' :
                      c.status === 'occupied' ? 'text-yellow-400' : 'text-red-400'
                    }`}>
                      {c.status}
                    </span>
                  </div>
                  <button
                    onClick={() => toggleCharger(c)}
                    className="mt-2 rounded-lg border border-[var(--boss-border)] px-2 py-1 text-xs text-gray-400 hover:border-[var(--boss-green)] hover:text-[var(--boss-green-bright)]"
                  >
                    Toggle
                  </button>
                </div>
              );
            })}
          </div>
        </div>

        {/* Analytics row */}
        <div className="grid grid-cols-1 gap-4 lg:grid-cols-3">
          {/* 24h load */}
          <div className="boss-card lg:col-span-2">
            <div className="mb-3 flex items-center gap-2">
              <Activity className="h-5 w-5 text-[var(--boss-green-bright)]" />
              <h2 className="font-semibold">24-Hour Load Forecast</h2>
            </div>
            <ResponsiveContainer width="100%" height={200}>
              <AreaChart data={analyticsData}>
                <CartesianGrid strokeDasharray="3 3" stroke="#1a2a1a" />
                <XAxis dataKey="hour" stroke="#666" fontSize={10} interval={3} />
                <YAxis stroke="#666" fontSize={12} />
                <Tooltip contentStyle={{ background: '#111a11', border: '1px solid #1a2a1a', borderRadius: 8 }} />
                <Area type="monotone" dataKey="load" stroke="#22c55e" fill="#22c55e33" strokeWidth={2} />
              </AreaChart>
            </ResponsiveContainer>
          </div>

          {/* Charger distribution */}
          <div className="boss-card">
            <div className="mb-3 flex items-center gap-2">
              <TrendingUp className="h-5 w-5 text-[var(--boss-green-bright)]" />
              <h2 className="font-semibold">Charger Distribution</h2>
            </div>
            <ResponsiveContainer width="100%" height={200}>
              <PieChart>
                <Pie data={pieData} dataKey="value" nameKey="name" cx="50%" cy="50%" outerRadius={70} innerRadius={40}>
                  {pieData.map((entry, i) => <Cell key={i} fill={entry.color} />)}
                </Pie>
                <Tooltip contentStyle={{ background: '#111a11', border: '1px solid #1a2a1a', borderRadius: 8 }} />
              </PieChart>
            </ResponsiveContainer>
            <div className="mt-2 flex justify-center gap-4 text-xs">
              {pieData.map((p) => (
                <span key={p.name} className="flex items-center gap-1">
                  <span className="h-2 w-2 rounded-full" style={{ background: p.color }} /> {p.name}: {p.value}
                </span>
              ))}
            </div>
          </div>
        </div>

        {/* Weekly revenue */}
        <div className="boss-card">
          <div className="mb-3 flex items-center gap-2">
            <BarChart3 className="h-5 w-5 text-[var(--boss-green-bright)]" />
            <h2 className="font-semibold">Weekly Sessions & Revenue</h2>
          </div>
          <ResponsiveContainer width="100%" height={200}>
            <LineChart data={weeklyData}>
              <CartesianGrid strokeDasharray="3 3" stroke="#1a2a1a" />
              <XAxis dataKey="day" stroke="#666" fontSize={12} />
              <YAxis yAxisId="left" stroke="#666" fontSize={12} />
              <YAxis yAxisId="right" orientation="right" stroke="#666" fontSize={12} />
              <Tooltip contentStyle={{ background: '#111a11', border: '1px solid #1a2a1a', borderRadius: 8 }} />
              <Line yAxisId="left" type="monotone" dataKey="sessions" stroke="#22c55e" strokeWidth={2} dot={{ fill: '#22c55e' }} />
              <Line yAxisId="right" type="monotone" dataKey="revenue" stroke="#4ade80" strokeWidth={2} strokeDasharray="5 5" dot={{ fill: '#4ade80' }} />
            </LineChart>
          </ResponsiveContainer>
        </div>
      </main>

      {/* Notifications panel - main feature */}
      {showNotifPanel && (
        <div className="fixed inset-0 z-50 flex justify-end bg-black/60" onClick={() => setShowNotifPanel(false)}>
          <div className="h-full w-full max-w-sm overflow-y-auto border-l border-[var(--boss-border)] bg-[var(--boss-surface)] p-4" onClick={(e) => e.stopPropagation()}>
            <div className="mb-4 flex items-center justify-between">
              <div className="flex items-center gap-2">
                <Bell className="h-5 w-5 text-[var(--boss-green-bright)]" />
                <h2 className="font-bold">Notifications</h2>
              </div>
              <button onClick={() => setShowNotifPanel(false)} className="text-gray-500 hover:text-white">
                <X className="h-5 w-5" />
              </button>
            </div>
            <div className="space-y-3">
              {notifications.length === 0 ? (
                <p className="text-sm text-gray-500">No notifications.</p>
              ) : (
                notifications.map((n) => (
                  <div
                    key={n.id}
                    className={`rounded-xl border p-3 ${n.is_read ? 'border-[var(--boss-border)]' : 'border-[var(--boss-green)]/30 bg-[var(--boss-green)]/5'}`}
                  >
                    <div className="flex items-start gap-2">
                      {n.type === 'error' ? <AlertTriangle className="h-4 w-4 shrink-0 text-red-400" /> :
                       n.type === 'warning' ? <AlertTriangle className="h-4 w-4 shrink-0 text-yellow-400" /> :
                       <CheckCircle className="h-4 w-4 shrink-0 text-[var(--boss-green-bright)]" />}
                      <div className="flex-1">
                        <p className="text-sm font-semibold">{n.title}</p>
                        {n.body && <p className="text-xs text-gray-400">{n.body}</p>}
                        <p className="mt-1 text-xs text-gray-600">{new Date(n.created_at).toLocaleString()}</p>
                        {!n.is_read && (
                          <button onClick={() => markRead(n.id)} className="mt-1 text-xs text-[var(--boss-green-bright)] hover:underline">
                            Mark as read
                          </button>
                        )}
                      </div>
                    </div>
                  </div>
                ))
              )}
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
