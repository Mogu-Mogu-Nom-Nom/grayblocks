#!/bin/bash

# Get the current energy and full energy of each battery
energy1=$(cat /sys/class/power_supply/BAT0/energy_now)
full_energy1=$(cat /sys/class/power_supply/BAT0/energy_full)

energy2=$(cat /sys/class/power_supply/BAT1/energy_now)
full_energy2=$(cat /sys/class/power_supply/BAT1/energy_full)
full_energy2_design=$(cat /sys/class/power_supply/BAT1/energy_full_design)

# Calculate the percentage of full energy remaining for each battery
percentage1=$((energy1 * 100 / full_energy1))
percentage2=$((energy2 * 100 / full_energy2))

# Set weights based on the capacities of the batteries
weight1=$(($full_energy1))
weight2=$(($full_energy2))

# Calculate the weighted average
weighted_avg=$(( ($percentage1 * $weight1 + $percentage2 * $weight2) / ($weight1 + 50220000) )) #weight2 is a constant so that when i swap out the external battery the ratio stays the same

# Output the weighted average percentage
echo "$weighted_avg%"
