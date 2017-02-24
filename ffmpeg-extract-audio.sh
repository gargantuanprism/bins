#!/bin/bash

ffmpeg -i "$1" -b:a 192K -vn "$2"

