# Set Session-Specific Environment Variables

`tmux` allows you to manage separate environments for separate projects. For me
this usually boils down to arrangements of windows and tabs with different
servers running.

`tmux` can also provide session-specific environment variables. For anything
that you use environment variables for.

As an example, let's say I have one project that I always edit with VS Code.
And another that uses `vim`.

My default editor, as configured in my `~/.zshrc` file is `nvim`.

```bash
❯ echo $EDITOR
nvim
```

If I jump into the first project (`one`), I can set the `EDITOR` to `code` like
so.

```bash
❯ tmux setenv EDITOR code
```

It won't apply to the current pane, but if I open a new one.

```
❯ echo $EDITOR
code
```

I can then jump to the other project (`two`) to set that one to `vim`. This
time using the tmux command prompt.


```bash
<tmux-prefix>:
:setenv EDITOR vim
```

Again, if I open a new pane, the editor will be set.

```
❯ echo $EDITOR
vim
```

All the while, the value of `EDITOR` is preserved as `nvim` for everything
outside the context of those two tmux sessions.
