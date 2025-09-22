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
        jhillyerd/plugin-git \
        ilancosman/tide@v6

    source $__fish_config_dir/initial-setup/fisher-copy.fish
    fisher install $actual_fisher_plugins
    echo "Installed fisher plugins..."
end

if functions -q tide
    # Set up tide (fancy prompt) config to avoid interactive setup on new
    # machines ... or worse, an entirely "invisible" prompt being shown.
    tide configure --auto --style=Lean --prompt_colors='True color' --show_time='24-hour format' --lean_prompt_height='Two lines' --prompt_connection=Disconnected --prompt_spacing=Compact --icons='Few icons' --transient=No
end
