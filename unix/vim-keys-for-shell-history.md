# Using VIM keybindings for shell navigation

You can switch most popular shells into 'vi mode' using 

bash/ash: `set -o vi`
csh/zsh: `bindkey -v`

While in this mode, the command line behaves like a one-line vi window,
following the normal vi insert and command modes.  The command
line starts off in insert mode, but pressing `esc` will enter command mode,
allowing `hjkl` navigation through the history buffer, as well as most
of the insert/delete/replace commands on the currently-visible command
line.

A fairly comprehensive list of supported commands (bash-specific) can
be found [here](http://www.catonmat.net/download/bash-vi-editing-mode-cheat-sheet.pdf)
