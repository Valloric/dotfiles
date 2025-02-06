#!/usr/bin/env bash

# clipper - Universal clipboard utility for X11, Wayland, and macOS
# Usage: command | clipper
#        clipper < file
#        echo "text" | clipper

# Exit on error, undefined variables, and pipe failures
set -euo pipefail

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to check if we're connected to a terminal
is_interactive() {
    [ -t 0 ] && [ -t 1 ] && [ -t 2 ]
}

# Function to install missing dependencies
install_dependencies() {
    local package="$1"

    # If we're not in an interactive session, fail immediately
    if ! is_interactive; then
        echo "Error: Required package '$package' is not installed." >&2
        echo "Please install it manually:" >&2
        echo "  sudo apt install $package" >&2
        exit 1
    fi

    # Interactive installation for terminal sessions
    echo "The required package '$package' is not installed." >&2
    read -p "Would you like to install it? (y/N) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        if command_exists apt; then
            sudo apt install "$package"
        else
            echo "No supported package manager found. Please install '$package' manually." >&2
            exit 1
        fi
    else
        echo "Cannot proceed without $package. Exiting." >&2
        exit 1
    fi
}

# Detect the operating system and display server
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS clipboard handling (pbcopy is built-in)
    if [ -p /dev/stdin ]; then
        cat - | pbcopy
    else
        pbcopy
    fi
elif [ "${XDG_SESSION_TYPE:-x11}" = "wayland" ]; then
    # Wayland clipboard handling
    if ! command_exists wl-copy; then
        install_dependencies wl-clipboard
    fi
    if [ -p /dev/stdin ]; then
        cat - | wl-copy
    else
        wl-copy
    fi
else
    # X11 clipboard handling
    if ! command_exists xclip; then
        install_dependencies xclip
    fi
    if [ -p /dev/stdin ]; then
        cat - | xclip -selection clipboard
    else
        xclip -selection clipboard
    fi
fi