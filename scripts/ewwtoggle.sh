#!/bin/sh
# This shell script is PUBLIC DOMAIN. You may do whatever you want with it.

TOGGLE=$HOME/.toggle

if [ ! -e $TOGGLE ]; then
    touch $TOGGLE
    pkill eww
else
    rm $TOGGLE
    #/usr/local/bin/eww open dwmbar --config ~/.config/eww/bar_dwm
    /usr/local/bin/eww open dwmbar --config ~/.config/eww/bar_dwm2
    #/usr/local/bin/eww open dwmbar --config /home/termai/.config/eww/bar_dwm3
fi

#/usr/local/bin/eww close dwmbar --config ~/.config/eww/bar_dwm

