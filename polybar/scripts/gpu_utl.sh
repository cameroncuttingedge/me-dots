#!/bin/bash

# Path to the radeontop binary
RADEONTOP_BIN=$(which radeontop)

# Check if radeontop is installed
if [ -z "$RADEONTOP_BIN" ]; then
    echo "radeontop is not installed"
    exit 1
fi

# Get the GPU utilization
GPU_UTILIZATION=$($RADEONTOP_BIN -d - -l 1 2>/dev/null | grep -oP 'gpu \K[0-9\.]+')

# Check if we got the GPU utilization
if [ -n "$GPU_UTILIZATION" ]; then
    echo "$GPU_UTILIZATION%"
else
    echo "Unavailable"
fi

