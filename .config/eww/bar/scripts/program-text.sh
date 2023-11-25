#!/bin/bash
#
window_id=$(xdotool getwindowfocus)

# Use xprop to get the program name
program_name=$(xprop -id $window_id | grep "WM_CLASS(STRING)" | awk -F'"' '{print $4}')

echo "$program_name"

