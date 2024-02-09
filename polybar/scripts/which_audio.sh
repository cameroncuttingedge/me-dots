#!/bin/bash

# Source the environment variables
source ~/.config/audio_env.env

# Get the current default sink
CURRENT_SINK=$(pactl get-default-sink)

# Define your icons
HEADPHONES_ICON="󰥰"
SPEAKERS_ICON="󰦢"

if [ "$CURRENT_SINK" == "$SINK1" ]; then
    echo "$HEADPHONES_ICON"
elif [ "$CURRENT_SINK" == "$SINK2" ]; then
    echo "$SPEAKERS_ICON"
else
    echo "Unknown"
fi

