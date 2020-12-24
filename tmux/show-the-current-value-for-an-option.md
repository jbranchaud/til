# Show The Current Value For An Option

In the `~/.tmux.conf` file, you are able to define and override the values of
various options. Outside of explicitly setting an option, you may want to know
what its value is.

Perhaps it is unset, perhaps you don't remember, or maybe this particular
session or pane is different than the global config.

Either from the CLI, you can run the `tmux` command to check:

`$ tmux show-option -g history-limit`

Or as a command to tmux, using your prefix:

`:show-option -g history-limit`

The `-g` flag will tell you the option's value as set globally for tmux. `-w`
for window, `-p` for pane, or no flag for the current session.

See `man tmux` for more details.
