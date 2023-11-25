#!/bin/bash

# Function to check if a workspace is focused
is_focused() {
    [ "$1" -eq "$focused_desktop" ]
}

# Function to check if a workspace is occupied
is_occupied() {
    for e in "${occupied_desktops[@]}"; do
        [ "$e" -eq "$1" ] && return 0
    done
    return 1
}






# Function to check if a workspace is urgent (modify this as per your environment)
is_urgent() {
    # Implement logic here to check if a workspace is urgent
    # You might need to query your desktop environment for pending notifications or alerts
    return 1  # For now, we assume no workspaces are urgent
}

print_workspaces() {
    buf=""
    desktops=($(wmctrl -d | awk '{print $1}'))
    focused_desktop=$(xdotool get_desktop)
    occupied_desktops=($(wmctrl -l | awk '{print $2}'))
    urgent_desktops=()

    #icons=("🌍" "" "📚" "🍿" "🌐" "6" "7" "8" "9")
    icons=("" "" "📚" "🍿" "🌐" "6" "7" "8" "9")

    for ((i = 0; i < ${#desktops[@]}; i++)); do
        d=${desktops[i]}
        if is_focused "$d"; then
            class="focused"
        elif is_occupied "$d"; then
            class="occupied"
        elif is_urgent "$d"; then
            class="urgent"
        else
            class="empty"
        fi

        icon="${icons[i]}"

        # Include the "workspaces-button" class in the <button> element
        #buf="$buf (eventbox :cursor \"hand\" (button :class \"tag-button $class\" :onclick \"xdotool key super+$((i+1))\" \"$icon\"))"
        buf="$buf (button :class \"tag-button $class\" :onclick \"xdotool key super+$((i+1))\" \"$icon\")"
    done

    echo "(box :class \"all-tags\" :space-evenly \"true\" :orientation \"h\" $buf)"
}

# Continuously update and listen to changes
while true; do
    print_workspaces
    sleep 0.1  # Update every 0.5 seconds (adjust as needed)
done
