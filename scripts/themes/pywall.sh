#!/bin/sh

wal -i /home/termai/wallpapers
cat $HOME/.cache/wal/colors.Xresources > ~/.Xresources
xrdb -merge ~/.Xresources &
xdotool key super+F5
#/usr/local/bin/eww reload --config ~/.config/eww/bar
#/usr/local/bin/eww open newbar --config ~/.config/eww/bar
#/usr/local/bin/eww open newbar --config ~/.config/eww/bar
#pywalfox update
/opt/oomox/plugins/theme_oomox/change_color.sh ~/.cache/wal/colors-oomox
/opt/oomox/plugins/oomoxify/oomoxify.sh -s /opt/spotify/Apps ~/.cache/wal/colors-oomox
cp /home/termai/.cache/wal/colors-wal.vim /home/termai/.config/nvim/colors/colors-wal.vim
#/home/termai/.local/bin/genzathurarc > ~/.config/zathura/zathurarc
#genzathurarc > ~/.config/zathura/zathurarc