#!/bin/bash

SIGNAL=$1
PID=$2
SOUND="/usr/local/share/juankill/matala_juan.wav"

# Function: show usage
usage() {
    echo "Usage: juankill <signal> <pid>"
    exit 1
}

# Validate arguments
if [[ -z "$SIGNAL" || -z "$PID" ]]; then
    usage
fi

# Check if signal format is coherent, accepts both -9 and -TERM
if ! [[ "$SIGNAL" =~ ^-[0-9]+$ || "$SIGNAL" =~ ^-[A-Z]+$ ]]; then
    echo "Parameter error: Invalid signal format '$SIGNAL'"
    usage
fi

# Check if PID is a number
if ! [[ "$PID" =~ ^[0-9]+$ ]]; then
    echo "Parameter error: PID must be a number"
    usage
fi

# Check if PID exists
if kill -0 "$PID" 2>/dev/null; then
    paplay $SOUND &
    sudo kill "$SIGNAL" "$PID"
else
    echo "Process $PID does not exist."
fi