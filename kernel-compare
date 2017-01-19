#!/bin/bash

PATTERN='[[:digit:]]\+.[[:digit:]]\+.[[:digit:]]\+-[[:digit:]]\+'

RUNNING=`uname -r | grep -o $PATTERN`
INSTALLED=`pacman -Qi linux | grep Version | grep -o $PATTERN`

echo running:   $RUNNING
echo installed: $INSTALLED

if [ "$RUNNING" == "$INSTALLED" ]; then
  echo 'YES YES YES YES YES YES'
else
  echo 'NO NO NO NO NO'
fi

