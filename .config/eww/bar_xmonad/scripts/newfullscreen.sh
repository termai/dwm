#!/bin/bash

# Define the process name to restore (e.g., "eww")
process_to_restore="eww open newbar --config /home/termai/.config/eww/bar_xmonad/"

# Initialize a flag to keep track of whether "eww" has been restarted
eww_restarted=false

while true; do
  # Get the ID of the currently focused window
  window_id=$(xprop -id $(wmctrl -l | grep "Brave" | awk '{print $1}') | grep -q '_NET_WM_STATE_FULLSCREEN')
  # Check if the window has the _NET_WM_STATE_FULLSCREEN property
  if "$window_id"; then
    # The window is in fullscreen mode, do nothing
    if $eww_restarted; then
      # If "eww" has been restarted, kill it
      pkill eww
      eww_restarted=false  # Reset the flag
    fi
  else
    # The window is not in fullscreen mode
    if ! $eww_restarted; then
      # If "eww" hasn't been restarted yet, restart it
      echo "Restoring $process_to_restore"
      $process_to_restore &  # Start the process in the background
      eww_restarted=true  # Set the flag
    fi
  fi

  # Sleep for a while (adjust the sleep duration as needed)
  sleep 0.1  # Sleep for 2 seconds (adjust as needed)
done
