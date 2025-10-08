#!/usr/bin/env fish
#
# Our abbrs and aliases.
# Some are aliases instead of abbrs because I don't want to see the expanded
# form every time I type in the command.

if ! status is-interactive
    return
end

abbr -a v vim
abbr -a c code
abbr -a cn code --new-window
abbr -a cr code --reuse-window

abbr -a j just
abbr -a y yarn
abbr -a p podman

# Convenience aliases for copy/pasting from/to the system clipboard.
alias clipcopy="fish_clipboard_copy" # alias, not abbr
alias clippaste="fish_clipboard_paste" # alias, not abbr

# We now use this instead of acksed (above)
abbr -a fm fastmod

# mercurial aliases
# using chg, the C wrapper around hg for faster startup
abbr -a h chg

# Using eza as a fancier ls. "ll" shows hidden files as well.
alias l="eza --icons=auto --group-directories-first -l" # alias, not abbr
alias ll="eza --icons=auto --group-directories-first -la" # alias, not abbr

# systemd aliases
abbr -a sc sudo systemctl
abbr -a scc sudo systemctl cat
abbr -a scs sudo systemctl status
abbr -a scr sudo systemctl daemon-reload
abbr -a scu systemctl --user
abbr -a scus systemctl --user status
abbr -a scuc systemctl --user cat
abbr -a scur systemctl --user daemon-reload
abbr -a jc journalctl --boot
abbr -a jcs journalctl --boot --pager-end --unit
abbr -a jcu journalctl --user --boot
abbr -a jcus journalctl --user --boot --pager-end --unit

# rust cargo aliases
abbr -a ck cargo check
abbr -a ct cargo test
abbr -a cb cargo build
abbr -a cbr cargo build --release
abbr -a cf cargo fmt
abbr -a cc cargo clippy --all-targets --all-features -- -D warnings

# rustc hacking
abbr -a xc python3 ./x.py check
abbr -a xt python3 ./x.py test tidy
abbr -a bs1 python3 ./x.py build --stage 1
abbr -a bsk1 python3 ./x.py build --stage 1 --keep-stage 1
abbr -a ts1 python3 ./x.py test --stage 1
abbr -a tsk1 python3 ./x.py test --stage 1 --keep-stage 1

# Create bat->batcat alias only if batcat exists. On Debian, `bat` is
# installed as `batcat` due to a name conflict.
if command -q batcat
    alias bat="batcat" # alias, not abbr
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
alias batn="bat --style=header,rule --decorations=always" # alias, not abbr

# Similar to batcat->bat, Debian installs `fd` as `fdfind`.
if command -q fdfind
    alias fd="fdfind" # alias, not abbr
end

# Make cp try to use a cheap reflink copy if the underlying filesystem
# supports it (BTRFS, ZFS, XFS and others).
alias cp="cp --reflink=auto" # alias, not abbr

# Implement !! from bash; `last_history_item` is in functions/
abbr -a !! --position anywhere --function last_history_item
