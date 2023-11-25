#!/bin/bash

# Path to your xmonad.hs configuration file
config_file="/home/termai/.config/xmonad/xmonad.hs"

# Check if myBorderWidth is set to 0 in the configuration file
if grep -q "myBorderWidth = 0" "$config_file"; then
  # Replace 0 with 2 in the configuration file
  sed -i 's/myBorderWidth = 0/myBorderWidth = 2/' "$config_file"
else
  # Replace 2 with 0 in the configuration file
  sed -i 's/myBorderWidth = 2/myBorderWidth = 0/' "$config_file"
fi
xdotool key super+shift+q
