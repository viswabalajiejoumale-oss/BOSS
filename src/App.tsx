import { useState } from 'react';
import { useAuth } from '@/context/AuthContext';
import { ThemeProvider } from '@/context/ThemeContext';
import { LandingPage } from '@/pages/LandingPage';
import { AuthPage } from '@/pages/AuthPage';
import { UserDashboard } from '@/pages/UserDashboard';
import { AdminDashboard } from '@/pages/AdminDashboard';
import { DiscomDashboard } from '@/pages/DiscomDashboard';
import { Loader2 } from 'lucide-react';

function AppContent() {
  const { user, profile, loading } = useAuth();
  const [showAuth, setShowAuth] = useState(false);

  if (loading) {
    return (
      <div className="min-h-screen flex flex-col items-center justify-center bg-background text-foreground transition-colors duration-200">
        <div className="relative flex items-center justify-center mb-4">
          <img
            src="/boss-logo-transparent.png"
            alt="BOSS"
            className="h-16 w-16 object-contain animate-pulse drop-shadow-[0_0_20px_rgba(16,185,129,0.4)]"
          />
        </div>
        <div className="flex items-center gap-2.5 text-emerald-600 dark:text-emerald-400 font-semibold text-xs tracking-wider uppercase">
          <Loader2 className="h-4 w-4 animate-spin text-emerald-500" />
          <span>Connecting to BOSS Grid...</span>
        </div>
      </div>
    );
  }

  if (!user) {
    if (showAuth) return <AuthPage mode="login" onBack={() => setShowAuth(false)} />;
    return <LandingPage onEnter={() => setShowAuth(true)} />;
  }

  if (!profile) {
    return <AuthPage mode="login" />;
  }

  if (profile.role === 'admin') return <AdminDashboard />;
  if (profile.role === 'discom') return <DiscomDashboard />;
  return <UserDashboard />;
}

function App() {
  return (
    <ThemeProvider>
      <AppContent />
    </ThemeProvider>
  );
}

export default App;
