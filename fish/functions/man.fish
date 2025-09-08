function man
    # Wrap `man` with a function that sets the right width.
    # We want a dynamically computed MANWIDTH and that needs extra work.

    # Create a local variable for the terminal columns.
    set -l term_cols (stty size | string split ' ')[2]

    # Create a local, exported MANWIDTH variable just for this command.
    if test $COLUMNS -gt 100
        set -x MANWIDTH 100
    else
        set -x MANWIDTH $COLUMNS
    end

    # Execute the actual 'man' command with the correct MANWIDTH.
    # 'command' ensures we don't call our own wrapper function recursively.
    command man $argv
end
