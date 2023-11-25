#!/bin/bash

# Function to get the program name from the window ID
get_program_name() {
    local window_id="$1"
    local program_name

    # Use xprop to get the program name
    program_name=$(hyprctl activewindow | awk 'FNR == 9 {print $2}')

    echo "$program_name"
}

# Function to echo the corresponding program image
echo_program_image() {
    local program_name="$1"

    # Look for the program image (PNG or SVG) in /usr/share/icons/hicolor/128x128/apps/
    local program_image_path="/home/termai/.config/eww/bar/images/${program_name}.png"
    
    # Check if the program image exists as PNG, if not, check SVG
    if [ -e "$program_image_path" ]; then
        echo "$program_image_path"
    else
        program_image_path="/home/termai/.config/eww/bar/images/${program_name}.svg"
        if [ -e "$program_image_path" ]; then
            echo "$program_image_path"
        else
            echo "no"  # No program image found
        fi
    fi
}

# Get the window ID of the currently focused window using xdotool
window_id_to_check=$(hyprctl activewindow | awk 'FNR == 1 {print $2}')

if [ -z "$window_id_to_check" ]; then
    echo "no"  # No focused window found
else
    # Get the program name from the window ID
    program_name=$(get_program_name "$window_id_to_check")

    if [ "$program_name" = "no" ]; then
        echo "no"  # No program name found
    else
        # Echo the corresponding program image path
        image_path=$(echo_program_image "$program_name")
        
        # Modify buf to include the background image style
        buf="(image :class \"program\" :path \"$image_path\" :image-width 34 image-height 34)"
        
        # Echo the updated buf structure
        echo "$buf"
    fi
fi
