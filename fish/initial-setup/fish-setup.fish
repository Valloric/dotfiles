#!/usr/bin/env fish
#
# Initial setup for Fish shell, called by setup_dotfiles.sh

# Fisher completely falls over if the state it stored in
# $__fish_config_dir/fish_variables is missing. $__fish_config_dir/fish_plugins
# being the source-of-truth for installed plugins is a lie.
#
# So we have to work the bugs and the misdesign. We keep a local copy of
# upstream fisher in fisher-copy.fish to avoid downloading it for the initial
# install. That file is ONLY used for initial fisher setup. After it is sourced,
# it installs itself and the other plugins "properly".
if test ! -e $__fish_config_dir/fish_plugins
    # Fresh host, fisher needs to be installed.
    echo "Installing fisher..."
    rm -rf $fisher_path

    set actual_fisher_plugins \
        jorgebucaran/fisher \
        patrickf1/fzf.fish \
        franciscolourenco/done \
        jorgebucaran/autopair.fish \
        jhillyerd/plugin-git

    source $__fish_config_dir/initial-setup/fisher-copy.fish
    fisher install $actual_fisher_plugins
    echo "Installed fisher plugins..."
end
