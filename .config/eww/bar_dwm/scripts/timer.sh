#!/bin/bash

# Function to display a countdown timer
function countdown() {
  local duration=$1
  local hours=${duration%%:*}
  local minutes=${duration#*:}
  local seconds=0

  if [[ "$minutes" == *:* ]]; then
    seconds=${minutes#*:}
    minutes=${minutes%%:*}
  fi

  local total_seconds=$((3600 * hours + 60 * minutes + seconds))

  while [ $total_seconds -gt 0 ]; do
    local hours=$((total_seconds / 3600))
    local minutes=$(( (total_seconds % 3600) / 60 ))
    local remaining_seconds=$((total_seconds % 60))

    printf "%02d:%02d:%02d\r" $hours $minutes $remaining_seconds
    sleep 1
    ((total_seconds--))
  done

  echo -e "Time's up!\033[0K"
}

# Check if an argument was provided for the timer duration
if [ $# -eq 0 ]; then
  echo "Usage: $0 <duration in HH:MM:SS>"
  exit 1
fi

# Get the timer duration from the command-line argument
duration=$1

# Start the countdown and store the result in the "wow" variable
#countdown "$duration"

# Display the result+
wow="(button :class \"timer-button\" :onclick \"~/.config/eww/bar_dwm/scripts/new2.sh kill_timer\" countdown $duration)"
echo "(box :class \"timer\" :space-evenly \"false\" :orientation \"h\" $wow)"

