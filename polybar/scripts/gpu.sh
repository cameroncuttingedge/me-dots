#!/bin/bash

# Identify the correct hwmon directory for the AMD GPU
# This can vary depending on the system and number of devices.
# The following command looks for a hwmon device associated with an AMD GPU.
gpu_temp_path=$(find /sys/class/drm/ -name "card*" | while read -r card; do
    if grep -q "amdgpu" "$card/device/uevent"; then
        hwmon_path=$(find "$card/device/hwmon/" -mindepth 1 -maxdepth 1 -type d)
        if [ ! -z "$hwmon_path" ]; then
            echo "$hwmon_path/temp1_input"
            break
        fi
    fi
done)

if [ -f "$gpu_temp_path" ]; then
    # Read the temperature
    temp_raw=$(cat "$gpu_temp_path")
    # Convert the temperature from millidegree Celsius to degree Celsius
    temp_c=$(echo "scale=1; $temp_raw / 1000" | bc)
    echo "$temp_c°C"
else
    echo "Unable to find AMD GPU temperature sensor."
fi
