#!/bin/bash
# the stderr to /dev/null redirect is there to silence annoying "Loading..." messages
exec emacsclient --alternate-editor="" --create-frame "$@" 2>/dev/null
