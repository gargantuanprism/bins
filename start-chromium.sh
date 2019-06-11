#!/bin/bash

CMD=`which chromium || echo chromium-browser`
PROFILE_BASE=$HOME/.config/chromium
profile=

while getopts ":p:" opt; do
  case $opt in
    p)
      profile=$OPTARG
      ;;
  esac
done

echo $CMD
echo $profile
echo $PROFILE_BASE.$profile

if [ -z "$profile" ]; then
  $CMD
else
  $CMD --user-data-dir=$PROFILE_BASE.$profile
fi

