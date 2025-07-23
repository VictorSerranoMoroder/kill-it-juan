#!/bin/bash

PID=$2
SIGNAL=$1
SOUND="/usr/local/share/juankill/matala_juan.wav"

# Check if PID exists
if [[ -z "$SIGNAL" ]]; then
    echo "Usage: juankill <signal> <pid>"
    exit 1
fi

# Check if PID exists
if [[ -z "$PID" ]]; then
    echo "Usage: juankill <signal> <pid>"
    exit 1
fi

# Check if PID exists
if kill -0 "$PID" 2>/dev/null; then
    paplay $SOUND &
    sudo kill "$SIGNAL" "$PID"
else
    echo "Process $PID does not exist."
fi

