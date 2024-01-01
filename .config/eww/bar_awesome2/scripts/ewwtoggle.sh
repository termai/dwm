#!/bin/sh
# This shell script is PUBLIC DOMAIN. You may do whatever you want with it.

TOGGLE=$HOME/.toggle

if [ ! -e $TOGGLE ]; then
    touch $TOGGLE
    pkill eww
else
    rm $TOGGLE
    /usr/local/bin/eww open aw2 --config ~/.config/eww/bar_awesome2/
fi
