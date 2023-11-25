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
    #desktops=$(bspc query -D --names)
    desktops=$(bspc query -D --names | awk '!seen[$0]++')
    focused_desktop=$(bspc query -D -d focused --names)
    occupied_desktops=$(bspc query -D -d .occupied --names)
    urgent_desktops=$(bspc query -D -d .urgent --names)
    
    icon=("" "" "📚" "🍿" "🌐" "6" "7" "8" "9")

    for d in $desktops; do
        if [ "$(contains "$focused_desktop" "$d")" -eq 1 ]; then
            ws=$d
            #icon=""
            class="focused"
        elif [ "$(contains "$occupied_desktops" "$d")" -eq 1 ]; then
            ws=$d
            #icon=""
            class="occupied"
        elif [ "$(contains "$urgent_desktops" "$d")" -eq 1 ]; then
            ws=$d
            #icon=""
            class="urgent"
        else 
            ws=$d
            #icon=""
            class="empty"
        fi  

        buf="$buf (eventbox :cursor \"hand\" (tag-button :class \"$class\" :onclick \"bspc desktop -f $ws\" \"$icon\"))"
    done

    echo "(box :class \"workspaces\" :halign \"center\" :valign \"center\" :vexpand true :hexpand true $buf)"
}

# Listen to bspwm changes
print_workspaces
bspc subscribe desktop node_transfer | while read -r _ ; do
    print_workspaces
done 
