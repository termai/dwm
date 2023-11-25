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
c=#74bee9
white=#dee1e6
darks=#000000
purple=#b217e6
purples=#7888db


icon="󰗃"
mptitle=$(playerctl metadata --format "{{ title }}" | tr -d \"\"\")
mpartist=$(playerctl metadata artist)
mpmedia=$(echo "$mptitle")
mpmedias=$(echo "$mpmedia" | awk '{ if (length($0) <= 20) print; else print substr($0, 1, 20) "..." }')
#printf "^b$blue^^c$bg^ $icon ^b$bg^ ^c$cyan^$mpmedias ^b$bg^"
echo " ^c$cyan^  $mpmedias ^b$bg^ "
