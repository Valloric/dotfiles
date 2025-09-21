#!/usr/bin/env fish

# Suppress fish greeting
set -g fish_greeting

abbr -a v vim
abbr -a c code
abbr -a cn "code --new-window"
abbr -a cr "code --reuse-window"

abbr -a j just
abbr -a y yarn
abbr -a p podman

# We now use this instead of acksed (above)
abbr -a fm fastmod

# mercurial aliases
# using chg, the C wrapper around hg for faster startup
abbr -a h chg

# Using eza as a fancier ls. "ll" shows hidden files as well.
alias l="eza --icons=auto --group-directories-first -l" # intentional alias
alias ll="eza --icons=auto --group-directories-first -la" # intentional alias

# systemd aliases
abbr -a sc systemctl
abbr -a scr 'systemctl daemon-reload'
abbr -a scu 'systemctl --user'
abbr -a scur 'systemctl --user daemon-reload'
abbr -a jc 'journalctl --boot'
abbr -a jcs 'journalctl --boot --pager-end --unit'
abbr -a jcu 'journalctl --user --boot'
abbr -a jcus 'journalctl --user --boot --pager-end --unit'

# rust cargo aliases
abbr -a ck "cargo check"
abbr -a ct "cargo test"
abbr -a cb "cargo build"
abbr -a cbr "cargo build --release"
abbr -a cf "cargo fmt"
abbr -a cc "cargo clippy --all-targets --all-features -- -D warnings"

# rustc hacking
abbr -a xc "python3 ./x.py check"
abbr -a xt "python3 ./x.py test tidy"
abbr -a bs1 "python3 ./x.py build --stage 1"
abbr -a bsk1 "python3 ./x.py build --stage 1 --keep-stage 1"
abbr -a ts1 "python3 ./x.py test --stage 1"
abbr -a tsk1 "python3 ./x.py test --stage 1 --keep-stage 1"

# Create bat->batcat alias only if batcat exists. On debian, `bat` is installed
# as `batcat` due to a name conflict.
if command -q batcat
    alias bat="batcat" # intentionally an alias and not an abbr
end

# GLOBAL alias for "pipe to less", which works anywhere on the line. Must be
# surrounded by whitespace and not be in quotes to be expanded.
if command -q bat
    abbr -a L --position anywhere --set-cursor '% | bat'
else if command -q batcat
    abbr -a L --position anywhere --set-cursor '% | batcat'
else
    abbr -a L --position anywhere --set-cursor '% | less'
end

# For looking at multiple files in one scrolling view with filenames between
# them. Use like so: batn *.txt
alias batn="bat --style=header,rule --decorations=always" # intentional alias

# Make cp try to use a cheap reflink copy if the underlying filesystem supports
# it (BTRFS, ZFS, XFS and others).
alias cp="cp --reflink=auto" # intentional alias

###########
# ENV VARS
###########

if status is-interactive
    # FZF setup; https://github.com/junegunn/fzf
    # Also install `fd-find` for faster file listing.
    set -x FZF_DEFAULT_OPTS "
    --color fg:252,bg:233,hl:67,fg+:252,bg+:235,hl+:81
    --color info:144,prompt:161,spinner:135,pointer:135,marker:118
    "

    # needed for gpg-agent to work right
    set -x GPG_TTY (tty)

    # Set various EDITOR env vars; it's always `vim`
    set -x EDITOR vim
    set -x SVN_EDITOR $EDITOR
    set -x VISUAL $EDITOR
    set -x GIT_EDITOR $EDITOR
    set -x HGEDITOR $EDITOR

    # Set the config file for `bat`
    set -x BAT_CONFIG_PATH ~/dotfiles/misc/batrc

    # Load our `less` and `man` configs
    source ~/dotfiles/less/lessrc.fish
    source ~/dotfiles/man/manrc.fish

end

# Python, my man, please stop littering my repos with pyc files!
set -gx PYTHONPYCACHEPREFIX "$TMPDIR"

# GC time for unused Mosh sessions. Value is 3 days in seconds.
set -gx MOSH_SERVER_NETWORK_TMOUT 259200

##########
# VI mode
##########

# Set up vi-mode while preserving default fish shorcuts
function fish_hybrid_key_bindings
    for mode in default insert visual
        fish_default_key_bindings -M $mode
    end
    fish_vi_key_bindings --no-erase insert
end
set -g fish_key_bindings fish_hybrid_key_bindings
# Make ,. exit vi insert and visual mode
bind --mode insert --sets-mode default comma,. repaint-mode
bind --mode visual --sets-mode default comma,. repaint-mode

################
# PATH HANDLING
################

# Use the built-in `fish_add_path` command to safely modify the PATH. It's
# better than manually constructing the PATH string as it avoids duplicates.

# These paths are PREPENDED to the PATH (`fish_add_path` default).
# We list them in reverse order of precedence, so the last one called (`~/bin`)
# ends up first.
fish_add_path /snap/bin
fish_add_path /usr/local/bin
fish_add_path /opt/homebrew/sbin
fish_add_path /opt/homebrew/bin
fish_add_path ~/.local/bin
fish_add_path ~/bin

# These paths are APPENDED to the PATH.
fish_add_path --append ~/.juliaup/bin
fish_add_path --append ~/.cargo/bin
fish_add_path --append ~/.yarn/bin
fish_add_path --append ~/.rvm/bin
fish_add_path --append ~/.npm-global/bin
fish_add_path --append ~/.lmstudio/bin

if test (uname) = Darwin
    # This makes our PATH visible to GUI apps on macOS.  In Fish, $PATH is an
    # array, so we must join it into a string for launchctl.
    launchctl setenv PATH (string join ":" $PATH)
else
    # Fish treats colon-delimited variables like XDG_DATA_DIRS as paths, so we
    # can prepend to it like we do with PATH.
    set -x XDG_DATA_DIRS ~/.local/share/flatpak/exports/share /var/lib/flatpak/exports/share $XDG_DATA_DIRS
end

##########
# PLUGINS
##########

if functions -q tide
    # Avoid tide (fancy prompt) interactive config running on new
    # machines... or worse, an entirely "invisible" prompt being shown.
    tide configure --auto --style=Lean --prompt_colors='True color' --show_time='24-hour format' --lean_prompt_height='Two lines' --prompt_connection=Disconnected --prompt_spacing=Compact --icons='Few icons' --transient=No
end
