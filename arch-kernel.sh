#!/bin/bash

INSTALLED=`pacman -Qi linux | sed '2!d' | cut -b 19-`
RUNNING=`uname -r`

echo "Installed: $INSTALLED"
echo "Running:   $RUNNING"

