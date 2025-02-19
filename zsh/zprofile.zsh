# macOS PATH Reordering Fix
#
# Problem:
#   On macOS, the system modifies the PATH environment variable after .zshenv is
#   processed but before .zshrc runs. This happens in /etc/zprofile, which calls
#   /usr/libexec/path_helper. The path_helper reads paths from /etc/paths and
#   /etc/paths.d/* and prepends them to PATH. This behavior overrides custom
#   PATH settings defined in .zshenv.
#
# This script fixes the PATH ordering by:
# 1. Checking if we're running on macOS
# 2. Looking for ~/bin in the PATH (which should be first according to .zshenv)
# 3. If ~/bin isn't first, taking all paths that appear before it and moving them
#    to the end of PATH
#
# Result:
#   PATH ends up with:
#   1. ~/bin first (as intended in .zshenv)
#   2. Followed by other custom paths from .zshenv
#   3. Followed by system paths that macOS prepended
#
# This maintains our desired PATH order while still including all system paths.

if [[ "$(uname)" == "Darwin" ]]; then
    # Expand ~/bin to full path
    home_bin="${HOME}/bin"

    # Convert PATH to array
    path_array=(${(s/:/)PATH})

    # Find position of ~/bin
    home_bin_index=${path_array[(i)$home_bin]}

    # Check if ~/bin is not first (index > 1)
    if (( home_bin_index > 1 )); then
        # Get all paths before ~/bin
        before_paths=("${path_array[@]:0:$((home_bin_index-1))}")
        # Get ~/bin and everything after it
        after_paths=("${path_array[@]:$((home_bin_index-1))}")

        # Create new PATH with desired order
        export PATH="${(j/:/)after_paths}:${(j/:/)before_paths}"
    fi
fi
