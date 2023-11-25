#!/bin/sh

wal -i /home/termai/wallpapers3/602575.png
#wal -i /home/termai/wallpapers3/
cat $HOME/.cache/wal/colors.Xresources > ~/.Xresources
xrdb -merge ~/.Xresources &
/opt/oomox/plugins/theme_oomox/change_color.sh ~/.cache/wal/colors-oomox
cp /home/termai/.cache/wal/colors-wal.vim /home/termai/.config/nvim/colors/colors-wal.vim
