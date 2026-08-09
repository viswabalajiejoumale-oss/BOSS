/**
 * BOSS SOC VERIFY — Anti-Fraud & Verification Service Layer
 * 
 * Provides cryptographic SHA-256 hashing, anti-replay image duplicate detection,
 * 5-minute time-bound validity binding, and claimed vs verified SOC decision logic.
 */

import { supabase } from '@/lib/supabase';
import type { SOCVerificationResult, EVSOCVerification, SOCVerificationStatus } from '@/types';
import { extractSOCFromDashboard } from '@/lib/socOcrEngine';

export interface VerifySOCParams {
  userId: string;
  claimedSOC: number;
  imageInput: Blob | File | string;
  vehicleId?: string;
  bookingId?: string;
  stationId?: string;
  mockExtractedSOC?: number | null; // For Hackathon Demo Mode testing
  isDemoMode?: boolean;
}

/**
 * Generate cryptographic SHA-256 hash of an image Blob or File using Web Crypto API
 */
export async function generateImageHash(imageInput: Blob | File | string): Promise<string> {
  try {
    let arrayBuffer: ArrayBuffer;

    if (typeof imageInput === 'string') {
      // Encode string URL/data
      const encoder = new TextEncoder();
      arrayBuffer = encoder.encode(imageInput).buffer;
    } else {
      arrayBuffer = await imageInput.arrayBuffer();
    }

    const hashBuffer = await crypto.subtle.digest('SHA-256', arrayBuffer);
    const hashArray = Array.from(new Uint8Array(hashBuffer));
    const hashHex = hashArray.map((b) => b.toString(16).padStart(2, '0')).join('');
    return hashHex;
  } catch (err) {
    console.error('SHA-256 Hash generation error:', err);
    // Fallback hash based on length and timestamp
    return `hash_${Date.now()}_${Math.random().toString(36).substring(2, 9)}`;
  }
}

/**
 * Check if image hash has been submitted previously (Anti-Replay Protection)
 */
export async function checkDuplicateImageHash(
  userId: string,
  imageHash: string
): Promise<boolean> {
  const LOCAL_CACHE_KEY = `boss_soc_hashes_${userId}`;
  try {
    // 1. Check local storage cache
    const cached = localStorage.getItem(LOCAL_CACHE_KEY);
    const hashList: string[] = cached ? JSON.parse(cached) : [];
    if (hashList.includes(imageHash)) {
      return true;
    }

    // 2. Query Supabase database
    const { data } = await supabase
      .from('ev_soc_verifications')
      .select('id')
      .eq('image_hash', imageHash)
      .limit(1);

    if (data && data.length > 0) {
      return true;
    }
  } catch {
    // Ignore db offline error
  }
  return false;
}

/**
 * Save hash to local cache
 */
function cacheImageHash(userId: string, imageHash: string): void {
  const LOCAL_CACHE_KEY = `boss_soc_hashes_${userId}`;
  try {
    const cached = localStorage.getItem(LOCAL_CACHE_KEY);
    const hashList: string[] = cached ? JSON.parse(cached) : [];
    if (!hashList.includes(imageHash)) {
      hashList.push(imageHash);
      localStorage.setItem(LOCAL_CACHE_KEY, JSON.stringify(hashList));
    }
  } catch {
    // Ignore quota errors
  }
}

/**
 * Main Verification Workflow: Process dashboard image, extract SOC, validate claimed vs extracted,
 * check anti-replay hash, bind to user/vehicle/booking/station, and persist verification.
 */
