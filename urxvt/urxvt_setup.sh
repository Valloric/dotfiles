#!/bin/bash

set -e

script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Check the Xdefaults file for syntax errors, like ' chars in comments
if command -v xrdb >/dev/null 2>&1;
then
  xrdb -n $script_dir/Xdefaults 2>&1 >/dev/null
fi

cp -f $script_dir/Xdefaults ~/.Xdefaults

perl_ext=$script_dir/perl-extensions
perl -i -p -e "s!PATH_TO_PERL_EXT!$perl_ext!ig" ~/.Xdefaults
