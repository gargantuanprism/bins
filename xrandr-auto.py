#!/usr/bin/env python2

import subprocess
import os

EXTERN_OFF = 'xrandr --output %s --off --output eDP1 --auto'
EXTERN_ON = 'xrandr --output eDP1 --off --output %s --auto'

def extern(output, action='on'):
    base = EXTERN_ON if action == 'on' else EXTERN_OFF
    cmd = base % output
    print cmd
    os.system(cmd)

if __name__ == '__main__':
    xrandr_output = subprocess.check_output(['xrandr'])

    # asus + monitor
    if 'HDMI2 connected' in xrandr_output:
        extern('HDMI2')

    # asus
    elif 'HDMI2 disconnected' in xrandr_output:
        extern('HDMI2', 'off')

    # dell + monitor
    elif 'DP1 connected' in xrandr_output:
        extern('DP1')

    # dell
    elif 'DP1 disconnected' in xrandr_output:
        extern('DP1', 'off')

