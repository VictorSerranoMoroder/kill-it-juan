#!/bin/bash

BIN_PATH="/usr/local/bin/juankill"
ASSET_DIR="/usr/local/share/juankill"
SCRIPT_SOURCE="src/juankill.sh"
ASSETS_SOURCE="assets/matala_juan.wav"

echo "[*] Installing juankill to $BIN_PATH"

# Check if paplay is installed
if ! command -v paplay >/dev/null 2>&1; then
    echo "Dependency error: 'paplay' command not found. Please install it first."
    exit 1
else 
    echo "[✓] Dependencies meet, proceeding to install"
fi

# Check source integrity
if [[ ! -f "$SCRIPT_SOURCE" ]]; then
    echo "Integrity error: Script file not found: $SCRIPT_SOURCE"
    exit 1
fi
if [[ ! -f "$ASSETS_SOURCE" ]]; then
    echo "Integrity error: Sound file not found: $ASSETS_SOURCE"
    exit 1
fi

# Create asset directory
sudo mkdir -p "$ASSET_DIR"

# Copy the sound and assigning needed permissions
sudo cp assets/matala_juan.wav "$ASSET_DIR/"
sudo chown root:root /usr/local/share/juankill/matala_juan.wav
sudo chmod 644 /usr/local/share/juankill/matala_juan.wav

if [[ -f "$BIN_PATH" ]]; then
    echo "[!] Existing version found, creating back up to ${BIN_PATH}.bak"
    sudo cp "$BIN_PATH" "${BIN_PATH}.bak"
fi

# Copy script and make it executable
sudo cp src/juankill.sh "$BIN_PATH"
sudo chmod +x "$BIN_PATH"

# Report on certain success
echo "[✓] Installed. Now you can run it using:"
echo "    juankill <signal> <pid>"