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
      <div className="min-h-screen flex items-center justify-center bg-[var(--boss-bg)]">
        <Loader2 className="h-10 w-10 animate-spin text-[var(--boss-green)]" />
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
