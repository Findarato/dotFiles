# Script to switch second monitor off or back on again
# sterky was here...

# Check if second display (DP-4) is enabled
check=$(nvidia-settings -q dpys | grep DP-4 | grep enabled)

# Switch display config
if [ -z "$check" ]; then
    # If disabled - notify and enable second screen
    nvidia-settings --assign CurrentMetaMode="DP-0: 2560x1440_144 +0+0, DP-4: 2560x1440_144 +2560+0"
    notify-send "Dualscreen - enabled" -t 4000 -i messagebox_info
else
    # If enabled - notify and disable second screen
    nvidia-settings --assign CurrentMetaMode="DP-0: 2560x1440_144 +0+0"
    notify-send "Dualscreen - disabled" -t 4000 -i messagebox_info
fi
