#!/bin/bash

dwm() {
  xrandr --output eDP-2 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-2 --off --output HDMI-1-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal
  #feh --bg-fill -r -z ~/wallpapers3/1319293.jpeg
  feh --bg-fill -r -z ~/wallpapers/
  picomcall &
  playerctld daemon &
  while type dwm >/dev/null ; do dwm && continue || break ;done
}

chadwm() {
  xrandr --output eDP-2 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-2 --off --output HDMI-1-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal
  #feh --bg-fill -r -z ~/wallpapers3/1319293.jpeg
  feh --bg-fill -r -z ~/wallpapers/
  picomcall &
  playerctld daemon &
  while type dwm >/dev/null ; do dwm && continue || break ;done
}

xmonad() {
  xrandr --output eDP-2 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-2 --off --output HDMI-1-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal
  feh --bg-fill -z ~/wallpapers3/1319293.jpeg
  picomcall &
  playerctld daemon &
  xsetroot -cursor_name left_ptr
  exec xmonad
}


bspwm() {
  xrandr --output eDP-2 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-2 --off --output HDMI-1-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal
  playerctld daemon &
  exec bspwm

}

herbstluftwm() {
  xrandr --output eDP-2 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-2 --off --output HDMI-1-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal
  feh --bg-fill -r -z ~/wallpapers/
  picomcall &
  playerctld daemon &
  exec herbstluftwm
}




"$@"
