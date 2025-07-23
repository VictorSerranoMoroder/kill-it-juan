#!/bin/bash

SOUND="/usr/local/share/juankill/matala_juan.wav"

# Function: show usage
usage() {
    echo "Usage: juankill <signal> <pid>"
    exit 1
}

# Check argument count
if [[ $# -ne 2 ]]; then
    usage
fi

SIGNAL="$1"
TARGET="$2"

# Check if signal format is coherent, accepts both -9 and -TERM
if ! [[ "$SIGNAL" =~ ^-[0-9]+$ || "$SIGNAL" =~ ^-[A-Z]+$ ]]; then
    echo "Parameter error: Invalid signal format '$SIGNAL'"
    usage
fi

# Check if PID is a number
if [[ "$PROCESS" =~ ^[0-9]+$ ]]; then
    # Check if PID exists
    if kill -0 "$PID" 2>/dev/null; then
        paplay $SOUND &
        sudo kill "$SIGNAL" "$TARGET"
    else
        echo "Process $TARGET does not exist."
    fi
else
    # Check if the process exists
    if pgrep -x "$TARGET" >/dev/null; then
        paplay $SOUND &
        sudo pkill "$SIGNAL" -x "$TARGET"
    else
        echo "No running process found with name: $TARGET"
    fi
fi

