import { createContext, useContext, useEffect, useState, type ReactNode } from 'react';
import type { Session, User } from '@supabase/supabase-js';
import { supabase } from '@/lib/supabase';
import type { Profile, Role } from '@/types';

interface AuthContextValue {
  session: Session | null;
  user: User | null;
  profile: Profile | null;
  loading: boolean;
  signIn: (email: string, password: string) => Promise<{ error: string | null }>;
  signUp: (email: string, password: string, role: Role, profileData: Partial<Profile>) => Promise<{ error: string | null }>;
  signOut: () => Promise<void>;
  refreshProfile: () => Promise<void>;
}

const AuthContext = createContext<AuthContextValue | undefined>(undefined);

export function AuthProvider({ children }: { children: ReactNode }) {
  const [session, setSession] = useState<Session | null>(null);
  const [user, setUser] = useState<User | null>(null);
  const [profile, setProfile] = useState<Profile | null>(null);
  const [loading, setLoading] = useState(true);

  async function loadProfile(uid: string) {
    try {
      const { data, error } = await Promise.race([
        supabase
          .from('profiles')
          .select('*')
          .eq('id', uid)
          .maybeSingle(),
        new Promise<{ data: null; error: { message: string } }>((resolve) =>
          setTimeout(() => resolve({ data: null, error: { message: 'Timeout' } }), 1800)
        ),
      ]);
      if (error) {
        console.warn('Profile load error:', error.message);
        return null;
      }
      setProfile(data as Profile | null);
      return data as Profile | null;
    } catch (err) {
      console.warn('Profile load exception:', err);
      return null;
    }
  }

  useEffect(() => {
    let isMounted = true;
    let safetyTimer: ReturnType<typeof setTimeout> | null = setTimeout(() => {
      if (isMounted) setLoading(false);
    }, 2000);

    supabase.auth
      .getSession()
      .then(async ({ data }) => {
        if (!isMounted) return;
        setSession(data.session);
        setUser(data.session?.user ?? null);
        if (data.session?.user) {
          try {
            await loadProfile(data.session.user.id);
          } finally {
            if (isMounted) {
              setLoading(false);
              if (safetyTimer) clearTimeout(safetyTimer);
            }
          }
        } else {
          setLoading(false);
          if (safetyTimer) clearTimeout(safetyTimer);
        }
      })
      .catch((err) => {
        console.warn('Session check failed or timed out:', err);
        if (isMounted) {
          setLoading(false);
          if (safetyTimer) clearTimeout(safetyTimer);
        }
      });

    const { data: sub } = supabase.auth.onAuthStateChange((_event, sess) => {
      if (!isMounted) return;
      setSession(sess);
      setUser(sess?.user ?? null);
      if (sess?.user) {
        (async () => {
          await loadProfile(sess.user.id);
        })();
      } else {
        setProfile(null);
      }
    });

    return () => {
      isMounted = false;
      clearTimeout(safetyTimer);
      sub.subscription.unsubscribe();
    };
  }, []);

  async function signIn(email: string, password: string) {
    const { error } = await supabase.auth.signInWithPassword({ email, password });
    if (error) return { error: error.message };
    return { error: null };
  }

  async function signUp(email: string, password: string, role: Role, profileData: Partial<Profile>) {
    const { data, error } = await supabase.auth.signUp({ email, password });
    if (error) return { error: error.message };
    if (!data.user) return { error: 'Sign-up failed — no user returned.' };

    const insert = {
      id: data.user.id,
      role,
      email,
      name: profileData.name ?? null,
      contact: profileData.contact ?? null,
      address: profileData.address ?? null,
      vehicle_make: profileData.vehicle_make ?? null,
      vehicle_model: profileData.vehicle_model ?? null,
      vehicle_year: profileData.vehicle_year ?? null,
      battery_capacity_kwh: profileData.battery_capacity_kwh ?? null,
      has_ev: profileData.has_ev ?? null,
      usage_area: profileData.usage_area ?? null,
      work_preferred_time: profileData.work_preferred_time ?? null,
      station_name: profileData.station_name ?? null,
      station_address: profileData.station_address ?? null,
      license_name: profileData.license_name ?? null,
      license_no: profileData.license_no ?? null,
      charger_count: profileData.charger_count ?? null,
      transformer_load_capacity_kva: profileData.transformer_load_capacity_kva ?? null,
    };

    const { error: profileErr } = await supabase.from('profiles').insert(insert);
    if (profileErr) return { error: profileErr.message };

    // If admin, create their station
    if (role === 'admin' && profileData.station_name) {
      const { data: stationData, error: stationErr } = await supabase
        .from('stations')
        .insert({
          admin_id: data.user.id,
          name: profileData.station_name,
          address: profileData.station_address ?? profileData.address ?? '',
          latitude: 40.71,
          longitude: -74.0,
          license_name: profileData.license_name ?? null,
          license_no: profileData.license_no ?? null,
          transformer_load_capacity_kva: profileData.transformer_load_capacity_kva ?? 500,
          current_load_kva: 0,
          is_active: true,
        })
        .select()
        .single();

      if (!stationErr && stationData && profileData.charger_count) {
        const chargerRows = Array.from({ length: profileData.charger_count }, (_, i) => ({
          station_id: stationData.id,
          label: `Port ${String.fromCharCode(65 + Math.floor(i / 4))}${(i % 4) + 1}`,
          power_kw: i < 2 ? 150 : i < 4 ? 50 : 22,
          status: 'available' as const,
          current_load_kw: 0,
          connector_type: i < 2 ? 'CCS' : i < 4 ? 'CCS' : 'Type2',
        }));
        await supabase.from('chargers').insert(chargerRows);
      }
    }

    return { error: null };
  }

  async function signOut() {
    await supabase.auth.signOut();
    setProfile(null);
  }

  async function refreshProfile() {
    if (user) await loadProfile(user.id);
  }

  const value: AuthContextValue = {
    session,
    user,
    profile,
    loading,
    signIn,
    signUp,
    signOut,
    refreshProfile,
  };

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>;
}

// eslint-disable-next-line react-refresh/only-export-components
export function useAuth() {
  const ctx = useContext(AuthContext);
  if (!ctx) throw new Error('useAuth must be used within AuthProvider');
  return ctx;
}
