#!/bin/bash

CMD="/usr/bin/rclone sync -q \
  --skip-links \
  --exclude-from $HOME/.rclone-exclude \
  --b2-hard-delete"

$CMD /home/andrew backblaze:boneship-home
$CMD /mnt/win8/Users/andrew backblaze:boneship-win8

if [ $? -eq 0 ]; then
  date > $HOME/.last-backup
fi

