#!/bin/sh

wal -i /home/termai/wallpapers/wallhaven-4x1owz.jpg
cat $HOME/.cache/wal/colors.Xresources > ~/.Xresources
xrdb -merge ~/.Xresources &
xdotool key super+F5
