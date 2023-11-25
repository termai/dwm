#!/bin/bash

# Get the currently playing song title
current_title=$(playerctl metadata title)

# Set the directory to search for music files
music_directory=~/Music

# Loop through each music file in the specified directory
while IFS= read -r -d '' file; do
    # Extract the title of the file
    file_title=$(playerctl metadata '{{title}}' "$file")

    # Compare the titles (case-insensitive)
    if [[ "${file_title,,}" == "${current_title,,}" ]]; then
        echo "Found matching file: $file"
        # You can add further actions here if needed
    fi
done < <(find "$music_directory" -type f -print0)

# Note: Replace "vlc" in the metadata command with the appropriate play
