#!/usr/bin/env bash
set -euo pipefail

# get the dir of the current script
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# Check if the 'zed' command exists
if ! command -v zed &>/dev/null; then
  echo "The 'zed' command (Zed editor) was not found on the PATH."
  echo "Aborting zed setup."
  exit 0
fi

# The `zed-configs` dir is linked directly to `~/.config/zed` so if zed decides
# to create any new config files, they will automatically end up in our
# dotfiles.
ln -s "$script_dir/zed-configs" ~/.config/zed
