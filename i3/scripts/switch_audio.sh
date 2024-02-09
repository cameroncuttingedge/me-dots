#!/bin/bash

# Bluetooth device names
SINK1="bluez_output.00_0A_45_11_D9_BF.1"
SINK2="bluez_output.41_42_00_00_00_53.1"

# Determine which sink is currently the default
CURRENT_SINK=$(pactl get-default-sink)

# Toggle between the two sinks
if [ "$CURRENT_SINK" = "$SINK1" ]; then
  pactl set-default-sink "$SINK2"
  NEW_SINK="$SINK2"
elif [ "$CURRENT_SINK" = "$SINK2" ]; then
  pactl set-default-sink "$SINK1"
  NEW_SINK="$SINK1"
else
  echo "Neither sink is currently the default, setting SINK1 as default"
  pactl set-default-sink "$SINK1"
  NEW_SINK="$SINK1"
fi

# Move all currently playing audio streams to the new sink
pactl list short sink-inputs | cut -f1 | while read -r stream; do
  pactl move-sink-input "$stream" "$NEW_SINK"
done

echo "Switched audio output to $NEW_SINK."

