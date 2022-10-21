# Set Up Vim-Plug With Neovim

To get [vim-plug](https://github.com/junegunn/vim-plug) working with Neovim, it
needs to be installed in a known autoload directory.

The help files say that "plugins installed by user" should be located in the
data home directory at `stdpath("data")` under `site`. For me (on OSX) the data
home directory is `~/.local/share/nvim`, so `~/.local/share/nvim/site`.

Under this site directory, along with any directories on the `runtimepath`,
Neovim looks for various runtime files and subdirectories. This includes the
`/autoload` directory. That's where you want to install `vim-plug`.

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

This shell statement uses [the `:-` parameter
expansion](../unix/provide-a-fallback-value-for-unset-parameter.md) to specify a
path using either the `XDG_DATA_HOME` or `$HOME` as a fallback. This ends up
resolving to `~/.local/share`, so the `plug.vim` file is placed in
`~/.local/share/nvim/site/autload/`.

See `:h runtimepath` for more details.
