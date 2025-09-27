#!/usr/bin/env fish
# -----------------------------------------------------------------------------
# LESS - The Pager
#
# A modern, feature-rich configuration for the `less` pager.
# It enables true color, italics, mouse/touchpad scrolling, and other
# quality-of-life improvements.
#
# NOTE: There's is no such thing as a ".lessrc" file that LESS will read by
# default. We source this file manually in zshenv.
# -----------------------------------------------------------------------------

# Set the default options for less.
# -R: Output raw control characters (enables colors)
# -i: Case-insensitive search
# -F: Quit if the entire file fits on one screen
# -X: Do not clear the screen on exit
# --mouse: Enable mouse wheel scrolling
# --tabs=2: Set tab width to 2 spaces
set -x LESS '-RiFX --mouse --tabs=2'

# Set the prompt style for less.
# This provides detailed information at the bottom of the screen.
set -x LESSSECUREPROMPT "[1;31m(press q to quit)[0m"
set -x LESSPROMPT '?f%f .?ltLine %lt-%lb?L of %L.?pB(%pB%%) .?e(END) ?x- Next: %x.:%SECUREPROMPT'

# Define colors and text styles using ANSI escape codes for performance.
# This avoids forking `tput` on every shell startup.
#
# \e[1m  -> Bold
# \e[3m  -> Italic
# \e[4m  -> Underline
# \e[7m  -> Reverse video
# \e[23m -> End Italic
# \e[24m -> End Underline
# \e[0m  -> Reset all attributes
#
# Colors: 31=red, 32=green, 33=yellow, 34=blue, 35=magenta, 36=cyan
#
set -x LESS_TERMCAP_mb "[1;31m" # Start blinking (for prompts)
set -x LESS_TERMCAP_md "[1;36m" # Start bold (used for manpage titles)
set -x LESS_TERMCAP_so "[1;33;44m" # Start standout (search results)
set -x LESS_TERMCAP_us "[3;32m" # Start underline -> RENDER AS ITALIC (green)
set -x LESS_TERMCAP_me "[0m" # End all modes (bold, standout, underline)
set -x LESS_TERMCAP_se "[0m"
set -x LESS_TERMCAP_ue "[0m"
