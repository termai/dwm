#!/bin/bash

is_focused() {
  focusedworkspace=$(hyprctl activeworkspace | awk 'FNR == 1 {print $4}' | tr -d '()')
}

is_occupied() {
  occupiedworkspaces=$( hyprctl workspaces -j | jq '.[] | del(select(.id == -99)) | .id' | sort)
}


#what_media() {
#  whatmedia=$(playerctl metadata --format "{{ title }}")
#  whichmedia=$(playerctl metadata | awk 'FNR == 1 {print $1}')
#  newmedia="/home/termai/.config/eww/bar_hypr/images/apps/${whichmedia}.svg"
#  whatmedia1=$(echo "$whatmedia" | awk '{for(i=1;i<=5;i++) printf " %s", $i}' | sed -e 's/[[:space:]]*$//')
#  one="(image :class \"media-image\" :path \"$newmedia\" :image-width 34 image-height 34)"
#  two="(label :text \"$whatmedia1...\")"
#  echo "(box :class \"media\" :space-evenly \"false\" :orientation \"h\" $one  $two)"
#}

what_media() {
  whatmedia=$(playerctl metadata --format "{{ title }}")
  whichmedia=$(playerctl metadata | awk 'FNR == 1 {print $1}')
  newmedia="/home/termai/.config/eww/bar_hypr/images/apps/${whichmedia}.svg"
  # Shorten whatmedia to 37 characters and add ellipsis if needed
  whatmedia1=$(echo "$whatmedia" | awk '{ if (length($0) <= 37) print; else print substr($0, 1, 37) "..." }')
  one="(image :class \"media-image\" :path \"$newmedia\" :image-width 34 image-height 34)"
  two="(label :text \"$whatmedia1\")"
  echo "(box :class \"media\" :space-evenly \"false\" :orientation \"h\" $one  $two)"
}


wait_media() {
  whatmedia=$(playerctl metadata --format "{{ title }}" | tr -d \"\"\")
  whichmedia=$(playerctl metadata | awk 'FNR == 1 {print $1}')
  svg_media="/home/termai/.config/eww/bar_hypr/images/apps/${whichmedia}.svg"
  png_media="/home/termai/.config/eww/bar_hypr/images/apps/${whichmedia}.png"
  
  # Determine which media file exists (SVG or PNG)
  if [ -e "$svg_media" ]; then
    one="(image :class \"media-image\" :path \"$svg_media\" :image-width 28 image-height 28)"
  elif [ -e "$png_media" ]; then
    one="(image :class \"media-image\" :path \"$png_media\" :image-width 28 image-height 28)"
  else
    one=""
  fi

  # Is_paused or not
  ispaused=$(playerctl status)
  if [[ "$ispaused" = "Paused" ]]; then
    ispause="(eventbox :class \"ispaused-button\" :onclick \"playerctl play-pause\" (label :text \"󰐊\"))"
  else 
    ispause="(eventbox :class \"ispaused-button\" :onclick \"playerctl play-pause\" (label :text \"󰏤\"))"
  fi

  #Next & Prev
  isprev="(eventbox :class \"prev-button\" :onclick \"playerctl previous\" (label :text \"󰒮\"))"
  isnext="(eventbox :class \"next-button\" :onclick \"playerctl next\" (label :text \"󰒭\"))"
  mediabuttons="(box :class \"media-buttons\" :space-evenly \"false\" :orientation \"h\" $isprev $ispause $isnext)"
  
  #User
  userimage="(box :class \"user-image\" :space-evenly \"true\" :orientation \"h\" :halign \"center\" :style \"background-image: url('/home/termai/.config/eww/bar_dwm/images/user3.png');\")"
  usertext="(box :class \"user-text\" :space-evenly \"true\" :orientation \"h\" :halign \"center\" (button :class \"text-text\" :onclick \"xdotool key super+1\" (label :text \"Pluto\")))"
  
  user="(box :space-evenly \"true\" :class \"user-container\" :space-evenly \"false\" :orientation \"h\" :halign \"center\" $userimage $usertext)"
  # Shorten whatmedia to 37 characters and add ellipsis if needed
  whatartist=$(playerctl metadata --format "{{xesam:artist}}")
  whatmedias=$(echo "$whatmedia")
  whatmedia1=$(echo "$whatmedias" | awk '{ if (length($0) <= 26) print; else print substr($0, 1, 26) "..." }')


  coverart="(image :class \"cover-art\" :path \"/tmp/cover.jpg\" :image-width 34 image-height 34)"

  two="(button :class \"music-text\" \"$whatmedia1\")"
  #echo "(box :class \"media\" :space-evenly \"false\" :orientation \"h\"$user $one  $two $mediabuttons $coverart)"
  echo "(box :class \"media\" :space-evenly \"false\" :orientation \"h\" $one  $two $mediabuttons $coverart)"
  #dunstify -i /tmp/FRONT_COVER.jpg "$(playerctl metadata title)" "$(playerctl metadata artist)"

}



is_title() {
  title=$(xprop -id $(xdotool getwindowfocus) | grep "WM_CLASS(STRING)" | awk '{print $3}' | tr -d "," | tr -d '"')
  echo $title  
}

is_paused () {
  ispaused=$(playerctl status)
  if [[ "$ispaused" = "Paused" ]]; then
    echo "󰐊"
  else 
    echo ""
  fi
}


is_wifi () {
  iswifi=$(iwctl station wlan0 show | awk 'FNR == 6 {print $2}')
  is_wifis=$(iwctl station wlan0 get-networks | grep ">" | awk '{print $4}')
  if [[ "$iswifi" = "connected" ]]; then
    echo "(button :class \"wifis\" :onclick \"eww open wifi-wid --config /home/termai/.config/eww/bar_dwm3/widgets/wifi-wid\" :tooltip \"$is_wifis\" \"󰖩\" )"
  else
    echo "󰖪"
  fi
}



is_wifis() {
  wifi_connected=$(iwctl station wlan0 get-networks | grep ">" | awk '{print $4}')
  echo "Current Wifi: $wifi_connected"
}


kill_timer() {
  #faillock --reset | ps -o pid,ppid,sess,cmd -U termai | grep "/scripts/timer" | sudo kill -9 $(awk 'FNR == 1 {print $1 " " $2 " " $3}') >> Abdul
  ps -o pid,ppid,sess,cmd -U termai | grep "/usr/local/bin/timer" | kill $(awk 'FNR == 1 {print $1 " " $2 " " $3}')
}


"$@"
