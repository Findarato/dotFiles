#!/bin/bash

# Pulled from https://gitlab.com/snippets/1766082

battery_percentage="$((`cat /sys/class/power_supply/BAT0/energy_now` * 100 / `cat /sys/class/power_supply/BAT0/energy_full_design`))"

if (( $battery_percentage < 20 && $battery_percentage > 8 )); then
    notify-send -i battery-low-charging "Battery Low" "You still have some time, but not much..."
fi


if (( $battery_percentage < 9 )); then
    notify-send -i battery-low-charging "Battery Critical" "This is your final warning! I will crash!"
fi
