# Make Neovim The Default Way To View Man Pages

I was reading the help page for `:Man` which is the built-in plugin to Neovim
for viewing man pages within a Neovim session. In it, they mentioned that the
`MANPAGER` can be set to use Neovim instead of the default man page viewer.

This can be done by setting `MANPAGER` like so:

```bash
$ export MANPAGER='nvim +Man!'
```

After setting this, you can run something like `man git-restore` which will
open the man page for that command in a Neovim session using the Man page
plugin which can do things like follow links to other man pages (`K` or
`Ctrl=]`), quit by hitting `q`, as well as all the motions and search behavior
of Vim.

For long-term use, this can be set in your shell config, e.g. `~/.zshrc`. For
one-off use, you can include it as an env var for a single call to `man`:

```bash
MANPAGER='nvim +Man!' man git-restore
```

See `:h :Man` within a Neovim session for more details.
