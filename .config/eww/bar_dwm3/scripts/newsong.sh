#!/bin/bash

# Initialize a variable to store the current song title
current_song=""

# Continuously monitor the currently playing song
while true; do
    # Get the current song title from playerctl
    new_song=$(playerctl metadata --format '{{xesam:title}}')

    # Check if the song has changed
    if [ "$new_song" != "$current_song" ]; then
        current_song="$new_song"
        
        # Run your script here
        /home/termai/.config/eww/bar_dwm/scripts/dunst-noti.sh  # Replace with the path to your script
    fi

    # Sleep for a short interval to avoid continuous checking
    sleep 5  # Adjust the interval as needed
done
