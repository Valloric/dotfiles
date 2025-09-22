#!/usr/bin/env fish
#
# We don't want Fisher shitting all over our Fish config directory, so
# we set up the Fisher plugin using (with modifications):
#   https://github.com/kidonng/fisher_path.fish
#
# Original discussion:
#   https://github.com/jorgebucaran/fisher/issues/640
set -g fisher_path $HOME/.local/share/fisher

set fish_complete_path $fish_complete_path[1] $fisher_path/completions $fish_complete_path[2..]
set fish_function_path $fish_function_path[1] $fisher_path/functions $fish_function_path[2..]

for file in $fisher_path/conf.d/*.fish
    if ! test -f (string replace --regex "^.*/" $__fish_config_dir/conf.d/ -- $file)
        and test -f $file && test -r $file
        source $file
    end
end
