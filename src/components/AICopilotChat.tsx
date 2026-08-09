import { useState, useRef, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import {
  Sparkles, Send, X, Bot, User, RefreshCw, Zap, Cpu, Activity, Battery, MapPin, ChevronDown, Minimize2
} from 'lucide-react';
import { getAICopilotResponse, type ChatMessage } from '@/lib/openRouterService';

interface AICopilotChatProps {
  selectedStationName?: string;
  stationLoadPct?: number;
  availablePortsCount?: number;
  userBatteryPct?: number;
  userState?: string;
  activeReservation?: any;
  onSelectStationPrompt?: (query: string) => void;
}

export function AICopilotChat({
  selectedStationName,
  stationLoadPct,
  availablePortsCount,
  userBatteryPct,
  userState,
  activeReservation,
  onSelectStationPrompt,
}: AICopilotChatProps) {
  const [isOpen, setIsOpen] = useState(false);
  const [input, setInput] = useState('');
  const [messages, setMessages] = useState<ChatMessage[]>([
    {
      role: 'assistant',
      content: `⚡ **Hello! I am BOSS AI.**\n\nI monitor station loads live, find available charging slots, analyze charger port freeness, and optimize smart grid battery charging.\n\nHow can I help you today?`,
    },
  ]);

  const [loading, setLoading] = useState(false);
  const messagesEndRef = useRef<HTMLDivElement>(null);

  const scrollToBottom = () => {
    messagesEndRef.current?.scrollIntoView({ behavior: 'smooth' });
  };

  useEffect(() => {
    if (isOpen) {
      scrollToBottom();
    }
  }, [messages, isOpen]);

  const handleSend = async (customText?: string) => {
    const textToSend = customText || input;
    if (!textToSend.trim() || loading) return;

    const userMsg: ChatMessage = { role: 'user', content: textToSend };
    setMessages((prev) => [...prev, userMsg]);
    if (!customText) setInput('');
    setLoading(true);

    try {
      const responseText = await getAICopilotResponse(
        textToSend,
        {
          selectedStationName,
          stationLoadPct,
          availablePortsCount,
          userBatteryPct,
          userState,
          activeReservation,
        },
        messages
      );

      const assistantMsg: ChatMessage = { role: 'assistant', content: responseText };
      setMessages((prev) => [...prev, assistantMsg]);
    } catch (e) {
      setMessages((prev) => [
        ...prev,
        {
          role: 'assistant',
          content: '⚠️ Unable to connect right now. Safe heuristic slot finding is active.',
        },
      ]);
    } finally {
      setLoading(false);
    }
  };

  const quickPrompts = [
    '⚡ Find nearest free slot with low load',
    '📊 Analyze live charger power distribution',
    '🔋 How to maximize charging efficiency?',
    '🛡️ Check 80% EV station load safety status',
  ];

  return (
    <div className="fixed bottom-6 right-6 z-50">
      <AnimatePresence>
        {isOpen && (
          <motion.div
            initial={{ opacity: 0, scale: 0.9, y: 20 }}
            animate={{ opacity: 1, scale: 1, y: 0 }}
            exit={{ opacity: 0, scale: 0.9, y: 20 }}
            className="w-[360px] sm:w-[420px] h-[540px] bg-white border border-emerald-300 rounded-2xl shadow-2xl flex flex-col overflow-hidden text-slate-900"
          >
            {/* Top Bar */}
            <div className="p-4 bg-emerald-700 text-white flex items-center justify-between shadow-sm">
              <div className="flex items-center gap-3">
                <img
                  src="/BOSS AI.jpeg"
                  alt="BOSS AI Logo"
                  className="h-9 w-9 rounded-full object-cover shadow-sm"
                />
                <div>
                  <h3 className="font-extrabold text-sm flex items-center gap-1.5 leading-none text-white">
                    BOSS AI Copilot <span className="text-[9px] font-black uppercase px-1.5 py-0.5 rounded bg-emerald-400 text-slate-950">GRID ENGINE</span>
                  </h3>
                  <p className="text-[10px] text-emerald-100 font-medium mt-0.5">Powered by OpenRouter LLM</p>
                </div>
              </div>
              <button
                onClick={() => setIsOpen(false)}
                className="p-1.5 rounded-lg hover:bg-white/20 text-white transition-colors cursor-pointer"
              >
                <X className="w-4 h-4" />
              </button>
            </div>

            {/* Live Context Banner */}
            <div className="px-4 py-2 bg-emerald-500/10 border-b border-emerald-500/20 text-[11px] text-slate-700 dark:text-slate-300 font-semibold flex items-center justify-between gap-2 overflow-x-auto">
              <span className="flex items-center gap-1 text-slate-900 dark:text-white font-bold">
                <MapPin className="w-3 h-3 text-emerald-600 dark:text-emerald-400" /> {selectedStationName ? selectedStationName.slice(0, 18) + '...' : 'All Grid'}
              </span>
              <span className="flex items-center gap-1 text-emerald-700 dark:text-emerald-400 font-bold">
                <Zap className="w-3 h-3" /> Load: {stationLoadPct !== undefined ? `${stationLoadPct}%` : 'Normal'}
              </span>
              <span className="flex items-center gap-1 text-amber-700 dark:text-amber-400 font-bold">
                <Battery className="w-3 h-3" /> {userBatteryPct || 50}% SOC
              </span>
            </div>

            {/* Messages Scroll Area */}
            <div className="flex-1 overflow-y-auto p-4 space-y-3.5 text-xs bg-slate-50/70 dark:bg-[#0B1714]">
              {messages.map((msg, idx) => {
                const isUser = msg.role === 'user';
                return (
                  <div
                    key={idx}
                    className={`flex items-start gap-2.5 ${isUser ? 'flex-row-reverse' : ''}`}
                  >
                    <div
                      className={`p-1 rounded-xl text-xs shrink-0 ${isUser
                          ? 'bg-emerald-600 text-white'
                          : 'bg-transparent text-emerald-500'
                        }`}
                    >
                      {isUser ? (
                        <User className="w-4 h-4" />
                      ) : (
                        <img src="/BOSS AI.jpeg" className="w-5 h-5 rounded-full object-cover" alt="BOSS AI" />
                      )}
                    </div>

                    <div
                      className={`max-w-[80%] p-3 rounded-2xl border text-xs leading-relaxed whitespace-pre-line ${isUser
                          ? 'bg-emerald-600 border-emerald-700 rounded-tr-none text-white font-medium shadow-sm'
                          : 'bg-white dark:bg-[#14241F] border-slate-200 dark:border-slate-800 rounded-tl-none text-slate-800 dark:text-slate-100 font-medium shadow-sm'
                        }`}
                    >
                      {msg.content}
                    </div>
                  </div>
                );
              })}

              {loading && (
                <div className="flex items-center gap-2 text-emerald-700 dark:text-emerald-400 font-bold text-xs italic p-2 bg-emerald-500/10 rounded-xl border border-emerald-500/30">
                  <RefreshCw className="w-4 h-4 animate-spin text-emerald-600 dark:text-emerald-400" />
                  OpenRouter AI thinking...
                </div>
              )}
              <div ref={messagesEndRef} />
            </div>

            {/* Quick Preset Buttons */}
            <div className="px-3 py-2 bg-slate-100 dark:bg-[#0B1714] border-t border-slate-200 dark:border-slate-800 flex items-center gap-1.5 overflow-x-auto text-[10px]">
              {quickPrompts.map((prompt, i) => (
                <button
                  key={i}
                  onClick={() => handleSend(prompt)}
                  disabled={loading}
                  className="whitespace-nowrap px-2.5 py-1 rounded-lg bg-white dark:bg-[#14241F] border border-slate-300 dark:border-slate-700 hover:border-emerald-500 text-slate-700 dark:text-slate-300 hover:text-emerald-700 dark:hover:text-emerald-400 font-bold transition-colors shadow-sm cursor-pointer"
                >
                  {prompt}
                </button>
              ))}
            </div>

            {/* Input Bar */}
            <div className="p-3 bg-white dark:bg-[#111F1C] border-t border-slate-200 dark:border-slate-800 flex items-center gap-2">
              <input
                type="text"
                value={input}
                onChange={(e) => setInput(e.target.value)}
                onKeyDown={(e) => e.key === 'Enter' && handleSend()}
                placeholder="Ask BOSS AI anything..."
                className="flex-1 bg-slate-50 dark:bg-[#0B1714] border border-slate-300 dark:border-slate-700 rounded-xl px-3 py-2 text-xs text-slate-900 dark:text-slate-100 placeholder-slate-400 outline-none focus:border-emerald-500 focus:ring-1 focus:ring-emerald-500"
              />
              <button
                onClick={() => handleSend()}
                disabled={loading || !input.trim()}
                className="p-2 rounded-xl bg-emerald-600 hover:bg-emerald-500 text-white font-bold disabled:opacity-40 transition cursor-pointer"
              >
                <Send className="w-4 h-4" />
              </button>
            </div>
          </motion.div>
        )}
      </AnimatePresence>

      {/* Floating Trigger Button — BOSS AI.jpeg Image Only (Bigger, No White Outline) */}
      {!isOpen && (
        <motion.button
          whileHover={{ scale: 1.1 }}
          whileTap={{ scale: 0.9 }}
          onClick={() => setIsOpen(true)}
          className="relative rounded-full shadow-2xl transition-all cursor-pointer"
          title="Open BOSS AI Assistant"
        >
          <div className="relative flex items-center justify-center">
            <img
              src="/boss-ai-transparent.png"
              alt="BOSS AI"
              className="h-16 w-16 sm:h-20 sm:w-20 rounded-full object-contain shadow-2xl hover:brightness-105"
            />
            <span className="absolute top-0 right-0 flex h-4 w-4">
              <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-emerald-400 opacity-75" />
              <span className="relative inline-flex rounded-full h-4 w-4 bg-emerald-600 border border-emerald-400 shadow-sm" />
            </span>
          </div>
        </motion.button>
      )}
    </div>
  );
}
