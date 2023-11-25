#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config.ini
#polybar termi 2>&1 | tee -a /tmp/polybar.log & disown
#polybar termi -c /home/termi/.config/polybar/config.ini &
polybar right -c /home/termai/.config/polybar/config.ini &
polybar center -c /home/termai/.config/polybar/config.ini &
polybar left -c /home/termai/.config/polybar/config.ini &
