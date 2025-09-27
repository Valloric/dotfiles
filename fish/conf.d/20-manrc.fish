#!/usr/bin/env fish
# -----------------------------------------------------------------------------
# MAN - The Manual
#
# Modern config for `man`. Synergizes with our modern `less` config to use
# colors, bold, italics etc.
#
# NOTE: There's is no such thing as a ".manrc" file that `man` will read by
# default. We add this configuration to config.fish.
# -----------------------------------------------------------------------------

# `groff` is used by `man` and we want it to produce ANSI escape sequences
# that `less` knows how to render.
set -x GROFF_NO_SGR 1

# Use our configured less directly as the pager
set -x MANPAGER less

# MANOPT settings (space-separated options)
#
# --no-justification turns off the ugly text justification that `man` uses
# --no-hyphenation turns off the hyphenation too; plain right-ragged text, ty
set -x MANOPT "--no-justification --no-hyphenation"

# Preserve formatting when piping
set -x MAN_KEEP_FORMATTING 1

# Also see our `man` wrapper function in config.fish
# This is just a default.
set -x MANWIDTH 100
