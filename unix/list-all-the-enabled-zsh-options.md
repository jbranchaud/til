# List All The Enabled ZSH Options

The zsh shell has a [ton of
options](https://zsh.sourceforge.io/Doc/Release/Options.html) that can be
enabled and disabled for all kinds of functionality. Some of these options are
enabled by default, some of them may be enabled by a script like
[oh-my-zsh](https://ohmyz.sh/), and even more might have been enabled or
disabled by you in your `~/.zshrc` file.

To quickly produce a list of all options that are currently enabled, run:

```bash
$ setopt
```

All enabled options will be output by that command. That might be a lot of
output, so if you know what you are looking for, you can `grep` through the
output. Or, even better, if you have [`fzf`](https://github.com/junegunn/fzf)
installed, you can interactively fuzzy search through it.

```bash
$ setopt | fzf
```

[source](https://unix.stackexchange.com/questions/121802/zsh-how-to-check-if-an-option-is-enabled/121810#121810)
