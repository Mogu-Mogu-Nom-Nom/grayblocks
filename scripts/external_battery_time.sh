#!/bin/bash

# Path to power and energy files
power_file="/sys/class/power_supply/BAT1/power_now"
energy_file="/sys/class/power_supply/BAT1/energy_now"

# Read values from files
power=$(cat "$power_file")
energy=$(cat "$energy_file")

# Calculate remaining time in minutes
if [ "$power" -ne 0 ]; then
    remaining_time=$(((energy) * 60 / power))
    # Convert minutes to hours and minutes
    hours=$((remaining_time / 60))
    minutes=$((remaining_time % 60))
    printf "%02d:%02d\n" "$hours" "$minutes"
else
    echo "00:00"
fi
