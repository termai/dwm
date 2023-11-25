#!/bin/bash

# Function to extract album art and delete FRONT_COVER.jpg
process_album_art() {
    # Get the currently playing song's title
    current_title=$(playerctl metadata title)

    # Find the music file that matches the current song title
    #music_file=$(find ~/Music/ -type f -print0 | awk -v title="$current_title" -F '\0' -v RS='\0' '$0 ~ title' | grep "$(playerctl metadata artist)")
    music_file=$(find ~/Music/ | grep "$(playerctl metadata title)" | grep "$(playerctl metadata artist)")

    # Check if a matching music file was found
    if [ -n "$music_file" ]; then
        # Delete existing FRONT_COVER.jpg if it exists in the temporary directory
        front_cover="/tmp/FRONT_COVER.jpg"
        if [ -f "$front_cover" ]; then
            rm "$front_cover"
        fi

        # Extract album art to /tmp/ using eyeD3
        eyeD3 --write-images=/tmp/ "$music_file"
       dunstify -i /tmp/FRONT_COVER.jpg "$(playerctl metadata title)" "$(playerctl metadata artist)"
    fi
}

# Monitor for song changes using playerctl
playerctl --follow metadata | while read -r; do
    process_album_art
    #dunstify -i /tmp/FRONT_COVER.jpg "$(playerctl metadata title)" "$(playerctl metadata artist)"
done
