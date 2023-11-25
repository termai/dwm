#!/bin/sh

#wal -i /home/termai/wallpapers3 --iterative
wal -i /home/termai/wallpapers3/1319293.jpeg --iterative
#wal -i /home/termai/Pictures/Screenshots/2023-09-17-00:47:07-screenshot.png
cat $HOME/.cache/wal/colors.Xresources > ~/.Xresources
xrdb -merge ~/.Xresources &
xdotool key super+F5
/usr/local/bin/eww reload --config ~/.config/eww/bar_dwm2
/usr/local/bin/eww open newbar --config ~/.config/eww/bar_dwm2
#/usr/local/bin/eww open newbar --config ~/.config/eww/bar_light
#pywalfox update
/opt/oomox/plugins/theme_oomox/change_color.sh ~/.cache/wal/colors-oomox
/opt/oomox/plugins/oomoxify/oomoxify.sh -s /opt/spotify/Apps ~/.cache/wal/colors-oomox
#cp /home/termai/.cache/wal/colors-wal.vim /home/termai/.config/nvim/colors/colors-wal.vim
#/home/termai/.local/bin/genzathurarc > ~/.config/zathura/zathurarc
#genzathurarc > ~/.config/zathura/zathurarc
