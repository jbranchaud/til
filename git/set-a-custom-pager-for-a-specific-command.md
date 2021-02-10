# Set A Custom Pager For A Specific Command

The pager can be [configured globally](configuring-the-pager.md), for [one run
of a command](turn-off-the-output-pager-for-one-command.md), or as I'll explain
in this post, for a specific command.

_I explore all of this in [Optimize the way Git displays the output of
commands](https://www.youtube.com/watch?v=VpFldePcu_w)._

Let's assume a git configuration that uses `less` for any command that need a
pager. Perhaps you'd like for the `git show` to work a bit differently than
other commands. You want it to use `less` with the `-F` and `-X` flags.

A custom pager command can be set for any command in the `[pager]` section of
the `~/.gitconfig` file.

```
[pager]
  show = "less -FX"
```

If you want to turn off the pager for a specific command, set it to the boolean
value `false` instead.

```
[pager]
  show = false
```

See `man git-config` for more details in the `core.pager` and `pager.<cmd>`
sections.
