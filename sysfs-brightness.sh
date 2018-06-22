#!/bin/bash -x

BASE=/sys/class/backlight/intel_backlight
MAX=`cat $BASE/max_brightness`
CUR=`cat $BASE/brightness`
STEP=100

if [ "$1" == "inc" ]; then
  NEW_VAL=$((CUR + STEP))

  if [ "$NEW_VAL" -gt "$MAX" ]; then
    NEW_VAL=$MAX
  fi

elif [ "$1" == "dec" ]; then
  NEW_VAL=$((CUR - STEP))

  if [ "$NEW_VAL" -lt 0 ]; then
    NEW_VAL=0
  fi
fi

echo $NEW_VAL > $BASE/brightness
cat $BASE/brightness

