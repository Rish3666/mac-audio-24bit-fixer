# mac-audio-24bit-fixer

Auto-switches macOS audio to 24‑bit stereo and sets a preferred mic when a Bluetooth headset connects. Uses SwitchAudioSource and system_profiler for detection and switching [1][2][3].

## Why

Some Bluetooth headsets default to lower-quality profiles (e.g., 16‑bit/hands‑free). This script watches for the headset and forces a preferred configuration automatically for consistent 24‑bit listening and correct mic selection.

## Requirements

- macOS with command line tools.
- SwitchAudioSource installed via Homebrew:
  - brew install switchaudio-osx.
- A Bluetooth headset paired in macOS; note the exact device name as shown by SwitchAudioSource -a.

## Install

- Clone or download this repo, then open a terminal in the repo root.
- Optional: make script executable after cloning:
  - git add --chmod=+x micwatcher.sh; git commit -m "chore: executable"; git push.

## Configure

Edit micwatcher.sh and set:
- HEADSET_NAME to the exact macOS device name of the headset (e.g., soundcore Q20i).
- MIC_NAME to the desired input device (e.g., MacBook Air Microphone).
- SWITCH_CMD path, typically /opt/homebrew/bin/SwitchAudioSource on Apple Silicon.

List devices to confirm names:
- /opt/homebrew/bin/SwitchAudioSource -a (all devices).

## Run

- Quick run:
  - bash micwatcher.sh.
- Or if marked executable:
  - ./micwatcher.sh.

The script logs to micwatcher.log and checks every 5 seconds; adjust sleep as needed.

## How it works

- Polls system_profiler SPBluetoothDataType for a matching headset name to detect connection state.
- Uses SwitchAudioSource to set output profile and switch input device reliably from the CLI.

## Troubleshooting

- If SwitchAudioSource isn’t found, ensure /opt/homebrew/bin is in PATH or set SWITCH_CMD to the full path.
- Use SwitchAudioSource -a to verify device names match exactly; spaces and case must match.
- If run from Finder, prefer launching via Terminal to see logs and errors.

## Download

- Direct download: Click Code → Download ZIP in GitHub, or use:
  - curl -L https://github.com/Rish3666/mac-audio-24bit-fixer/archive/refs/heads/main.zip

## License

MIT License. See LICENSE file .
