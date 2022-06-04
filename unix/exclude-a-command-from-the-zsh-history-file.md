# Exclude A Command From The ZSH History File

The `zsh` shell can be configured to record the commands you run from the
terminal in a history file. This is great for recalling and retrieving past
commands that you want to run again.

What about commands that I don't want written to a file on my machine? For
instance, if I'm running a command that includes a password, secret key, or
some other sensitive value, I don't want that saved in plaintext on my machine.

`zsh` has an affordance for this with the `hist_ignore_space` option. With that
option enabled, any command preceded by a space (`' '`) will be excluded from
the history file.

First, turn it on.

```zsh
$ setopt hist_ignore_space
```

Now, try a couple commands and see what shows up in the file.

```zsh
$ echo 'this command will be saved in history'
this command will be saved in history

$  echo 'this will be kept secret'
this will be kept secret

$ tail ~/.zsh_history
: 1654378676:0;echo 'this command will be saved in history'
: 1654378690:0;tail ~/.zsh_history
```

Notice how the second command with the prefixed space is excluded.

[source](https://unix.stackexchange.com/a/6104/5916)
