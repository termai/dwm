#!/bin/bash

# Function to check if a workspace is focused
is_focused() {
    [ "$1" -eq "$focused_desktop" ]
}

# Function to check if a workspace is occupied
is_occupied() {
    local desktop="$1"
    for occupied in "${occupied_desktops[@]}"; do
        [ "$desktop" -eq "$occupied" ] && return 0
    done
    return 1
}

# Function to check if a workspace is urgent (modify this as per your environment)
is_urgent() {
    # Implement logic here to check if a workspace is urgent
    # You might need to query your desktop environment for pending notifications or alerts
    return 1  # For now, we assume no workspaces are urgent
}

update_workspace_info() {
    local desktop_info
    read -r -a desktop_info < <(wmctrl -d | awk '{print $1}')

    focused_desktop=$(xdotool get_desktop)
    occupied_desktops=($(wmctrl -l | awk '{print $2}'))
    urgent_desktops=()

    buf=""
    icons=("" "" "📚" "🍿" "🌐")

    for ((i = 0; i < ${#desktop_info[@]}; i++)); do
        desktop=${desktop_info[i]}
        if is_focused "$desktop"; then
            class="focused"
        elif is_occupied "$desktop"; then
            class="occupied"
        elif is_urgent "$desktop"; then
            class="urgent"
        else
            class="empty"
        fi

        icon="${icons[i]}"

        # Append the "workspaces-button" class in the <button> element to the buf variable
        buf+=" (eventbox :cursor \"hand\" (button :class \"workspaces-button $class\" :onclick \"xdotool key super+$((i+1))\" \"$icon\"))"
    done

    # Output the complete workspace indicator
    echo "(box :class \"workspaces\" :halign \"center\" :valign \"center\" :vexpand true :hexpand true $buf)"
}

# Continuously update and listen to changes
while true; do
    update_workspace_info
    sleep 0.1  # Update every 0.1 seconds (adjust as needed)
done
