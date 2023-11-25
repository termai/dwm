#!/bin/bash

# Define icons for workspaces 1-9
ic=("" "" "📚" "🍿" "🌐" "6" "7" "8" "9")

workspaces() {
    unset -v o1 o2 o3 o4 o5 o6 o7 o8 o9 f1 f2 f3 f4 f5 f6 f7 f8 f9

    # Get occupied workspaces and remove workspace -99 (scratchpad) if it exists
    ows=($(hyprctl workspaces -j | jq '.[] | del(select(.id == -99)) | .id'))

    for num in "${ows[@]}"; do
        export "o$num"="$num"
    done

    # Get the focused workspace for the current monitor ID
    arg="$1"
    num=$(hyprctl activeworkspace | awk 'FNR == 1 {print $4}' | tr -d '()')
    export "f$num"="$num"

    # Create the workspace buttons with classes based on focus and occupation
    buf="(eventbox :onscroll \"echo {} | sed -e 's/up/-1/g' -e 's/down/+1/g' | xargs hyprctl dispatch workspace\""
    buf+=" (box :class \"workspace\" :orientation \"h\" :space-evenly \"false\""

    for i in {1..9}; do
        class=""
        if [ "$i" -eq "$num" ]; then
            class+="focused "
        elif [[ " ${ows[@]} " =~ " $i " ]]; then
            class+="occupied "
        fi

        icon="${ic[i - 1]}"
        buf+=" (button :onclick \"hyprctl dispatch workspace $i\" :class \"tag-button $class\" \"$icon\")"
    done

    buf+="))"
    echo "$buf"
}

while true; do
  workspaces "$1"
  sleep 0.1
done
