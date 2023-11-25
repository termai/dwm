#!/bin/sh

# Checks if a list ($1) contains an element ($2)
contains() {
    for e in $1; do
        [ "$e" -eq "$2" ] && echo 1 && return
    done
    echo 0
}

print_workspaces() {
    buf=""
    desktops=$(bspc query -D --names | awk '!seen[$0]++' | sort -n)
    focused_desktop=$(bspc query -D -d focused --names)
    occupied_desktops=$(bspc query -D -d .occupied --names)
    urgent_desktops=$(bspc query -D -d .urgent --names)

    icons=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10")
    i=0
    for d in $desktops; do
        if [ "$(contains "$focused_desktop" "$d")" -eq 1 ]; then
            ws=$d
            class="focused"
        elif [ "$(contains "$occupied_desktops" "$d")" -eq 1 ]; then
            ws=$d
            class="occupied"
        elif [ "$(contains "$urgent_desktops" "$d")" -eq 1 ]; then
            ws=$d
            class="urgent"
        else
            ws=$d
            class="empty"
        fi
        
        icon="${icons[i]}"  # Get the icon for this desktop
        i=$((i + 1))  # Increment the index for the next desktop

        buf="$buf (eventbox :cursor \"hand\" (button :class \" tag-button $class\" :onclick \"bspc desktop -f $ws\" \"$icon\"))"
    done

    echo "(box :class \"all-tags\" :halign \"center\" :valign \"center\" :vexpand true :hexpand true $buf)"
}

# Listen to bspwm changes
print_workspaces
bspc subscribe desktop node_transfer | while read -r _ ; do
    print_workspaces
done
