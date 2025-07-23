#!/bin/bash

BIN_PATH="/usr/local/bin/juankill"
ASSET_DIR="/usr/local/share/juankill"

echo "[*] Installing to $BIN_PATH and $ASSET_DIR..."

# Create target directory
sudo mkdir -p "$ASSET_DIR"

# Copy the sound and script
sudo cp assets/matala_juan.wav "$ASSET_DIR/"
sudo cp src/juankill.sh "$BIN_PATH"

# Make the script executable
sudo chmod +x "$BIN_PATH"

# Make the asset readable
sudo chown root:root /usr/local/share/juankill/matala_juan.wav
sudo chmod 644 /usr/local/share/juankill/matala_juan.wav

echo "[✓] Installed. Now you can run it using:"
echo "    juankill <pid>"