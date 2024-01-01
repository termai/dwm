#!/bin/bash

python3 /home/termai/suckless/more-dwm/modify_config.py

cd /home/termai/suckless/dwm

sudo -S make install <<< Abdul

xdotool key super+shift+q
