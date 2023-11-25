#!/bin/bash

# File to store the previous volume
prev_volume_file="/tmp/prev_volume.txt"

# Function to get the current volume
get_current_volume() {
    amixer | awk 'FNR == 7 {print $5}' | sed 's/[][]//g'
}

# Function to check if volume has changed
volume_changed() {
    current_volume=$(get_current_volume)
    prev_volume=$(cat "$prev_volume_file" 2>/dev/null)

    if [ -z "$prev_volume" ]; then
        echo "$current_volume" > "$prev_volume_file"
        echo "no"
    elif [ "$prev_volume" != "$current_volume" ]; then
        echo "$current_volume" > "$prev_volume_file"
        echo "yes"
    else
        echo "no"
    fi
}

# Check and print result
while true; do
  result=$(volume_changed)
  echo $result
done
