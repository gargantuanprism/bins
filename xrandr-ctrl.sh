#!/bin/bash

xrandr \
  --output DP-2 --primary --auto \
  --output eDP-1 --mode 1920x1080 --right-of DP-2

tmux select-layout -t terms \
  "a928,319x94,0,0{122x94,0,0,1,196x94,123,0[196x47,123,0{98x47,123,0,5,97x47,222,0,6},196x46,123,48{98x46,123,48,7,97x46,222,48,8}]}"

