#!/bin/bash

is_focused() {
  focusedworkspace=$(hyprctl activeworkspace | awk 'FNR == 1 {print $4}' | tr -d '()')
}

is_occupied() {
  occupiedworkspaces=$( hyprctl workspaces -j | jq '.[] | del(select(.id == -99)) | .id' | sort)
}

what_media() {
  whatmedia=$(playerctl metadata --format "{{ title }}")
  whichmedia=$(playerctl metadata | awk 'FNR == 1 {print $1}')
  newmedia="/home/termai/.config/eww/bar_hypr/images/apps/${whichmedia}.svg"
  whatmedia1=$(echo "$whatmedia" | awk '{for(i=1;i<=5;i++) printf " %s", $i}')
  one="(image :class \"media-image\" :path \"$newmedia\" :image-width 34 image-height 34)"
  two="(label :text \"$whatmedia1...\")"
  echo "(box :class \"media\" :space-evenly \"false\" :orientation \"h\" $one  $two)"
}

is_time() {
  current_time=$(date +"%I:%M %p")
  echo "(label :class \"time-label\" :text \"$current_time\")"
}

"$@"
