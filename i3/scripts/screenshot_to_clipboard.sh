#!/bin/bash

# Define screenshot save path and file name format
screenshot_path="$HOME/Pictures/Screenshots"
screenshot_file="screenshot_$(date +%d-%m-%Y_%T).png"

# Ensure the screenshot directory exists
mkdir -p "$screenshot_path"

# Full path for the screenshot
full_screenshot_path="$screenshot_path/$screenshot_file"

# Take a screenshot of a selected area
scrot --select "$full_screenshot_path"

# Copy the screenshot to the clipboard
xclip -selection clipboard -t image/png -i "$full_screenshot_path"

# Show notification
notify-send "Screenshot taken" "Saved to $full_screenshot_path and copied to clipboard."


