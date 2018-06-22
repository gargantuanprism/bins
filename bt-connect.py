#!/usr/bin/env python2

import argparse
import subprocess
import os

FNULL = open(os.devnull, 'w')

def search(term):
    cmd = (
        'echo devices '
        '| bluetoothctl '
        '| grep -v NEW '
        '| grep -i %s '
        '| cut -c 8-24 '
    ) % term

    return subprocess.check_output(cmd, shell=True, stderr=FNULL).strip()

def connect(mac):
    cmd = 'echo "connect %s" | bluetoothctl' % mac
    return subprocess.check_output(cmd, shell=True, stderr=FNULL)

def disconnect(mac):
    cmd = 'echo "disconnect %s" | bluetoothctl' % mac
    return subprocess.check_output(cmd, shell=True, stderr=FNULL)

parser = argparse.ArgumentParser()
parser.add_argument('-c', help='Connect to device')
parser.add_argument('-d', help='Disconnect from device')
args = parser.parse_args()

if args.c:
    connect(search(args.c))
elif args.d:
    disconnect(search(args.d))

