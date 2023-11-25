#!/bin/bash

# Function to get the program name from the window ID
get_program_name() {
    local window_id="$1"
    local program_name

    # Use xprop to get the program name
    program_name=$(xprop -id "$window_id" | grep "WM_CLASS(STRING)" | awk -F'"' '{print $4}')

    echo "$program_name"
}

# Function to echo the corresponding program image
echo_program_image() {
    local program_name="$1"

    # Look for the program image (PNG or SVG) in /home/termai/.config/eww/bar/images/
    local program_image_path="/home/termai/.config/eww/bar/images/${program_name}.png"

    # Check if the program image exists as PNG, if not, check SVG
    if [ -e "$program_image_path" ]; then
        echo "$program_image_path"
    else
        program_image_path="/home/termai/.config/eww/bar/images/${program_name}.svg"
        if [ -e "$program_image_path" ]; then
            echo "$program_image_path"
        else
            echo "Heck Yes"  # No program image found
        fi
    fi
}

# Get the window ID of the currently focused window using xdotool
window_id_to_check=$(xdotool getwindowfocus)

if [ -z "$window_id_to_check" ]; then
    echo ""  # No program name found
else
    # Get the program name from the window ID
    program_name=$(get_program_name "$window_id_to_check")

    if [ "$program_name" = "no" ]; then
        echo ""  # No program name found
    else
        # Echo the corresponding program image path
        image_path=$(echo_program_image "$program_name")

        # Get the window title, or set it to an empty string if not available
        
        buf="(image :class \"program-image\" :path \"$image_path\" :image-width 34 image-height 34)"

        title=""

        if xprop -id "$window_id_to_check" | grep -q "_NET_WM_NAME(UTF8_STRING)"; then
          full_title=$(xprop -id "$window_id_to_check" | grep "_NET_WM_NAME(UTF8_STRING)" | cut -d '"' -f 2)
          # Use awk to split the title into words and keep the first 5 words
          title=$(echo "$full_title" | awk '{ for (i=1; i<=6; i++) printf("%s ", $i) }')
          title=$(echo "$title" | sed -e 's/[[:space:]]*$//')
        fi
        title="(label :text \"$title\")"
        echo "(box :class \"program\" :space-evenly \"false\" :orientation \"h\" :halign \"center\" $title $buf)"
    fi
fi
