#!/bin/bash
#

appdash() {
  /usr/local/bin/eww open appdash --config ~/.config/eww/dash/
}

powerdash() {
  /usr/local/bin/eww open powerDash --config ~/.config/eww/power_dash/
}


"$@"

