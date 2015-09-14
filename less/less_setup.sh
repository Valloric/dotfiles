#!/bin/bash

set -e

script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

cp -f $script_dir/LESS_TERMCAP ~/.LESS_TERMCAP
