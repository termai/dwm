#!/bin/bash

#/usr/local/bin/eww open newbar --config ~/.config/eww/bar_light
#/usr/local/bin/eww open newbar --config ~/.config/eww/bar_xmonad
#/usr/local/bin/eww open dwmbar --config ~/.config/eww/bar_dwm

#Main Bar
/usr/local/bin/eww open dwmbar --config ~/.config/eww/bar_dwm2
wait 2
xdotool key super+shift+apostrophe
eww close wifi-wid --config /home/termai/.config/eww/bar_dwm2/widgets/wifi-wid
#/usr/local/bin/eww open bar2 --config /home/termai/.config/eww/bar_dwm2/widgets/bar2

#/usr/local/bin/eww open dwmbar --config /home/termai/.config/eww/bar_dwm3
