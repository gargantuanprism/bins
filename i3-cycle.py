#!/usr/bin/env python2

import json
import tempfile
import os

import i3

LAST_FOCUS_FILE = '%s/i3-last-focus' % tempfile.gettempdir()

def _load():
    if os.path.exists(LAST_FOCUS_FILE):
        with open(LAST_FOCUS_FILE) as f:
            return int(f.read())

    return None

def _write(window_id):
    with open(LAST_FOCUS_FILE, 'w') as f:
        f.write(str(window_id))

def _get_focused_workspace():
    """
    Gets the currently focused i3 workspace.

    Returns:
        dict: i3 workspace object
    """

    return filter(lambda w: w['focused'], i3.get_workspaces())[0]

def _leaves(nodes):
    for node in nodes:
        if len(node['nodes']) == 0:
            return nodes
        else:
            return _leaves(node['nodes'])

def cycle():
    """
    Cycles the windows in an i3 workspace.
    """

    last_focused_id = _load()

    # Get focused workspace name
    wksp_name = _get_focused_workspace()['name']

    # Get actual workspace tree object
    wksp = i3.filter(type='workspace', name=wksp_name)[0]

    # Get list of all windows in workspace
    wksp_windows = _leaves(wksp['nodes'])
    window_ids = map(lambda n: n['id'], wksp_windows)

    # Go to next window if saved state exists
    if last_focused_id in window_ids:
        next_idx = window_ids.index(last_focused_id) + 1

        if next_idx >= len(wksp_windows):
            next_idx = 0

        next_focus_id = wksp_windows[next_idx]['id']

    # Set default state, first unfocused
    else:
        unfocused = filter(lambda n: not n['focused'], wksp_windows)
        next_focus_id = unfocused[0]['id']

    _write(next_focus_id)
    i3.focus(con_id=next_focus_id)

if __name__ == '__main__':
    from pprint import pprint

    cycle()

