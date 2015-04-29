#!/bin/bash

set -e

script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

cp -f $script_dir/Xdefaults ~/.Xdefaults

perl_ext=$script_dir/perl-extensions
perl -i -p -e "s!PATH_TO_PERL_EXT!$perl_ext!ig" ~/.Xdefaults
