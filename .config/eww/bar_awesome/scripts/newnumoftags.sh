#!/bin/bash

while true; do
    # Get the list of virtual desktop numbers from wmctrl -l
    desktop_numbers=$(wmctrl -l | awk '{print $2}')

    # Create an associative array to store the window counts for each desktop
    declare -A window_counts

    # Loop through each desktop number and count occurrences
    for desktop in $desktop_numbers; do
        if [[ -z "${window_counts[$desktop]}" ]]; then
            window_counts[$desktop]=1
        else
            ((window_counts[$desktop]++))
        fi
    done
    # Get the current virtual desktop (assuming it's the first one)
    current_desktop=$(wmctrl -d | awk '/\*/{print $1}')

    # Print the window count for the current virtual desktop
    if [[ -n "${window_counts[$current_desktop]}" ]]; then
        echo "[${window_counts[$current_desktop]}]"
    else
        echo "[0]"
    fi

    sleep 1.0
done
