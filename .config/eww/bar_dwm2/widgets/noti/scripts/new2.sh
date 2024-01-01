#!/bin/bash


wait_media() {
  whatmedia=$(playerctl metadata --format "{{ title }}")
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
    ispause="(button :class \"ispaused-button\" :onclick \"playerctl play-pause\" (label :text \"󰐊\"))"
  else 
    ispause="(button :class \"ispaused-button\" :onclick \"playerctl play-pause\" (label :text \"󰏤\"))"
  fi

  #Next & Prev
  isprev="(button :class \"prev-button\" :onclick \"playerctl previous\" (label :text \"󰒮\"))"
  isnext="(button :class \"next-button\" :onclick \"playerctl next\" (label :text \"󰒭\"))"
  mediabuttons="(box :class \"media-buttons\" :space-evenly \"false\" :orientation \"h\" $isprev $ispause $isnext)"
  
  #User
  userimage="(box :class \"user-image\" :space-evenly \"true\" :orientation \"h\" :halign \"center\" :style \"background-image: url('/home/termai/.config/eww/bar_dwm/images/user3.png');\")"
  usertext="(box :class \"user-text\" :space-evenly \"true\" :orientation \"h\" :halign \"center\" (button :class \"text-text\" :onclick \"xdotool key super+1\" (label :text \"Pluto\")))"
  
  user="(box :space-evenly \"true\" :class \"user-container\" :space-evenly \"false\" :orientation \"h\" :halign \"center\" $userimage $usertext)"
  # Shorten whatmedia to 37 characters and add ellipsis if needed
  whatartist=$(playerctl metadata --format "{{xesam:artist}}")
  whatmedias=$(echo "$whatmedia")
  whatmedia1=$(echo "$whatmedias" | awk '{ if (length($0) <= 26) print; else print substr($0, 1, 26) "..." }')


  coverart="(image :class \"cover-art\" :path \"/tmp/cover.jpg\" :image-width 304 image-height 304)"
  #coverart="(box :class \"cover-art\" :space-evenly \"true\" :orientation \"h\" :style \"background-image:url('/tmp/cover.jpg');\")"

  two="(button :class \"music-text\" \"$whatmedia1\")"
  #echo "(box :class \"media\" :space-evenly \"false\" :orientation \"h\"$user $one  $two $mediabuttons $coverart)"
  echo "(box :class \"media\" :space-evenly \"false\" :orientation \"h\"$coverart)"
  #dunstify -i /tmp/FRONT_COVER.jpg "$(playerctl metadata title)" "$(playerctl metadata artist)"

}





"$@"