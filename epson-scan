#!/bin/bash

# Probably system-dependent
DEVICE="plustek:libusb:005:004"
DEPTH=14
MODE=Color
RES=100

# These seem to be max values for the Epson Perfection 1250
X=215
Y=297

scanimage \
    --mode "$MODE" \
    --depth "$DEPTH" \
    --resolution "$RES" \
    -x "$X" -y "$Y" \
    --device "$DEVICE" \
    | convert - "$1.png"
