#!/bin/sh


battery() {

  cat /sys/class/power_supply/BAT1/capacity
}

onoroff() {
  amixer | awk 'FNR==6 {print $6}' | sed 's/[][]//g'
}

wm() {
  wm=$XDG_CURRENT_DESKTOP
  [ "$wm" ] || wm=$DESKTOP_SESSION

  ## WM/DE
  [ ! "$wm" ] &&
    # loop over all processes and check the binary name
    for i in /proc/*/comm; do
      read -r c <"$i"
      case $c in
      *bar*) ;;
      awesome | xmonad* | qtile | sway | i3 | [bfo]*box | *wm*)
        wm=${c%%-*}
        break
        ;;
      esac
    done

  pkill $wm
}

tagcheck() {
  var=$(xdotool get_desktop)
  if [ "$var" == 2 ]
  then
    echo "Yes"
  else
    echo "No, It's $var"
  fi
}

eww() {
  /usr/local/bin/eww open newbar --config ~/.config/eww/bar
}

title() {
  title=$(xprop | grep "WM_CLASS(STRING)" | awk '{print $3}' | tr -d "," | tr -d '"')
  echo $title
}

"$@"

