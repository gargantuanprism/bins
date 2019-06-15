#!/bin/bash

xrandr --output eDP-1 --off --output DP-2 --auto

tmux select-layout -t terms \
  "7106,426x127,0,0{176x127,0,0,1,249x127,177,0[249x64,177,0{124x64,177,0,5,124x64,302,0,6},249x62,177,65{124x62,177,65,7,124x62,302,65,8}]}"

