#!/bin/bash

# get the dir of the current script
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

mkdir -p ~/.gnupg

# Handle gpg.conf
if [[ ! -e ~/.gnupg/gpg.conf ]]; then
  ln -s $script_dir/gpg.conf ~/.gnupg/gpg.conf
fi

# Find pinentry program
pinentry_path=$(which pinentry 2>/dev/null || which pinentry-curses 2>/dev/null || which pinentry-mac 2>/dev/null)

if [[ -z "$pinentry_path" ]]; then
  echo "Error: Could not find pinentry, pinentry-curses or pinentry-mac programs"
  exit 1
fi

# Remove existing gpg-agent.conf and create a fresh one
rm -f ~/.gnupg/gpg-agent.conf
sed "s|PINENTRY_PATH_HERE|$pinentry_path|g" "$script_dir/gpg-agent.conf" >~/.gnupg/gpg-agent.conf
