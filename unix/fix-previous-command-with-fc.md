# Fix Previous Command With fc

The `fc` command is a Bash and ZSH built-in command that allows you to interact
with the history of commands issued in the shell. The most straightforward use
case I know of for using this command is to fix or edit some aspect of the
previous run command.

When `fc` is executed with no arguments or flags, it will grab the latest entry
to the command history and load it into your default editor. For me, that is
Vim.

I can make edits in that Vim session like I'd do in any other Vim session. When
I write and quit (`:wq`) the file, the updated command will be executed. This
is useful if, say, I've made a typo in the previous command and would prefer
the ergonomics of my default editor to fix it. Or let's say I have a really
long command with many flags and long file path arguments. It would be much
easier and quicker to edit those paths from my editor than from the terminal
prompt.

If I've opened my editor (Vim) with `fc` and I decide I don't want to execute
the command after all, I can _compiler quit_ Vim (exit with an error code)
using `:cq`. The command will not be executed in this case.

See `man zshbuiltins` for more details about this command and all of its flags.

[source](https://www.computerhope.com/unix/uhistory.htm)
