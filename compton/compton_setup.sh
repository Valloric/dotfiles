#!/bin/bash

set -e

script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

mkdir -p ~/.config
cp -f $script_dir/compton.conf ~/.config/compton.conf

