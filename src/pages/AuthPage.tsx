import { useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { useAuth } from '@/context/AuthContext';
import type { Role } from '@/types';
import { Zap, ArrowLeft, AlertCircle, ShieldCheck, Cpu, Activity, CheckCircle2 } from 'lucide-react';
import { evDataset } from '@/data/evDataset';
import { ShinyButton } from '@/components/ui/shiny-button';
import { BackgroundSystem } from '@/components/ui/BackgroundSystem';
import { ThemeToggle } from '@/components/ui/ThemeToggle';

interface AuthPageProps {
  mode: 'login' | 'register';
  onBack?: () => void;
}

type Tab = Role;

export function AuthPage({ mode: initialMode, onBack }: AuthPageProps) {
  const { signIn, signUp } = useAuth();
  const [isLogin, setIsLogin] = useState(initialMode === 'login');
  const [tab, setTab] = useState<Tab>('user');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState<string | null>(null);
  const [loading, setLoading] = useState(false);

  // Onboarding questionnaire (max 4 questions)
  const [hasEv, setHasEv] = useState('');
  const [usageArea, setUsageArea] = useState('');
  const [workTime, setWorkTime] = useState('');
  const [vehicleType, setVehicleType] = useState('');

  // Admin fields
  const [adminName, setAdminName] = useState('');
  const [adminContact, setAdminContact] = useState('');
  const [stationAddr, setStationAddr] = useState('');
  const [licenseName, setLicenseName] = useState('');
  const [licenseNo, setLicenseNo] = useState('');
  const [chargerCount, setChargerCount] = useState('');
  const [transformerKva, setTransformerKva] = useState('');

  // User fields
  const [userName, setUserName] = useState('');
  const [userContact, setUserContact] = useState('');
  const [userAddr, setUserAddr] = useState('');
  const [selectedEvIndex, setSelectedEvIndex] = useState('custom');
  const [vehicleMake, setVehicleMake] = useState('');
  const [vehicleModel, setVehicleModel] = useState('');
  const [batteryKwh, setBatteryKwh] = useState('');

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    setError(null);
    setLoading(true);

    try {
      if (isLogin) {
        const { error } = await signIn(email, password);
        if (error) setError(error);
      } else {
        if (tab === 'user') {
          const { error } = await signUp(email, password, 'user', {
            name: userName,
            contact: userContact,
            address: userAddr,
            vehicle_make: vehicleMake,
            vehicle_model: vehicleModel,
            vehicle_year: null,
            battery_capacity_kwh: batteryKwh ? parseFloat(batteryKwh) : null,
            has_ev: hasEv === 'yes',
            usage_area: usageArea,
            work_preferred_time: workTime,
          });
          if (error) setError(error);
        } else {
          const { error } = await signUp(email, password, 'admin', {
            name: adminName,
            contact: adminContact,
            station_name: adminName,
            station_address: stationAddr,
            address: stationAddr,
            license_name: licenseName,
            license_no: licenseNo,
            charger_count: chargerCount ? parseInt(chargerCount) : null,
            transformer_load_capacity_kva: transformerKva ? parseFloat(transformerKva) : null,
          });
          if (error) setError(error);
        }
      }
    } catch {
      setError('An unexpected error occurred. Please try again.');
    } finally {
      setLoading(false);
    }
  }

  function handleGoogleLogin() {
    setError('Google sign-in is not configured for this demo. Please use email/password.');
  }

  return (
    <BackgroundSystem variant="auth" className="flex items-center justify-center p-4 md:p-8">
      <div className="w-full max-w-5xl mx-auto my-auto grid grid-cols-1 lg:grid-cols-12 gap-8 items-center z-10">
        
        {/* LEFT COLUMN: BRAND & COMMAND TELEMETRY PANEL */}
        <div className="lg:col-span-5 flex flex-col justify-between text-left space-y-6">
          <div>
            <div className="flex items-center justify-between mb-6">
              {onBack ? (
                <button
                  onClick={onBack}
                  className="inline-flex items-center gap-2 text-xs font-bold text-slate-600 dark:text-slate-400 hover:text-emerald-500 transition-colors"
                >
                  <ArrowLeft className="h-4 w-4" /> Back to Home
                </button>
              ) : <div />}
              <ThemeToggle />
            </div>

            <div className="flex items-center gap-3 mb-4">
              <img src="/boss-logo-transparent.png" alt="BOSS Logo" className="h-12 w-12 object-contain" />
              <div>
                <h1 className="text-2xl font-black text-slate-900 dark:text-white tracking-tight">BOSS ECOSYSTEM</h1>
                <p className="text-xs text-emerald-600 dark:text-emerald-400 font-bold uppercase tracking-wider">AI Energy Command Center</p>
              </div>
            </div>

            <p className="text-xs text-slate-600 dark:text-slate-400 leading-relaxed">
              Connect your EV, charging station, or utility grid telemetry account to access intelligent load balancing and slot optimization.
            </p>
          </div>

          {/* Telemetry Visual Card */}
          <div className="rounded-2xl border border-slate-200 dark:border-slate-800 bg-white/90 dark:bg-slate-900/80 p-5 backdrop-blur-xl shadow-xl space-y-4 text-slate-900 dark:text-white">
            <div className="flex items-center justify-between">
              <span className="text-[11px] font-bold text-slate-700 dark:text-slate-300 uppercase tracking-wide flex items-center gap-1.5">
                <Cpu className="h-3.5 w-3.5 text-emerald-600 dark:text-emerald-400" /> SYSTEM TELEMETRY
              </span>
              <span className="h-2 w-2 rounded-full bg-emerald-500 animate-ping" />
            </div>

            <div className="grid grid-cols-2 gap-3 text-left">
              <div className="p-3 rounded-xl bg-slate-100 dark:bg-slate-950/60 border border-slate-200 dark:border-slate-800">
                <span className="text-[10px] text-slate-500 dark:text-slate-400 uppercase font-bold">GRID STATUS</span>
                <p className="text-sm font-black text-emerald-600 dark:text-emerald-400">OPTIMAL (64%)</p>
              </div>
              <div className="p-3 rounded-xl bg-slate-100 dark:bg-slate-950/60 border border-slate-200 dark:border-slate-800">
                <span className="text-[10px] text-slate-500 dark:text-slate-400 uppercase font-bold">ENCRYPTION</span>
                <p className="text-sm font-black text-blue-600 dark:text-blue-400">256-BIT JWT</p>
              </div>
            </div>

            <div className="space-y-2 text-xs text-slate-700 dark:text-slate-300 font-semibold pt-2 border-t border-slate-200 dark:border-slate-800">
              <div className="flex items-center gap-2">
                <CheckCircle2 className="h-4 w-4 text-emerald-600 dark:text-emerald-400 shrink-0" />
                <span>Role-based access control (User, Operator, DISCOM)</span>
              </div>
              <div className="flex items-center gap-2">
                <CheckCircle2 className="h-4 w-4 text-emerald-600 dark:text-emerald-400 shrink-0" />
                <span>Smart meter verification and automated slot sync</span>
              </div>
            </div>
          </div>
        </div>

        {/* RIGHT COLUMN: GLASS AUTH FORM */}
        <div className="lg:col-span-7">
          <div className="rounded-3xl border border-slate-200 dark:border-slate-800 bg-white/90 dark:bg-slate-900/90 backdrop-blur-2xl p-6 sm:p-8 shadow-2xl relative overflow-hidden text-left text-slate-900 dark:text-white">
            
            {/* Login / Register Header Switch */}
            <div className="mb-6 flex rounded-xl bg-slate-100 dark:bg-slate-950/80 p-1 border border-slate-200 dark:border-slate-800">
              <button
                type="button"
                onClick={() => setIsLogin(true)}
                className={`flex-1 rounded-lg py-2.5 text-xs font-extrabold uppercase tracking-wider transition ${
                  isLogin ? 'bg-emerald-600 text-white shadow-md' : 'text-slate-600 dark:text-slate-400 hover:text-slate-900 dark:hover:text-white'
                }`}
              >
                Sign In
              </button>
              <button
                type="button"
                onClick={() => setIsLogin(false)}
                className={`flex-1 rounded-lg py-2.5 text-xs font-extrabold uppercase tracking-wider transition ${
                  !isLogin ? 'bg-emerald-600 text-white shadow-md' : 'text-slate-600 dark:text-slate-400 hover:text-slate-900 dark:hover:text-white'
                }`}
              >
                Register
              </button>
            </div>

            {/* Role Switcher */}
            <div className="mb-6 flex items-center justify-between p-3 rounded-xl bg-slate-100 dark:bg-slate-950/60 border border-slate-200 dark:border-slate-800">
              <span className="text-xs font-bold text-slate-700 dark:text-slate-300 uppercase">Account Role:</span>
              <div className="flex items-center gap-3">
                <span className={`text-xs font-bold ${tab === 'user' ? 'text-emerald-600 dark:text-emerald-400' : 'text-slate-500 dark:text-slate-400'}`}>EV Driver</span>
                <button
                  type="button"
                  onClick={() => setTab(tab === 'user' ? 'admin' : 'user')}
                  className={`relative h-6 w-12 rounded-full transition ${tab === 'admin' ? 'bg-emerald-600' : 'bg-slate-300 dark:bg-slate-700'}`}
                >
                  <motion.div
                    layout
                    transition={{ type: 'spring', stiffness: 500, damping: 30 }}
                    className={`absolute top-0.5 h-5 w-5 rounded-full bg-white ${tab === 'admin' ? 'left-6' : 'left-0.5'}`}
                  />
                </button>
                <span className={`text-xs font-bold ${tab === 'admin' ? 'text-emerald-600 dark:text-emerald-400' : 'text-slate-500 dark:text-slate-400'}`}>Station Admin</span>
              </div>
            </div>

            <form onSubmit={handleSubmit} className="space-y-4">
              <AnimatePresence mode="wait">
                {!isLogin && tab === 'user' && (
                  <motion.div
                    key="user-fields"
                    initial={{ opacity: 0, height: 0 }}
                    animate={{ opacity: 1, height: 'auto' }}
                    exit={{ opacity: 0, height: 0 }}
                    className="space-y-4 overflow-hidden"
                  >
                    <div className="grid grid-cols-2 gap-3">
                      <div>
                        <label className="boss-label">Full Name</label>
                        <input className="boss-input" value={userName} onChange={(e) => setUserName(e.target.value)} required />
                      </div>
                      <div>
                        <label className="boss-label">Contact Number</label>
                        <input className="boss-input" value={userContact} onChange={(e) => setUserContact(e.target.value)} required />
                      </div>
                    </div>
                    <div>
                      <label className="boss-label">Address</label>
                      <input className="boss-input" value={userAddr} onChange={(e) => setUserAddr(e.target.value)} required />
                    </div>

                    <div>
                      <label className="boss-label">Select EV Model</label>
                      <select
                        className="boss-input"
                        value={selectedEvIndex}
                        onChange={(e) => {
                          const val = e.target.value;
                          setSelectedEvIndex(val);
                          if (val !== 'custom') {
                            const idx = parseInt(val);
                            const ev = evDataset[idx];
                            setVehicleMake(ev.brand);
                            setVehicleModel(ev.model);
                            setBatteryKwh(ev.battery.toString());
                          } else {
                            setVehicleMake('');
                            setVehicleModel('');
                            setBatteryKwh('');
                          }
                        }}
                      >
                        <option value="custom">Custom (Type manually)</option>
                        {evDataset.map((ev, idx) => (
                          <option key={idx} value={idx}>
                            {ev.fullName} ({ev.battery} kWh)
                          </option>
                        ))}
                      </select>
                    </div>

                    <div className="grid grid-cols-2 gap-3">
                      <div>
                        <label className="boss-label">Vehicle Make</label>
                        <input className="boss-input" placeholder="Tesla" value={vehicleMake} onChange={(e) => setVehicleMake(e.target.value)} />
                      </div>
                      <div>
                        <label className="boss-label">Vehicle Model</label>
                        <input className="boss-input" placeholder="Model 3" value={vehicleModel} onChange={(e) => setVehicleModel(e.target.value)} />
                      </div>
                    </div>

                    <div>
                      <label className="boss-label">Battery Capacity (kWh)</label>
                      <input className="boss-input" type="number" placeholder="75" value={batteryKwh} onChange={(e) => setBatteryKwh(e.target.value)} />
                    </div>

                    {/* Onboarding Questionnaire */}
                    <div className="rounded-xl border border-slate-800 bg-slate-950/60 p-4">
                      <p className="mb-3 text-xs font-extrabold uppercase tracking-wider text-emerald-400">Quick Onboarding Sync</p>
                      <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                        <div>
                          <label className="boss-label">Do you own an EV?</label>
                          <select className="boss-input" value={hasEv} onChange={(e) => setHasEv(e.target.value)} required>
                            <option value="">Select...</option>
                            <option value="yes">Yes</option>
                            <option value="no">No</option>
                          </select>
                        </div>
                        <div>
                          <label className="boss-label">Primary Usage Area</label>
                          <select className="boss-input" value={usageArea} onChange={(e) => setUsageArea(e.target.value)} required>
                            <option value="">Select...</option>
                            <option value="City center">City center</option>
                            <option value="Highway">Highway</option>
                            <option value="Suburbs">Suburbs</option>
                            <option value="Mixed">Mixed</option>
                          </select>
                        </div>
                        <div>
                          <label className="boss-label">Preferred Time Slot</label>
                          <select className="boss-input" value={workTime} onChange={(e) => setWorkTime(e.target.value)} required>
                            <option value="">Select...</option>
                            <option value="9 AM - 5 PM">9 AM - 5 PM</option>
                            <option value="10 AM - 6 PM">10 AM - 6 PM</option>
                            <option value="Night shift">Night shift</option>
                            <option value="Flexible">Flexible</option>
                          </select>
                        </div>
                        <div>
                          <label className="boss-label">Vehicle Segment</label>
                          <select className="boss-input" value={vehicleType} onChange={(e) => setVehicleType(e.target.value)}>
                            <option value="">Select...</option>
                            <option value="Sedan">Sedan</option>
                            <option value="SUV">SUV</option>
                            <option value="Hatchback">Hatchback</option>
                            <option value="Truck">Truck</option>
                          </select>
                        </div>
                      </div>
                    </div>
                  </motion.div>
                )}

                {!isLogin && tab === 'admin' && (
                  <motion.div
                    key="admin-fields"
                    initial={{ opacity: 0, height: 0 }}
                    animate={{ opacity: 1, height: 'auto' }}
                    exit={{ opacity: 0, height: 0 }}
                    className="space-y-4 overflow-hidden"
                  >
                    <div className="grid grid-cols-2 gap-3">
                      <div>
                        <label className="boss-label">Operator Name</label>
                        <input className="boss-input" value={adminName} onChange={(e) => setAdminName(e.target.value)} required />
                      </div>
                      <div>
                        <label className="boss-label">Contact Number</label>
                        <input className="boss-input" value={adminContact} onChange={(e) => setAdminContact(e.target.value)} required />
                      </div>
                    </div>
                    <div>
                      <label className="boss-label">Station Address</label>
                      <input className="boss-input" value={stationAddr} onChange={(e) => setStationAddr(e.target.value)} required />
                    </div>
                    <div className="grid grid-cols-2 gap-3">
                      <div>
                        <label className="boss-label">License Entity</label>
                        <input className="boss-input" value={licenseName} onChange={(e) => setLicenseName(e.target.value)} required />
                      </div>
                      <div>
                        <label className="boss-label">License Number</label>
                        <input className="boss-input" value={licenseNo} onChange={(e) => setLicenseNo(e.target.value)} required />
                      </div>
                    </div>
                    <div className="grid grid-cols-2 gap-3">
                      <div>
                        <label className="boss-label">Number of Chargers</label>
                        <input className="boss-input" type="number" value={chargerCount} onChange={(e) => setChargerCount(e.target.value)} required />
                      </div>
                      <div>
                        <label className="boss-label">Transformer Load (kVA)</label>
                        <input className="boss-input" type="number" value={transformerKva} onChange={(e) => setTransformerKva(e.target.value)} required />
                      </div>
                    </div>
                  </motion.div>
                )}
              </AnimatePresence>

              {/* Common Credentials */}
              <div>
                <label className="boss-label">Account Email</label>
                <input className="boss-input" type="email" placeholder="user@boss.demo" value={email} onChange={(e) => setEmail(e.target.value)} required />
              </div>
              <div>
                <label className="boss-label">Password</label>
                <input className="boss-input" type="password" placeholder="••••••••" value={password} onChange={(e) => setPassword(e.target.value)} required />
              </div>

              {error && (
                <div className="flex items-center gap-2 rounded-xl border border-red-500/30 bg-red-500/10 p-3 text-xs text-red-400">
                  <AlertCircle className="h-4 w-4 shrink-0" />
                  <span>{error}</span>
                </div>
              )}

              <ShinyButton
                type="submit"
                disabled={loading}
                className="w-full bg-emerald-600 hover:bg-emerald-500 border-emerald-400/40 rounded-xl text-white font-extrabold text-sm text-center block py-3 cursor-pointer shadow-lg shadow-emerald-600/30"
              >
                {loading ? 'Authenticating...' : isLogin ? 'Access Command Center →' : 'Complete Registration →'}
              </ShinyButton>
            </form>

            <div className="mt-4 flex items-center justify-between text-xs text-slate-400">
              <button
                type="button"
                onClick={() => setError('Password reset is not available in demo mode. Contact admin.')}
                className="hover:text-emerald-400 transition-colors"
              >
                Forgot password?
              </button>
              <button
                type="button"
                onClick={() => { setIsLogin(!isLogin); setError(null); }}
                className="text-emerald-400 font-bold hover:underline"
              >
                {isLogin ? 'Create new account' : 'Existing user sign in'}
              </button>
            </div>

            <p className="mt-6 text-center text-[11px] text-slate-500">
              Demo Accounts: <span className="text-slate-300 font-mono">admin@boss.demo</span> / <span className="text-slate-300 font-mono">user@boss.demo</span> (Pass: BossUser123!)
            </p>
          </div>
        </div>

      </div>
    </BackgroundSystem>
  );
}
