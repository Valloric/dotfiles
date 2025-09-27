# Python, my man, please stop littering my repos with pyc files!
set -gx PYTHONPYCACHEPREFIX "$TMPDIR"

# GC time for unused Mosh sessions. Value is 3 days in seconds.
set -gx MOSH_SERVER_NETWORK_TMOUT 259200

if ! status is-interactive
    return
end

# Disables the ugly text underlining for "valid paths"
set -g fish_color_valid_path ''

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
