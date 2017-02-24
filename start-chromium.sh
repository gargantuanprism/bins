#!/bin/bash

`which chromium`
if [ $? == 0 ]; then
  CMD=chromium
else
  CMD=chromium-browser
end

if [ -z "$1" ]; then
  $CMD
else
  $CMD --user-data-dir=$HOME/.config/chromium-$1
fi

