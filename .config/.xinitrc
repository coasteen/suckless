picom -b &
dunst &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
feh --bg-scale ~/Pictures/cherry_tree_imresizer.jpg &
while true; do
    # Get volume (using PulseAudio)
    volume=$(pactl list sinks | grep 'Volume:' | head -n 1 | awk '{print $5}')

    # Get battery info
    if [ -d /sys/class/power_supply/BAT0 ]; then
        battery=$(cat /sys/class/power_supply/BAT0/capacity)
        status=$(cat /sys/class/power_supply/BAT0/status | head -c 1)
        battery_display="$battery%$status"
    else
        battery_display=""
    fi

    # Get time
    time=$(date '+%H:%M')

    xsetroot -name "$volume | $time"

    sleep 1
done &
exec dwm
