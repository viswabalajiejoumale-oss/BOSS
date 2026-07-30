import { useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { useAuth } from '@/context/AuthContext';
import type { Role } from '@/types';
import { Zap, ArrowLeft, AlertCircle } from 'lucide-react';

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
  const [vehicleMake, setVehicleMake] = useState('');
  const [vehicleModel, setVehicleModel] = useState('');
  const [vehicleYear, setVehicleYear] = useState('');
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
            vehicle_year: vehicleYear ? parseInt(vehicleYear) : null,
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
    <div className="min-h-screen bg-[var(--boss-bg)] flex items-center justify-center px-4 py-8">
      <div className="pointer-events-none fixed inset-0 overflow-hidden">
        <div className="absolute -top-40 left-1/4 h-96 w-96 rounded-full bg-[var(--boss-green)] opacity-10 blur-3xl" />
      </div>

      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.5 }}
        className="relative z-10 w-full max-w-md"
      >
        {onBack && (
          <button onClick={onBack} className="mb-4 flex items-center gap-1 text-sm text-gray-400 hover:text-[var(--boss-green-bright)]">
            <ArrowLeft className="h-4 w-4" /> Back
          </button>
        )}

        {/* Logo */}
        <div className="mb-6 flex flex-col items-center">
          <div className="mb-2 flex h-14 w-14 items-center justify-center rounded-2xl bg-[var(--boss-green)] text-black shadow-[0_0_30px_var(--boss-green-glow)]">
            <Zap className="h-7 w-7" />
          </div>
          <h1 className="text-xl font-bold">BOSS</h1>
          <p className="text-sm text-gray-500">Smart EV Charging Platform</p>
        </div>

        <div className="boss-card">
          {/* Login / Register toggle */}
          <div className="mb-5 flex rounded-xl bg-black/40 p-1">
            <button
              onClick={() => setIsLogin(true)}
              className={`flex-1 rounded-lg py-2 text-sm font-semibold transition ${isLogin ? 'bg-[var(--boss-green)] text-black' : 'text-gray-400'}`}
            >
              Login
            </button>
            <button
              onClick={() => setIsLogin(false)}
              className={`flex-1 rounded-lg py-2 text-sm font-semibold transition ${!isLogin ? 'bg-[var(--boss-green)] text-black' : 'text-gray-400'}`}
            >
              Sign Up
            </button>
          </div>

          {/* User / Admin toggle */}
          <div className="mb-5 flex items-center justify-center gap-3">
            <span className={`text-sm ${tab === 'user' ? 'text-[var(--boss-green-bright)] font-semibold' : 'text-gray-500'}`}>User</span>
            <button
              onClick={() => setTab(tab === 'user' ? 'admin' : 'user')}
              className={`relative h-7 w-14 rounded-full transition ${tab === 'admin' ? 'bg-[var(--boss-green)]' : 'bg-gray-700'}`}
            >
              <motion.div
                layout
                transition={{ type: 'spring', stiffness: 500, damping: 30 }}
                className={`absolute top-1 h-5 w-5 rounded-full bg-white ${tab === 'admin' ? 'left-8' : 'left-1'}`}
              />
            </button>
            <span className={`text-sm ${tab === 'admin' ? 'text-[var(--boss-green-bright)] font-semibold' : 'text-gray-500'}`}>Admin</span>
          </div>

          <form onSubmit={handleSubmit} className="space-y-4">
            <AnimatePresence mode="wait">
              {!isLogin && tab === 'user' && (
                <motion.div key="user-fields" initial={{ opacity: 0, height: 0 }} animate={{ opacity: 1, height: 'auto' }} exit={{ opacity: 0, height: 0 }} className="space-y-4 overflow-hidden">
                  <div className="grid grid-cols-2 gap-3">
                    <div>
                      <label className="boss-label">Name</label>
                      <input className="boss-input" value={userName} onChange={(e) => setUserName(e.target.value)} required />
                    </div>
                    <div>
                      <label className="boss-label">Contact</label>
                      <input className="boss-input" value={userContact} onChange={(e) => setUserContact(e.target.value)} required />
                    </div>
                  </div>
                  <div>
                    <label className="boss-label">Address</label>
                    <input className="boss-input" value={userAddr} onChange={(e) => setUserAddr(e.target.value)} required />
                  </div>
                  <div className="grid grid-cols-3 gap-3">
                    <div>
                      <label className="boss-label">Make</label>
                      <input className="boss-input" placeholder="Tesla" value={vehicleMake} onChange={(e) => setVehicleMake(e.target.value)} />
                    </div>
                    <div>
                      <label className="boss-label">Model</label>
                      <input className="boss-input" placeholder="Model 3" value={vehicleModel} onChange={(e) => setVehicleModel(e.target.value)} />
                    </div>
                    <div>
                      <label className="boss-label">Year</label>
                      <input className="boss-input" type="number" placeholder="2023" value={vehicleYear} onChange={(e) => setVehicleYear(e.target.value)} />
                    </div>
                  </div>
                  <div>
                    <label className="boss-label">Battery Capacity (kWh)</label>
                    <input className="boss-input" type="number" placeholder="75" value={batteryKwh} onChange={(e) => setBatteryKwh(e.target.value)} />
                  </div>

                  {/* Onboarding questionnaire */}
                  <div className="rounded-xl border border-[var(--boss-border)] bg-black/30 p-4">
                    <p className="mb-3 text-sm font-semibold text-[var(--boss-green-bright)]">Quick Onboarding (4 questions)</p>
                    <div className="space-y-3">
                      <div>
                        <label className="boss-label">Do you have an EV vehicle?</label>
                        <select className="boss-input" value={hasEv} onChange={(e) => setHasEv(e.target.value)} required>
                          <option value="">Select...</option>
                          <option value="yes">Yes</option>
                          <option value="no">No</option>
                        </select>
                      </div>
                      <div>
                        <label className="boss-label">Where do you mostly use your EV?</label>
                        <select className="boss-input" value={usageArea} onChange={(e) => setUsageArea(e.target.value)} required>
                          <option value="">Select...</option>
                          <option value="City center">City center</option>
                          <option value="Highway">Highway</option>
                          <option value="Suburbs">Suburbs</option>
                          <option value="Mixed">Mixed</option>
                        </select>
                      </div>
                      <div>
                        <label className="boss-label">Your work preferred time?</label>
                        <select className="boss-input" value={workTime} onChange={(e) => setWorkTime(e.target.value)} required>
                          <option value="">Select...</option>
                          <option value="9 AM - 5 PM">9 AM - 5 PM</option>
                          <option value="10 AM - 6 PM">10 AM - 6 PM</option>
                          <option value="Night shift">Night shift</option>
                          <option value="Flexible">Flexible</option>
                        </select>
                      </div>
                      <div>
                        <label className="boss-label">Vehicle type?</label>
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
                <motion.div key="admin-fields" initial={{ opacity: 0, height: 0 }} animate={{ opacity: 1, height: 'auto' }} exit={{ opacity: 0, height: 0 }} className="space-y-4 overflow-hidden">
                  <div className="grid grid-cols-2 gap-3">
                    <div>
                      <label className="boss-label">Name</label>
                      <input className="boss-input" value={adminName} onChange={(e) => setAdminName(e.target.value)} required />
                    </div>
                    <div>
                      <label className="boss-label">Contact</label>
                      <input className="boss-input" value={adminContact} onChange={(e) => setAdminContact(e.target.value)} required />
                    </div>
                  </div>
                  <div>
                    <label className="boss-label">Station Address</label>
                    <input className="boss-input" value={stationAddr} onChange={(e) => setStationAddr(e.target.value)} required />
                  </div>
                  <div className="grid grid-cols-2 gap-3">
                    <div>
                      <label className="boss-label">License</label>
                      <input className="boss-input" value={licenseName} onChange={(e) => setLicenseName(e.target.value)} required />
                    </div>
                    <div>
                      <label className="boss-label">License No.</label>
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

            {/* Common fields */}
            <div>
              <label className="boss-label">Email</label>
              <input className="boss-input" type="email" value={email} onChange={(e) => setEmail(e.target.value)} required />
            </div>
            <div>
              <label className="boss-label">Password</label>
              <input className="boss-input" type="password" value={password} onChange={(e) => setPassword(e.target.value)} required />
            </div>

            {error && (
              <div className="flex items-center gap-2 rounded-lg border border-red-500/30 bg-red-500/10 px-3 py-2 text-sm text-red-400">
                <AlertCircle className="h-4 w-4 shrink-0" />
                {error}
              </div>
            )}

            <button type="submit" disabled={loading} className="boss-btn-primary w-full">
              {loading ? 'Please wait...' : isLogin ? 'Login' : 'Sign Up'}
            </button>
          </form>

          {/* Links */}
          <div className="mt-4 flex items-center justify-between text-sm">
            <button onClick={() => setError('Password reset is not available in this demo. Contact your admin.')} className="text-gray-400 hover:text-[var(--boss-green-bright)]">
              Forgot password?
            </button>
            <button onClick={() => { setIsLogin(!isLogin); setError(null); }} className="text-[var(--boss-green-bright)] hover:underline">
              {isLogin ? 'New user? Sign up' : 'Already have an account? Login'}
            </button>
          </div>

          {/* Divider */}
          <div className="my-4 flex items-center gap-3">
            <div className="h-px flex-1 bg-[var(--boss-border)]" />
            <span className="text-xs text-gray-500">OR</span>
            <div className="h-px flex-1 bg-[var(--boss-border)]" />
          </div>

          {/* Google login */}
          <button onClick={handleGoogleLogin} className="boss-btn-ghost w-full">
            <svg className="h-5 w-5" viewBox="0 0 24 24">
              <path fill="#4285F4" d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z" />
              <path fill="#34A853" d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z" />
              <path fill="#FBBC05" d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z" />
              <path fill="#EA4335" d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z" />
            </svg>
            Continue with Google
          </button>
        </div>

        <p className="mt-4 text-center text-xs text-gray-600">
          Demo: admin@boss.demo / BossAdmin123! — user@boss.demo / BossUser123!
        </p>
      </motion.div>
    </div>
  );
}
