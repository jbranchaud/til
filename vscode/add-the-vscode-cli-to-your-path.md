# Add The VSCode CLI To Your Path

Visual Studio Code has a command line tool that can do a bunch of things.
Perhaps the most common is opening up the current directory from the
command line.

First, you need to add `code` to your path. This can be done from within
Code itself.

Hit `Cmd+Shift+p` to pop open the command palette. Then start typing `Shell
Command ...` until the `Shell Command: Install "code" command in shell PATH`
option appears. Select this and Code will add `code` to your path.

Try `code .` to open the current directory or run `code --help` for more
details on what's available.
