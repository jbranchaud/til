# Source Original vimrc When Using Neovim

If you install [Neovim](https://neovim.io/) and open up a new `nvim` session,
you might notice that none of your carefully crafted `~/.vimrc` configuration
is taking effect.

This is because the `~/.vimrc` file is not part of Neovim's default
`runtimepath` (see `:h runtimepath` for details on what is included).

For custom user-land configuration of your Neovim sessions, you should start
with an `init.vim` file. For Mac users, it will likely be placed in
`~/.config/nvim/`. To be sure where it belongs, you can run `:echo
stdpath('config')`.

In that file, you can add any Neovim-specific configuration. You can also take
the opportunity to source your `~/.vimrc` file so that you get all those
configurations. These lines will do the trick.

```vimrc
if filereadable(expand('~/.vimrc'))
  source ~/.vimrc
endif
```

Things tend to be backward compatible, so you aren't likely to run into issues
with what's in your `~/.vimrc`. At any rate, it is a good starting point for
getting back to a familiar configuration.

See `:h nvim` for more details about how to transition.
