#!/bin/bash

# colors
fg=#b6beca
bg=#101419
contrast=#15191e
lighter=#1a1e23

black=#242931
red=#e05f65
green=#76b97f
yellow=#f1cf8a
blue=#70a5eb
magenta=#c68aee
cyan=#74bee9
white=#dee1e6
darks=#000000
purple=#b217e6
purples=#7888db
cadan=#ffffff
get_network_icon () {
  [ $(cat /sys/class/net/w*/operstate) = down ] && echo 睊 && exit
  echo 
}

get_playerctl () {
  icon="󰗃"
  mptitle=$(playerctl metadata --format "{{ title }}" | tr -d \"\"\")
  mpartist=$(playerctl metadata artist)
  mpmedia=$(echo "$mptitle")
  mpmedias=$(echo "$mpmedia" | awk '{ if (length($0) <= 20) print; else print substr($0, 1, 20) "..." }')
  #printf "^b$blue^^c$bg^ $icon ^b$bg^ ^c$cyan^$mpmedias ^b$bg^"
  echo "  ^c$cyan^  $mpmedias^b$bg^ "
}

get_wifis () {
  wifis=$(/home/termai/.config/eww/bar_dwm2/scripts/new2.sh is_wifis)
  printf "  ^b$red^^c$black^ 󰖩  $wifis  "
}


get_date () {
  #printf "^c$magenta^^b$lighter^  ^b$bg^ $(date +'%a %d, %I:%M %p') ^c$fg^^b$bg^"
  #printf " ^b$white^^c$magenta^^b$lighter^  ^b$bg^ $(date +'%a %d, %I:%M %p') ^c$fg^^b$bg^ "
  #printf " ^b$white^^c$magenta^^b$lighter^  ^b$bg^ $(date +'%a %b %d %I:%M:%S %p') ^c$fg^^b$bg^ "
  printf " ^b$white^^c$cadan^^b$lighter^  ^b$bg^ $(date +'%a %D %I:%M:%S %p') ^c$fg^^b$bg^ "
}

get_vol () {
  date_str=$(/home/termai/.config/eww/bar_dwm2/scripts/sb-vol)
  #printf "^b$green^^c$darks^ $date_str "
  printf " ^b$green^^c$darks^ %s " "$date_str "

}

weath () {
  weaths=$(/home/termai/scripts/weath.sh)
  echo " ^b$black^^c$green^ $weaths  "
}

get_title () {
  # using "  " to get more margin in the bar (problems at patch, and idk how to really fix it lmao)
  #echo "$(get_playerctl)$(get_vol)$(get_date)"
  echo "$(get_playerctl)$(get_wifis)$(get_vol)$(get_date)"
}


while :; do
  xsetroot -name "$(get_title)"
  #sleep 0.5
done &
