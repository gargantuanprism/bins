#!/usr/bin/env python2

from subprocess import check_output
import re

if __name__ == '__main__':
    total = None
    used = None
    lines = check_output(['vmstat', '-s']).split("\n")

    for line in lines:
        m = re.search('(\d+).+total memory', line)
        if m:
            total = float(m.group(1))

        m = re.search('(\d+).+used memory', line)
        if m:
            used = float(m.group(1))

        if total and used:
            break

    print 'mem: %d%%' % int(used / total * 100)

