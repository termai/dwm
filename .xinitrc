#!/bin/sh



userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#Xmonad
#xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-2 --off --output HDMI-1-1 --mode 1920x1080 --pos 0x0 --rotate normal
feh --bg-fill -r -z ~/wallpapers3/
#feh --bg-fill -z /home/termai/wallpapers3/dock.png
#picomcall &
playerctld daemon &
/home/termai/scripts/nightlight.sh &
#/home/termai/scripts/was.sh &
#systemctl --user start dunst
#/home/termai/.config/eww/bar_dwm2/scripts/cover-song.sh &
#xsetroot -cursor_name left_ptr &
#while type dwm >/dev/null ; do dwm && continue || break ;done 
dwmblocks &
while :; do
	ssh-agent dwm
done
#while true; do /usr/local/bin/dwm 2> ~/.dwm.log && continue || break ;done
#xdotool key super+1
