#!/bin/bash

STATUS_PATH=/sys/class/drm/card0-DP-1/status
STATE_PATH=/tmp/display-checker.state
SLEEP=1

while true; do
  status=`cat $STATUS_PATH`
  state=`cat $STATE_PATH`

  if [ $status == 'connected' ]; then
    if [ $state != 'ext' ]; then
      xrandr --output eDP-1 --off --output DP-1 --auto
    fi

    echo 'ext' > $STATE_PATH

  else
    if [ $state != 'laptop' ]; then
      xrandr --output DP-1 --off --output eDP-1 --auto
    fi

    echo 'laptop' > $STATE_PATH
  fi

  sleep $SLEEP
done

