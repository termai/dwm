#!/bin/bash

# Get the video thumbnail URL from your media player
thumbnail_url=$(playerctl metadata --format '{{xesam:comment}}' | awk -F= '{print $2}')

# Check if a thumbnail URL is available
if [ -n "$thumbnail_url" ]; then
    # Download the thumbnail image
    curl -o /tmp/you.jpg "https://img.youtube.com/vi/$thumbnail_url/maxresdefault.jpg"

    # Display a notification using Dunst with the thumbnail
    dunstify -i /tmp/you.jpg "$(playerctl metadata --format '{{xesam:title}}')" "$(playerctl metadata --format '{{xesam:artist}}')"
else
    dunstify "No YouTube Thumbnail Found" "No thumbnail URL available in media player metadata"
fi
