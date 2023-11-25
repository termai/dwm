#!/bin/bash

# Function to get the program name from the window ID
get_program_name() {
    local window_id="$1"
    local program_name

    # Use xprop to get the program name
    program_name=$(xprop -id "$window_id" | awk -F'"' '/WM_CLASS\(STRING\)/{print $4}')

    echo "$program_name"
}

# Cache program images in an associative array
declare -A program_images

# Function to echo the corresponding program image
echo_program_image() {
    local program_name="$1"

    # Check if the program image is already cached
    if [[ -n "${program_images[$program_name]}" ]]; then
        echo "${program_images[$program_name]}"
        return
    fi

    # Look for the program image (PNG or SVG)
    local program_image_path="/home/termai/.config/eww/bar/images/${program_name}.png"

    if [ -e "$program_image_path" ]; then
        program_images["$program_name"]=$program_image_path
        echo "$program_image_path"
    else
        program_image_path="/home/termai/.config/eww/bar/images/${program_name}.svg"
        if [ -e "$program_image_path" ]; then
            program_images["$program_name"]=$program_image_path
            echo "$program_image_path"
        else
            echo "no"  # No program image found
        fi
    fi
}

# Get the window ID of the currently focused window using xdotool
window_id_to_check=$(xdotool getwindowfocus)

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
        buf="(image :class \"icons-button\" :path \"$image_path\" :image-width 28 image-height 28)"

        # Echo the updated buf structure
        echo "(box :class \"icons\" :orientation \"h\" $buf)"
    fi
fi
