#!/bin/bash

set -e

script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

ln -s $script_dir/spacemacs.el ~/.spacemacs
ln -s $script_dir/e.sh ~/bin/e
