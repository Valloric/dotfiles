#!/usr/bin/env fish
# Set up vi-mode while preserving default fish shorcuts

if ! status is-interactive
    return
end

function fish_hybrid_key_bindings
    for mode in default insert visual
        fish_default_key_bindings -M $mode
    end
    fish_vi_key_bindings --no-erase insert
end
set -g fish_key_bindings fish_hybrid_key_bindings
# Make ,. exit vi insert and visual mode
bind --mode insert --sets-mode default comma,. repaint-mode
bind --mode visual --sets-mode default comma,. repaint-mode
