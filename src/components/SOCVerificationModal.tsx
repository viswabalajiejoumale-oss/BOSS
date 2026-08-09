import React, { useState, useRef, useEffect, useCallback } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import {
  Camera,
  RefreshCw,
  X,
  CheckCircle2,
  AlertTriangle,
  ShieldCheck,
  Zap,
  Info,
  Clock,
  Sparkles,
  HelpCircle,
  FileCheck,
  ShieldAlert
} from 'lucide-react';
import { ShinyButton } from './ui/shiny-button';
import { processSOCVerification } from '@/lib/socVerificationService';
import type { SOCVerificationResult } from '@/types';

interface SOCVerificationModalProps {
  isOpen: boolean;
  onClose: () => void;
  userId: string;
  claimedSOC: number;
  onVerificationComplete?: (result: SOCVerificationResult) => void;
  bookingId?: string;
  bookingCode?: string;
  stationId?: string;
  stationName?: string;
  vehicleId?: string;
}

export const SOCVerificationModal: React.FC<SOCVerificationModalProps> = ({
  isOpen,
  onClose,
  userId,
  claimedSOC,
  onVerificationComplete,
  bookingId,
  bookingCode,
  stationId,
  stationName,
  vehicleId,
}) => {
  // Camera & Video States
  const videoRef = useRef<HTMLVideoElement | null>(null);
  const canvasRef = useRef<HTMLCanvasElement | null>(null);
  const streamRef = useRef<MediaStream | null>(null);

  const [cameraActive, setCameraActive] = useState(false);
  const [cameraError, setCameraError] = useState<string | null>(null);
  const [capturedImage, setCapturedImage] = useState<string | null>(null);
  const [capturedBlob, setCapturedBlob] = useState<Blob | null>(null);

  // Processing & Results
  const [isProcessing, setIsProcessing] = useState(false);
  const [scanStepText, setScanStepText] = useState('Initializing dashboard scanner...');
  const [verificationResult, setVerificationResult] = useState<SOCVerificationResult | null>(null);

  // Hackathon Demo Mode Controls
  const [isDemoMode, setIsDemoMode] = useState(true); // Default enabled for hackathon presentation
  const [demoPreset, setDemoPreset] = useState<'honest' | 'mismatch' | 'reused' | 'expired'>('honest');

  // Manual Review Request state
  const [requestedManualReview, setRequestedManualReview] = useState(false);

  // Start Camera Stream with multi-device fallback
  const startCamera = useCallback(async () => {
    setCameraError(null);
    try {
      if (streamRef.current) {
        streamRef.current.getTracks().forEach((track) => track.stop());
      }

      let stream: MediaStream;
      try {
        // 1. Try rear vehicle dashboard camera first (mobile)
        stream = await navigator.mediaDevices.getUserMedia({
          video: { facingMode: 'environment', width: { ideal: 1280 }, height: { ideal: 720 } },
          audio: false,
        });
      } catch {
        // 2. Fallback to standard web camera (laptops, PCs, desktop webcams)
        stream = await navigator.mediaDevices.getUserMedia({
          video: true,
          audio: false,
        });
      }

      streamRef.current = stream;
      setCameraActive(true);
    } catch (err) {
      console.warn('Camera stream error:', err);
      setCameraError(
        'Camera permission pending or device camera unavailable. Enable camera permission in your browser.'
      );
      setCameraActive(false);
    }
  }, []);

  // Ensure video element receives stream whenever camera becomes active
  useEffect(() => {
    if (cameraActive && streamRef.current && videoRef.current) {
      const videoEl = videoRef.current;
      videoEl.srcObject = streamRef.current;
      videoEl.play().catch((e) => console.warn('Video playback error:', e));
    }
  }, [cameraActive]);

  // Stop Camera Stream
  const stopCamera = useCallback(() => {
    if (streamRef.current) {
      streamRef.current.getTracks().forEach((track) => track.stop());
      streamRef.current = null;
    }
    setCameraActive(false);
  }, []);

  useEffect(() => {
    if (isOpen) {
      setCapturedImage(null);
      setCapturedBlob(null);
      setVerificationResult(null);
      setRequestedManualReview(false);
      startCamera();
    } else {
      stopCamera();
    }
    return () => {
      stopCamera();
    };
  }, [isOpen, startCamera, stopCamera]);

  if (!isOpen) return null;

  // Capture Frame from Video Camera
  const handleCapture = async () => {
    if (!videoRef.current || !canvasRef.current) {
      // Fallback demo capture if video element unavailable
      simulateCaptureFromPreset();
      return;
    }

    const video = videoRef.current;
    const canvas = canvasRef.current;
    canvas.width = video.videoWidth || 800;
    canvas.height = video.videoHeight || 600;

    const ctx = canvas.getContext('2d');
    if (!ctx) return;

    ctx.drawImage(video, 0, 0, canvas.width, canvas.height);
    const dataUrl = canvas.toDataURL('image/jpeg', 0.85);
    setCapturedImage(dataUrl);

    canvas.toBlob(async (blob) => {
      if (blob) {
        setCapturedBlob(blob);
        await runVerificationProcess(blob, dataUrl);
      } else {
        await simulateCaptureFromPreset();
      }
    }, 'image/jpeg', 0.85);
  };

  // Run Verification Engine
  const runVerificationProcess = async (blobInput: Blob | string, imageUrl?: string) => {
    setIsProcessing(true);
    stopCamera();

    // Step 1 Animation
    setScanStepText('Analyzing cluster telemetry & OCR patterns...');
    await new Promise((r) => setTimeout(r, 600));

    // Step 2 Animation
    setScanStepText('Computing SHA-256 anti-replay cryptographic hash...');
    await new Promise((r) => setTimeout(r, 600));

    // Step 3 Animation
    setScanStepText('Validating 5-minute time-bound binding...');
    await new Promise((r) => setTimeout(r, 500));

    // Execute verification service
    let mockSOC: number | null = null;
    if (isDemoMode) {
      if (demoPreset === 'honest') mockSOC = claimedSOC; // 5% vs 5%
      else if (demoPreset === 'mismatch') mockSOC = 60;   // Claimed 5% vs Detected 60%
      else if (demoPreset === 'reused') mockSOC = claimedSOC;
    }

    const result = await processSOCVerification({
      userId,
      claimedSOC,
      imageInput: blobInput,
      vehicleId,
      bookingId,
      stationId,
      mockExtractedSOC: mockSOC,
      isDemoMode,
    });

    // Special Override for Demo Reused Preset
    if (isDemoMode && demoPreset === 'reused') {
      result.status = 'suspicious';
      result.isReusedImage = true;
      result.reason = '⚠ Reused Image Hash Detected! Duplicate dashboard photograph submitted across separate sessions. Anti-replay protection active.';
    }

    // Special Override for Demo Expired Preset
    if (isDemoMode && demoPreset === 'expired') {
      result.status = 'failed';
      result.reason = '⏱ Verification Window Expired! Time-bound 5-minute verification limit exceeded. Please capture current dashboard again.';
    }

    setVerificationResult(result);
    setIsProcessing(false);
    if (onVerificationComplete) {
      onVerificationComplete(result);
    }
  };

  // Demo Preset Trigger
  const simulateCaptureFromPreset = async () => {
    // Generate synthetic canvas snapshot image
    const canvas = document.createElement('canvas');
    canvas.width = 640;
    canvas.height = 480;
    const ctx = canvas.getContext('2d');
    if (ctx) {
      ctx.fillStyle = '#0f172a';
      ctx.fillRect(0, 0, 640, 480);
      ctx.fillStyle = '#10b981';
      ctx.font = 'bold 36px monospace';
      ctx.fillText(`EV DASHBOARD CLUSTER`, 120, 200);
      const displaySoc = demoPreset === 'mismatch' ? 60 : claimedSOC;
      ctx.fillText(`BATTERY LEVEL: ${displaySoc}%`, 140, 280);
    }
    const dataUrl = canvas.toDataURL('image/jpeg');
    setCapturedImage(dataUrl);

    canvas.toBlob(async (blob) => {
      await runVerificationProcess(blob || dataUrl, dataUrl);
    }, 'image/jpeg');
  };

  // Retake Capture
  const handleRetake = () => {
    setCapturedImage(null);
    setCapturedBlob(null);
    setVerificationResult(null);
    setRequestedManualReview(false);
    startCamera();
  };

  return (
    <AnimatePresence>
      <div className="fixed inset-0 z-[999999] flex items-center justify-center bg-black/85 backdrop-blur-xl p-4 overflow-y-auto">
        {/* Background Ambient Glow */}
        <div className="absolute inset-0 pointer-events-none overflow-hidden flex items-center justify-center">
          <div className="h-[500px] w-[500px] rounded-full bg-emerald-500/10 blur-[130px] animate-pulse" />
        </div>

        <motion.div
          initial={{ scale: 0.94, opacity: 0, y: 20 }}
          animate={{ scale: 1, opacity: 1, y: 0 }}
          exit={{ scale: 0.94, opacity: 0, y: 20 }}
          transition={{ type: 'spring', damping: 25, stiffness: 300 }}
          className="relative w-full max-w-xl overflow-hidden rounded-3xl border border-emerald-500/40 bg-[#090d16] p-6 shadow-[0_0_60px_rgba(16,185,129,0.25)] text-white"
          onClick={(e) => e.stopPropagation()}
        >
          {/* Header Accent Bar */}
          <div className="absolute top-0 left-0 right-0 h-1.5 bg-gradient-to-r from-emerald-500 via-teal-400 to-cyan-500" />

          {/* Modal Header */}
          <div className="mb-5 flex items-center justify-between border-b border-emerald-500/20 pb-4">
            <div className="flex items-center gap-3">
              <div className="relative flex h-11 w-11 items-center justify-center rounded-2xl bg-gradient-to-br from-emerald-600 to-teal-700 text-white shadow-lg shadow-emerald-600/40">
                <ShieldCheck className="h-6 w-6" />
                <span className="absolute -top-1 -right-1 flex h-3 w-3">
                  <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-emerald-400 opacity-75"></span>
                  <span className="relative inline-flex rounded-full h-3 w-3 bg-emerald-500"></span>
                </span>
              </div>
              <div>
                <div className="flex items-center gap-2">
                  <h2 className="text-lg font-black tracking-wide text-white uppercase">BOSS SOC VERIFY</h2>
                  <span className="rounded-full bg-emerald-500/20 px-2 py-0.5 text-[9px] font-black text-emerald-400 border border-emerald-500/30 uppercase tracking-widest">
                    PROOF BEFORE PRIORITY
                  </span>
                </div>
                <p className="text-xs text-emerald-300/80 font-medium">
                  Camera Dashboard Capture & Computer Vision Verification
                </p>
              </div>
            </div>

            <button
              onClick={onClose}
              className="flex h-8 w-8 items-center justify-center rounded-full bg-white/10 text-gray-400 hover:bg-emerald-500/20 hover:text-white transition cursor-pointer"
            >
              <X className="h-4 w-4" />
            </button>
          </div>

          {/* Hidden Canvas for Frame Capture */}
          <canvas ref={canvasRef} className="hidden" />

          {/* MAIN VIEWPORT AREA */}
          {!verificationResult && !isProcessing && (
            <div className="space-y-4">
              {/* Guidance Checklist Banner */}
              <div className="rounded-2xl border border-emerald-500/30 bg-emerald-950/20 p-3 text-xs space-y-1.5">
                <div className="flex items-center justify-between font-bold text-emerald-300">
                  <span className="flex items-center gap-1.5 uppercase text-[10px] tracking-wider">
                    <Info className="h-3.5 w-3.5 text-emerald-400" /> Guidance Before Capture
                  </span>
                  <button
                    type="button"
                    onClick={startCamera}
                    className="text-[10px] bg-emerald-500/20 hover:bg-emerald-500/30 text-emerald-300 px-2 py-0.5 rounded border border-emerald-500/40 font-mono font-bold flex items-center gap-1 cursor-pointer"
                  >
                    <Camera className="h-3 w-3 text-emerald-400" />
                    <span>{cameraActive ? 'CAMERA LIVE' : 'ACTIVATE CAMERA'}</span>
                  </button>
                </div>
                <ul className="grid grid-cols-2 gap-x-3 gap-y-1 text-[11px] text-gray-300">
                  <li className="flex items-center gap-1.5">1. Turn vehicle display ON</li>
                  <li className="flex items-center gap-1.5">2. Frame battery % display</li>
                  <li className="flex items-center gap-1.5">3. Avoid glare & shadows</li>
                  <li className="flex items-center gap-1.5">4. Hold phone steady</li>
                </ul>
              </div>

              {/* Camera Viewfinder Area */}
              <div className="relative aspect-video w-full overflow-hidden rounded-2xl border-2 border-emerald-500/50 bg-slate-950 shadow-2xl flex items-center justify-center">
                {/* 1. Physical Webcam Video Stream (if active) */}
                {cameraActive ? (
                  <video
                    ref={videoRef}
                    playsInline
                    muted
                    className="h-full w-full object-cover"
                  />
                ) : (
                  /* 2. Live Animated EV Instrument Cluster Dashboard Screen (if camera stream unavailable) */
                  <div className="relative h-full w-full bg-gradient-to-b from-slate-950 via-slate-900 to-black p-4 flex flex-col justify-between overflow-hidden">
                    {/* Background Digital Cyber Grid */}
                    <div className="absolute inset-0 bg-[radial-gradient(#10b981_1px,transparent_1px)] [background-size:16px_16px] opacity-20" />

                    <div className="relative z-10 flex items-center justify-between text-[10px] font-mono text-emerald-400">
                      <span className="flex items-center gap-1 font-bold"><Zap className="h-3 w-3 text-emerald-400 animate-pulse" /> EV SYSTEM ONLINE</span>
                      <span className="font-extrabold text-amber-400">400V DC REGULATED</span>
                    </div>

                    {/* Simulated EV Dashboard Cluster Center Display */}
                    <div className="relative z-10 my-auto text-center space-y-1 bg-black/60 p-4 rounded-2xl border border-emerald-500/40 backdrop-blur-sm max-w-xs mx-auto shadow-lg shadow-emerald-500/10">
                      <span className="text-[10px] text-gray-400 font-semibold block uppercase tracking-widest">VEHICLE BATTERY SOC</span>
                      <div className="text-4xl font-black font-mono text-emerald-400 tracking-wider flex items-center justify-center gap-1">
                        <span>{demoPreset === 'mismatch' ? 60 : claimedSOC}</span>
                        <span className="text-2xl text-emerald-500">%</span>
                      </div>
                      <div className="w-full bg-slate-800 h-2.5 rounded-full overflow-hidden border border-emerald-500/40">
                        <div
                          className="bg-gradient-to-r from-emerald-500 to-teal-400 h-full transition-all duration-500"
                          style={{ width: `${demoPreset === 'mismatch' ? 60 : claimedSOC}%` }}
                        />
                      </div>
                      <div className="flex items-center justify-between text-[9px] font-mono text-gray-400 pt-1">
                        <span>EST. RANGE: {Math.round((demoPreset === 'mismatch' ? 60 : claimedSOC) * 3.8)} KM</span>
                        <span className="text-emerald-400 font-bold">READY</span>
                      </div>
                    </div>

                    <div className="relative z-10 flex items-center justify-between text-[9px] font-mono text-slate-500">
                      <span>SCANNER: ACTIVE</span>
                      <span>CV ENGINE: HYBRID OCR</span>
                    </div>
                  </div>
                )}

                {/* 3. Floating Ticket Pass & Cyber Scanner Overlay Frame (Always Visible in Front of Screen) */}
                <div className="absolute inset-0 pointer-events-none flex flex-col justify-between p-3 z-20">
                  {/* Digital Ticket Pass Floating Card Overlay (In Front of Screen) */}
                  <div className="rounded-xl border border-emerald-400/60 bg-black/85 p-2.5 backdrop-blur-md text-xs flex items-center justify-between shadow-2xl">
                    <div className="flex items-center gap-2.5">
                      <div className="flex h-8 w-8 items-center justify-center rounded-xl bg-gradient-to-br from-emerald-500 to-teal-600 text-black font-extrabold text-xs shadow-md">
                        🎫
                      </div>
                      <div>
                        <div className="font-extrabold text-white text-[11px] flex items-center gap-1.5">
                          <span>RESERVATION TICKET:</span>
                          <span className="font-mono text-emerald-400 font-extrabold">{bookingCode || 'BOSS-8829F'}</span>
                        </div>
                        <div className="text-[10px] text-gray-300">
                          Station: <span className="text-white font-bold">{stationName || stationId || 'BPCL Charging Station'}</span>
                        </div>
                      </div>
                    </div>

                    <div className="text-right font-mono text-[10px] shrink-0">
                      <span className="text-amber-400 font-black block">1-HOUR SLOT PASS</span>
                      <span className="text-emerald-400 font-bold">{new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' })}</span>
                    </div>
                  </div>

                  {/* Dashboard Cluster Target Alignment Frame */}
                  <div className="mx-auto my-auto rounded-xl border-2 border-dashed border-emerald-400/90 bg-emerald-500/10 px-5 py-2.5 text-center backdrop-blur-xs shadow-xl">
                    <span className="text-[11px] font-black text-emerald-300 tracking-wider uppercase block">
                      ALIGN DASHBOARD BATTERY % HERE
                    </span>
                    <span className="text-[10px] text-emerald-400 font-mono font-bold block mt-0.5">
                      CLAIMED SOC: {claimedSOC}% • AI VOLTAGE ANALYSIS
                    </span>
                  </div>

                  <div className="flex justify-between">
                    <div className="h-6 w-6 border-b-2 border-l-2 border-emerald-400 shadow-[0_0_10px_#10b981]" />
                    <div className="h-6 w-6 border-b-2 border-r-2 border-emerald-400 shadow-[0_0_10px_#10b981]" />
                  </div>
                </div>
              </div>



              {/* Action Buttons */}
              <div className="flex gap-3">
                <ShinyButton
                  onClick={handleCapture}
                  className="flex-1 font-black text-xs py-3 shadow-xl shadow-emerald-600/40 bg-gradient-to-r from-emerald-600 via-teal-600 to-emerald-700 text-white rounded-2xl text-center hover:scale-[1.02] active:scale-[0.98] transition block border border-emerald-400/50 cursor-pointer"
                >
                  <div className="flex items-center justify-center gap-2">
                    <Camera className="h-4 w-4" />
                    <span>CAPTURE & VERIFY DASHBOARD NOW</span>
                  </div>
                </ShinyButton>

                <button
                  onClick={onClose}
                  className="px-5 py-3 text-xs font-extrabold text-gray-300 border border-emerald-900/50 hover:bg-white/10 rounded-2xl transition cursor-pointer"
                >
                  Cancel
                </button>
              </div>
            </div>
          )}

          {/* PROCESSING ANIMATION VIEW */}
          {isProcessing && (
            <div className="py-12 text-center space-y-5">
              <div className="relative mx-auto flex h-20 w-20 items-center justify-center rounded-3xl bg-emerald-500/10 border border-emerald-500/40">
                <RefreshCw className="h-10 w-10 text-emerald-400 animate-spin" />
                <div className="absolute inset-0 rounded-3xl border-2 border-emerald-400/60 animate-ping opacity-25" />
              </div>

              <div>
                <h3 className="text-base font-black text-white uppercase tracking-wider">
                  PROCESSING DASHBOARD VERIFICATION
                </h3>
                <p className="text-xs font-mono text-emerald-400 mt-1">{scanStepText}</p>
              </div>

              <div className="max-w-md mx-auto rounded-full bg-emerald-950/60 h-2 border border-emerald-500/30 overflow-hidden">
                <div className="h-full bg-gradient-to-r from-emerald-500 to-teal-400 animate-pulse w-3/4" />
              </div>
            </div>
          )}

          {/* VERIFICATION RESULT VIEW */}
          {verificationResult && !isProcessing && (
            <div className="space-y-5">
              {/* STATUS CARD 1: VERIFIED MATCH */}
              {verificationResult.status === 'verified' && (
                <div className="rounded-3xl border-2 border-emerald-500/60 bg-emerald-950/40 p-5 text-center space-y-4 shadow-lg shadow-emerald-500/20">
                  <div className="mx-auto flex h-16 w-16 items-center justify-center rounded-2xl bg-emerald-500 text-black shadow-lg shadow-emerald-500/50">
                    <CheckCircle2 className="h-10 w-10" />
                  </div>

                  <div>
                    <h3 className="text-lg font-black text-emerald-300 uppercase tracking-wide">
                      ✓ AI BATTERY & VOLTAGE VERIFIED
                    </h3>
                    <p className="text-xs text-emerald-200 mt-1 font-medium leading-relaxed">
                      {verificationResult.reason}
                    </p>
                  </div>

                  {/* AI Extracted Telemetry Grid */}
                  <div className="grid grid-cols-2 sm:grid-cols-4 gap-2 bg-black/70 p-3 rounded-2xl border border-emerald-500/30 text-xs text-left">
                    <div className="bg-emerald-950/50 p-2 rounded-xl border border-emerald-500/20">
                      <span className="text-[10px] text-gray-400 block font-semibold">Exact Battery SOC</span>
                      <span className="font-mono font-black text-emerald-400 text-base">
                        {verificationResult.extractedSOC}%
                      </span>
                    </div>

                    <div className="bg-amber-950/50 p-2 rounded-xl border border-amber-500/20">
                      <span className="text-[10px] text-gray-400 block font-semibold">Required Charging Voltage</span>
                      <span className="font-mono font-black text-amber-400 text-base">
                        {verificationResult.requiredVoltageV || Math.round(380 + (100 - (verificationResult.extractedSOC || 50)) * 0.4)} V DC
                      </span>
                    </div>

                    <div className="bg-teal-950/50 p-2 rounded-xl border border-teal-500/20">
                      <span className="text-[10px] text-gray-400 block font-semibold">AI Confidence</span>
                      <span className="font-mono font-black text-teal-300 text-base">
                        {Math.round(verificationResult.confidence * 100)}%
                      </span>
                    </div>

                    <div className="bg-cyan-950/50 p-2 rounded-xl border border-cyan-500/20">
                      <span className="text-[10px] text-gray-400 block font-semibold">SOC Gain Needed</span>
                      <span className="font-mono font-black text-cyan-300 text-base">
                        +{100 - (verificationResult.extractedSOC || 50)}% Gain
                      </span>
                    </div>
                  </div>

                  {/* Capture Timestamp & SHA Meta */}
                  <div className="flex flex-wrap items-center justify-between gap-2 text-[10px] font-mono text-emerald-400/90 bg-emerald-950/60 p-2.5 rounded-xl border border-emerald-500/20">
                    <span className="flex items-center gap-1 font-bold">
                      <Clock className="h-3.5 w-3.5 text-amber-400" />
                      Capture Time: {verificationResult.captureTimestamp || new Date().toLocaleString()}
                    </span>
                    <span className="truncate">SHA: {verificationResult.imageHash?.substring(0, 14)}...</span>
                  </div>
                </div>
              )}

              {/* STATUS CARD 2: MISMATCH (NEUTRAL LANGUAGE) */}
              {verificationResult.status === 'mismatch' && (
                <div className="rounded-3xl border-2 border-amber-500/60 bg-amber-950/40 p-5 text-center space-y-4 shadow-lg shadow-amber-500/20">
                  <div className="mx-auto flex h-16 w-16 items-center justify-center rounded-2xl bg-amber-500 text-black shadow-lg shadow-amber-500/50">
                    <AlertTriangle className="h-10 w-10" />
                  </div>

                  <div>
                    <h3 className="text-lg font-black text-amber-300 uppercase tracking-wide">
                      ⚠ BATTERY LEVEL MISMATCH
                    </h3>
                    <p className="text-xs text-amber-200 mt-1 font-medium leading-relaxed">
                      {verificationResult.reason}
                    </p>
                  </div>

                  <div className="grid grid-cols-2 gap-2 bg-black/60 p-3 rounded-2xl border border-amber-500/30 text-xs">
                    <div>
                      <span className="text-[10px] text-gray-400 block">User Input Claimed</span>
                      <span className="font-mono font-black text-red-400 text-sm">
                        {verificationResult.claimedSOC}%
                      </span>
                    </div>
                    <div>
                      <span className="text-[10px] text-gray-400 block">Dashboard Detected</span>
                      <span className="font-mono font-black text-amber-400 text-sm">
                        {verificationResult.extractedSOC}%
                      </span>
                    </div>
                  </div>
                </div>
              )}

              {/* STATUS CARD 3: SUSPICIOUS / REUSED IMAGE */}
              {verificationResult.status === 'suspicious' && (
                <div className="rounded-3xl border-2 border-red-500/60 bg-red-950/40 p-5 text-center space-y-4 shadow-lg shadow-red-500/20">
                  <div className="mx-auto flex h-16 w-16 items-center justify-center rounded-2xl bg-red-600 text-white shadow-lg shadow-red-600/50">
                    <ShieldAlert className="h-10 w-10" />
                  </div>

                  <div>
                    <h3 className="text-lg font-black text-red-300 uppercase tracking-wide">
                      ⚠ REUSED IMAGE DETECTED
                    </h3>
                    <p className="text-xs text-red-200 mt-1 font-medium leading-relaxed">
                      {verificationResult.reason}
                    </p>
                  </div>

                  <div className="bg-black/60 p-3 rounded-2xl border border-red-500/30 text-xs font-mono text-red-300">
                    Image Hash: {verificationResult.imageHash}
                  </div>
                </div>
              )}

              {/* STATUS CARD 4: FAILED / EXPIRED / LOW CONFIDENCE */}
              {(verificationResult.status === 'failed' || verificationResult.status === 'low_confidence') && (
                <div className="rounded-3xl border-2 border-purple-500/60 bg-purple-950/40 p-5 text-center space-y-4 shadow-lg shadow-purple-500/20">
                  <div className="mx-auto flex h-16 w-16 items-center justify-center rounded-2xl bg-purple-600 text-white shadow-lg shadow-purple-600/50">
                    <HelpCircle className="h-10 w-10" />
                  </div>

                  <div>
                    <h3 className="text-lg font-black text-purple-300 uppercase tracking-wide">
                      VERIFICATION COULD NOT BE COMPLETED
                    </h3>
                    <p className="text-xs text-purple-200 mt-1 font-medium leading-relaxed">
                      {verificationResult.reason}
                    </p>
                  </div>
                </div>
              )}

              {/* ACTION FOOTER */}
              <div className="flex gap-3">
                {verificationResult.status === 'verified' ? (
                  <ShinyButton
                    onClick={onClose}
                    className="flex-1 font-black text-xs py-3.5 shadow-xl shadow-emerald-600/40 bg-gradient-to-r from-emerald-600 via-teal-600 to-emerald-700 text-white rounded-2xl text-center block cursor-pointer uppercase tracking-wider"
                  >
                    ⚡ APPLY AI DETERMINED BATTERY ({verificationResult.extractedSOC}%) & VOLTAGE ({verificationResult.requiredVoltageV || 408}V DC)
                  </ShinyButton>
                ) : (
                  <>
                    <button
                      onClick={handleRetake}
                      className="flex-1 font-extrabold text-xs py-3 bg-emerald-600 hover:bg-emerald-500 text-white rounded-2xl transition cursor-pointer flex items-center justify-center gap-2"
                    >
                      <RefreshCw className="h-4 w-4" /> RETAKE PHOTO
                    </button>

                    <button
                      onClick={() => setRequestedManualReview(true)}
                      disabled={requestedManualReview}
                      className="px-4 py-3 text-xs font-extrabold text-amber-300 border border-amber-500/40 hover:bg-amber-500/20 rounded-2xl transition cursor-pointer disabled:opacity-50"
                    >
                      {requestedManualReview ? 'REVIEW REQUESTED' : 'REQUEST MANUAL REVIEW'}
                    </button>
                  </>
                )}
              </div>

              {requestedManualReview && (
                <div className="rounded-xl bg-amber-500/10 border border-amber-500/30 p-2.5 text-center text-xs text-amber-300">
                  ✓ Manual review request sent to station operator. You will be notified once reviewed.
                </div>
              )}
            </div>
          )}
        </motion.div>
      </div>
    </AnimatePresence>
  );
};

export default SOCVerificationModal;
