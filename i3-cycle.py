#!/usr/bin/env python2

import json

import i3

SUPPORTED_LAYOUTS = ('tabbed', 'stacked')

def get_focused_workspace():
    """
    Gets the currently focused i3 workspace.

    Returns:
        dict: i3 workspace object
    """

    return filter(lambda w: w['focused'], i3.get_workspaces())[0]

def cycle():
    """
    Cycles the windows in an i3 tabbed or stacked layout that is the direct
    child of a workspace container.
    """

    # Get focused workspace name
    wksp_name = get_focused_workspace()['name']

    # Get actual workspace tree object
    wksp = i3.filter(type='workspace', name=wksp_name)[0]

    # Get first tabbed layout
    tabbed_con = filter(lambda n: n['layout'] in SUPPORTED_LAYOUTS, 
            wksp['nodes'])[0]

    # Get list of unfocused containers in the tabbed layout
    unfocused_windows = filter(lambda n: not n['focused'], tabbed_con['nodes'])

    if len(unfocused_windows) > 0:
        i3.focus(con_id=unfocused_windows[0]['id'])

if __name__ == '__main__':
    cycle()

