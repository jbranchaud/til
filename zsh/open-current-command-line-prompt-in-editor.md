# Open Current Command Line Prompt In Editor

The [`fc` builtin](/unix/fix-previous-command-with-fc.md) is a nice trick for
being able to open my default editor with the previous command loaded in. I can
make quick edits, save and quit, and the updated previous command will populate
my prompt.

What if I want to work from a blank prompt or I want to edit the command I've
already started typing out?

[`zsh`](https://github.com/zsh-users/zsh) has a solution for this via a contrib
widget, `edit-command-line`, that ships with `zsh`. I can load this widget and
then bind it to something handy like `Ctrl-x Ctrl-e`. To do that, I can run the
following sequence of commands and even add them to my `zsh` config:

```bash
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line
```

The `autoload` line creates a function stub with the name `edit-command-line`
(try `which edit-command-line` after running just that and you'll see what I
mean). The `zle` line binds the `edit-command-line` widget to the function named
`edit-command-line` (if they had different names, it would be `zle -N <widget> <function>`). Lastly, I bind `Ctrl-x Ctrl-e` to that `edit-command-line`
function.

When this runs, it will first try for the `VISUAL` editor, otherwise fallback
`EDITOR`. I happen to have both of those set to `nvim` in my config. When I hit
`Ctrl-x Ctrl-e`, `nvim` opens with the current command populated. I can make
edits, and then when I run `:wq`, the updated command replaces what was there. I
still have to hit enter to execute it.

I find this most useful when I'm typing a multi-line prompt, especially one
where I'm trying to get all the details right and I need to copy in values from
somewhere else. It is also invaluable for writing out [a command like this](/llm/include-a-file-with-message-to-ant.md) that has a real-world cost if
I accidentally bump enter too soon.
