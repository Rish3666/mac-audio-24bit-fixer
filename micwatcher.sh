#!/usr/bin/env bash
set -euo pipefail

# === CONFIGURATION ===
HEADSET_NAME="soundcore Q20i"
MIC_NAME="MacBook Air Microphone"
SWITCH_CMD="/opt/homebrew/bin/SwitchAudioSource"
LOG_FILE=~/micwatcher.log

# === STARTUP LOG ===
echo "[INFO] Started micwatcher at $(date)" | tee -a "$LOG_FILE"

# === MAIN LOOP ===
while true; do
    TIMESTAMP=$(date)
    OUTPUT=$(system_profiler SPBluetoothDataType 2>/dev/null)

    # Check if output is empty
    if [ -z "$OUTPUT" ]; then
        echo "[$TIMESTAMP] [ERROR] system_profiler returned nothing" | tee -a "$LOG_FILE"
    fi

# If headset is connected
if echo "$OUTPUT" | grep -q "$HEADSET_NAME"; then
    echo "[$TIMESTAMP] [🎧] $HEADSET_NAME is connected" | tee -a "$LOG_FILE"
    $SWITCH_CMD -t input -s "$MIC_NAME" 2>&1 | tee -a "$LOG_FILE"
    echo "[$TIMESTAMP] [✅] Mic switched to $MIC_NAME" | tee -a "$LOG_FILE"
    else
        echo "[$TIMESTAMP] [❌] Headset not detected" | tee -a "$LOG_FILE"
    fi
    sleep 5
done
