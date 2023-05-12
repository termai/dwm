#!/bin/sh

wal -i /home/termi/wallpapers
cat $HOME/.cache/wal/colors.Xresources > ~/.Xresources
xrdb -merge ~/.Xresources &
xdotool key super+F5