export async function processSOCVerification(
  params: VerifySOCParams
): Promise<SOCVerificationResult> {
  const {
    userId,
    claimedSOC,
    imageInput,
    vehicleId,
    bookingId,
    stationId,
    mockExtractedSOC,
    isDemoMode = false,
  } = params;

  const now = new Date();
  const expiresAtDate = new Date(now.getTime() + 5 * 60 * 1000); // 5-Minute TTL Expiry
  const verifiedAtIso = now.toISOString();
  const expiresAtIso = expiresAtDate.toISOString();

  // 1. Compute SHA-256 cryptographic image hash
  const imageHash = await generateImageHash(imageInput);

  // 2. Check Anti-Replay Duplicate Image Hash
  const isReusedImage = await checkDuplicateImageHash(userId, imageHash);
  if (isReusedImage && !isDemoMode) {
    const result: SOCVerificationResult = {
      extractedSOC: null,
      claimedSOC,
      confidence: 0,
      status: 'suspicious',
      reason: '⚠ Reused Image Detected! The exact same dashboard image hash was previously submitted. Anti-replay protection active.',
      imageHash,
      verifiedAt: verifiedAtIso,
      expiresAt: expiresAtIso,
      isReusedImage: true,
    };
    await recordVerificationInDatabase(userId, params, result, imageHash);
    return result;
  }

  // Cache new hash
  cacheImageHash(userId, imageHash);

  // 3. Perform OCR Extraction (or use explicit mock result if in Demo Mode)
  let extractedSOC: number | null = null;
  let ocrConfidence = 0.96;
  let ocrReason = '';

  if (mockExtractedSOC !== undefined && mockExtractedSOC !== null) {
    extractedSOC = mockExtractedSOC;
    ocrConfidence = 0.96;
    ocrReason = `Dashboard scan detected ${extractedSOC}% SOC on instrument cluster.`;
  } else {
    const ocrResult = await extractSOCFromDashboard(imageInput, claimedSOC);
    extractedSOC = ocrResult.extractedSOC;
    ocrConfidence = ocrResult.confidence;
    ocrReason = ocrResult.rawText;
  }

  // 4. Decision Logic: Compare Claimed SOC vs Verified SOC
  let status: SOCVerificationStatus = 'failed';
  let reason = '';

  if (extractedSOC === null) {
    status = 'low_confidence';
    reason = '⚠ Battery percentage could not be read clearly from the dashboard image. Please ensure the cluster display is lit and retake photo.';
  } else {
    const difference = Math.abs(claimedSOC - extractedSOC);

    if (difference <= 3) {
      // MATCH
      status = 'verified';
      reason = `✓ SOC Verified! Dashboard reading matches claimed ${claimedSOC}% battery level (Extracted: ${extractedSOC}%). Emergency priority granted.`;
    } else {
      // MISMATCH
      status = 'mismatch';
      reason = `⚠ Battery Level Mismatch: Your dashboard image shows approximately ${extractedSOC}%, but you entered ${claimedSOC}%. Emergency priority requires verified low battery.`;
    }
  }

  const effectiveSOC = extractedSOC !== null ? extractedSOC : claimedSOC;
  const requiredVoltageV = Math.round(380 + (100 - effectiveSOC) * 0.4);
  const captureTimestamp = new Date().toLocaleString([], {
    dateStyle: 'medium',
    timeStyle: 'medium',
  });

  const result: SOCVerificationResult = {
    extractedSOC,
    claimedSOC,
    confidence: ocrConfidence,
    status,
    reason,
    imageHash,
    verifiedAt: verifiedAtIso,
    expiresAt: expiresAtIso,
    isReusedImage: false,
    requiredVoltageV,
    captureTimestamp,
  };

  // 5. Persist verification audit record to Supabase & Local History
  const verificationId = await recordVerificationInDatabase(userId, params, result, imageHash);
  result.verificationId = verificationId;

  return result;
}

/**
 * Save SOC Verification Audit Record to Supabase DB & Local Backup
 */
async function recordVerificationInDatabase(
  userId: string,
  params: VerifySOCParams,
  result: SOCVerificationResult,
  imageHash: string
): Promise<string> {
  const verificationRecord = {
    id: `soc_v_${Date.now()}_${Math.random().toString(36).substring(2, 7)}`,
    user_id: userId,
    vehicle_id: params.vehicleId || 'EV_MAIN_VEHICLE',
    booking_id: params.bookingId || null,
    station_id: params.stationId || null,
    claimed_soc: params.claimedSOC,
    verified_soc: result.extractedSOC,
    ocr_confidence: result.confidence,
    verification_status: result.status,
    image_hash: imageHash,
    captured_at: new Date().toISOString(),
    verified_at: result.verifiedAt || new Date().toISOString(),
    expires_at: result.expiresAt || new Date(Date.now() + 5 * 60 * 1000).toISOString(),
    is_reused_image: result.isReusedImage || false,
    failure_reason: result.status !== 'verified' ? result.reason : null,
    created_at: new Date().toISOString(),
  };

  // Save to Local Storage Backup
  const LOCAL_STORAGE_KEY = `boss_user_soc_verifications_${userId}`;
  try {
    const existing = localStorage.getItem(LOCAL_STORAGE_KEY);
    let list: EVSOCVerification[] = existing ? JSON.parse(existing) : [];
    list = [verificationRecord as EVSOCVerification, ...list];
    localStorage.setItem(LOCAL_STORAGE_KEY, JSON.stringify(list));
  } catch {
    // Ignore quota errors
  }

  // Save to Supabase Table
  try {
    const { data } = await supabase
      .from('ev_soc_verifications')
      .insert({
        user_id: userId,
        vehicle_id: params.vehicleId || null,
        booking_id: params.bookingId || null,
        station_id: params.stationId || null,
        claimed_soc: params.claimedSOC,
        verified_soc: result.extractedSOC,
        ocr_confidence: result.confidence,
        verification_status: result.status,
        image_hash: imageHash,
        captured_at: new Date().toISOString(),
        verified_at: result.verifiedAt || new Date().toISOString(),
        expires_at: result.expiresAt || new Date(Date.now() + 5 * 60 * 1000).toISOString(),
        is_reused_image: result.isReusedImage || false,
        failure_reason: result.status !== 'verified' ? result.reason : null,
      })
      .select('id')
      .single();

    if (data?.id) {
      return data.id;
    }
  } catch (err) {
    console.warn('Supabase DB verification insert fallback:', err);
  }

  return verificationRecord.id;
}

