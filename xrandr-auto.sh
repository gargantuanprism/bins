#!/bin/bash

CONN=`xrandr | grep "^DP1 connected"`

if [ -z "$CONN" ]; then
  xrandr --output DP1 --off --output eDP1 --auto
else
  xrandr --output eDP1 --off --output DP1 --auto
fi

