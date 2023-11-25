#!/bin/bash

# Get the desktop number of the currently focused window
focused_desktop=$(xdotool get_desktop)

# Get the window IDs of all windows
window_ids=$(xdotool search --onlyvisible --all "")

# Initialize a counter for the windows in the focused desktop
window_count=0

# Iterate through window IDs and check their desktops
for window_id in $window_ids; do
    window_desktop=$(xprop -id $window_id _NET_WM_DESKTOP | awk '{print $3}')
    
    # Compare the window's desktop to the focused desktop
    if [ "$window_desktop" -eq "$focused_desktop" ]; then
        ((window_count++))
    fi
done

echo "Number of windows in desktop $focused_desktop: $window_count"