/**
 * Retrieve User Verification History
 */
export async function getUserSOCVerifications(userId: string): Promise<EVSOCVerification[]> {
  const LOCAL_STORAGE_KEY = `boss_user_soc_verifications_${userId}`;

  try {
    const { data } = await supabase
      .from('ev_soc_verifications')
      .select('*')
      .eq('user_id', userId)
      .order('created_at', { ascending: false });

    if (data && data.length > 0) {
      localStorage.setItem(LOCAL_STORAGE_KEY, JSON.stringify(data));
      return data as EVSOCVerification[];
    }
  } catch {
    // Fallback
  }

  const cached = localStorage.getItem(LOCAL_STORAGE_KEY);
  if (cached) {
    try {
      return JSON.parse(cached);
    } catch {
      return [];
    }
  }

  return [];
}

/**
 * Retrieve Admin SOC Verification Monitor Audit Records
 */
export async function getAdminSOCVerifications(adminId: string): Promise<EVSOCVerification[]> {
  try {
    const { data } = await supabase
      .from('ev_soc_verifications')
      .select('*')
      .order('created_at', { ascending: false })
      .limit(50);

    if (data && data.length > 0) {
      return data as EVSOCVerification[];
    }
  } catch {
    // Fallback
  }

  // Search localStorage backup across all users
  const allLogs: EVSOCVerification[] = [];
  try {
    for (let i = 0; i < localStorage.length; i++) {
      const key = localStorage.key(i);
      if (key && key.startsWith('boss_user_soc_verifications_')) {
        const item = localStorage.getItem(key);
        if (item) {
          const list: EVSOCVerification[] = JSON.parse(item);
          allLogs.push(...list);
        }
      }
    }
  } catch {
    // Ignore
  }

  // Deduplicate and sort
  const map = new Map<string, EVSOCVerification>();
  allLogs.forEach((l) => map.set(l.id, l));
  return Array.from(map.values()).sort(
    (a, b) => new Date(b.created_at).getTime() - new Date(a.created_at).getTime()
  );
}

/**
 * Update Verification Status by Admin (Manual Review Approval/Rejection)
 */
export async function updateSOCVerificationStatusByAdmin(
  verificationId: string,
  newStatus: SOCVerificationStatus,
  reason?: string
): Promise<boolean> {
  try {
    const { error } = await supabase
      .from('ev_soc_verifications')
      .update({
        verification_status: newStatus,
        failure_reason: reason || null,
      })
      .eq('id', verificationId);

    if (!error) return true;
  } catch {
    // Fallback
  }

  // Update in localStorage
  try {
    for (let i = 0; i < localStorage.length; i++) {
      const key = localStorage.key(i);
      if (key && key.startsWith('boss_user_soc_verifications_')) {
        const item = localStorage.getItem(key);
        if (item) {
          const list: EVSOCVerification[] = JSON.parse(item);
          const updated = list.map((v) =>
            v.id === verificationId
              ? { ...v, verification_status: newStatus, failure_reason: reason }
              : v
          );
          localStorage.setItem(key, JSON.stringify(updated));
        }
      }
    }
    return true;
  } catch {
    return false;
  }
}
