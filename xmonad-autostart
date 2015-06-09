#!/bin/bash

~/.screenlayout/xrandr-work.sh
sleep 5

# background
trayer.sh &
kupfer --no-splash &
dropbox &
nm-applet &
parcellite &
xscreensaver -no-splash &
feh --bg-fill ~/Downloads/Sunburst_Rays_2880x1800.png &
xflux -z 02143 &
dunst &

# qt workaround
xprop -remove _NET_WORKAREA -root

# set default cursor
xsetroot -cursor_name left_ptr

# windows
tmux-start &
emacs &
