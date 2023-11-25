#!/bin/bash

# Function to start the countdown timer
start_timer() {
    local timer_input="$1"
    IFS=':' read -r -a timer_array <<< "$timer_input"
    local minutes="${timer_array[0]}"
    local seconds="${timer_array[1]}"
    local total_seconds=$((minutes * 60 + seconds))

    # Start the countdown
    while [ "$total_seconds" -gt 0 ]; do
        printf "%02d:%02d\033[0K\r" $((total_seconds / 60)) $((total_seconds % 60))
        sleep 1
        total_seconds=$((total_seconds - 1))
    done

    # Display a message when the timer is done
    echo "Time's up!"
}

# Check if a valid timer argument is provided
if [ $# -eq 1 ]; then
    timer_argument="$1"
    # Validate the timer argument (mm:ss)
    if [[ "$timer_argument" =~ ^[0-5]?[0-9]:[0-5][0-9]$ ]]; then
        start_timer "$timer_argument"
    else
        echo "Invalid timer format. Use 'mm:ss'."
    fi
else
    echo "Usage: $0 <timer_duration>"
fi
