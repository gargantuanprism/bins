#!/bin/bash

filename=$(basename "$1")
extension="${filename##*.}"
filename="${filename%.*}"

ffmpeg -i "$1" -acodec mp3 -f wav $filename.mp3
