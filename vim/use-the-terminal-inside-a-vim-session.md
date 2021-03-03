# Use The Terminal Inside A Vim Session

With [the release of Vim 8.1](https://www.vim.org/vim-8.1-released.php) comes
the ability to open a terminal window _within_ a Vim session.

The `:terminal` command (or `:term` for short) opens up a buffer window that
looks like a strange mix between any old Vim session and your terminal's shell
prompt.

Once the `:terminal` window is open, you can hit `i` to switch to
_terminal-mode_. This puts the cursor on the shell prompt so that you can start
executing shell commands. Once in this mode, you most of your keybindings will
be ignored as Vim is providing terminal emulation.

Once you are done with the terminal, you can type `exit` like you would in any
other shell and it will terminate that process.

Alternatively, you can hit `Ctrl-\ Ctrl-n` which takes you out of terminal-mode
and back into Normal mode. From here, you can use all the Vim things to
navigate, search, yank, etc. from the terminal output.

You can also (if `hidden` is set), switch to another buffer. The Vim `:term`
buffer is preserved and you can return to it later, hitting `i` to start
interacting with it again.

See `:h :term` for more details.
