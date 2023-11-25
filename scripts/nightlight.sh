#!/bin/bash

#time="date +'%I:%M:%p'"

while true; do
    current_time=$(date +%H%M)

    if [ "$current_time" -ge "1700" ] || [ "$current_time" -lt "0500" ]; then
        # After 5 PM or before 5 AM
        if ! pgrep -x "redshift" > /dev/null; then
            redshift &
        fi
    else
        # Between 5 AM and 5 PM
        if pgrep -x "redshift" > /dev/null; then
            pkill redshift
        fi
    fi

    sleep 60  # Sleep for 60 seconds before checking again
done
