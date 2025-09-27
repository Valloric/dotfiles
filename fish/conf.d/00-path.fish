#!/usr/bin/env fish
#
# Use the built-in `fish_add_path` command to safely modify the PATH. It's
# better than manually constructing the PATH string as it avoids duplicates.

# These paths are PREPENDED to the PATH (`fish_add_path` default).
# We list them in reverse order of precedence, so the last one called (`~/bin`)
# ends up first.
fish_add_path /snap/bin
fish_add_path /usr/local/bin
fish_add_path /opt/homebrew/sbin
fish_add_path /opt/homebrew/bin
fish_add_path ~/.local/bin
fish_add_path ~/bin

# These paths are APPENDED to the PATH.
fish_add_path --append ~/.juliaup/bin
fish_add_path --append ~/.cargo/bin
fish_add_path --append ~/.yarn/bin
fish_add_path --append ~/.rvm/bin
fish_add_path --append ~/.npm-global/bin
fish_add_path --append ~/.lmstudio/bin

if test (uname) = Darwin
    # This makes our PATH visible to GUI apps on macOS.  In Fish, $PATH is an
    # array, so we must join it into a string for launchctl.
    launchctl setenv PATH (string join ":" $PATH)
else
    # Fish treats colon-delimited variables like XDG_DATA_DIRS as paths, so we
    # can prepend to it like we do with PATH.
    set -x XDG_DATA_DIRS ~/.local/share/flatpak/exports/share \
        /var/lib/flatpak/exports/share $XDG_DATA_DIRS
end
