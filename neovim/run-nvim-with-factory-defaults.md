# Run nvim With Factory Defaults

Most of the fun of using Neovim is tailoring it to your exact needs with custom
configurations. Your configuration can be made up of environment variables,
`init.lua`/`init.vim`, and user directories on the `runtimepath`.

Perhaps though, you want to load neovim with its "factory defaults". You want
to ignore all your custom config and your _shada_ (shared data) file. I wanted
to do just that recently to verify that neovim has the `ft-manpage` plugin
enabled by default (as opposed to enabled somewhere in the labryinth of my
config files).

The `--clean` flag does just this. It loads built-in plugins, but none of the
user defined config.

```bash
$ nvim --clean
```

This is different than `nvim -u NONE` which excludes all plugins, including
built-in ones.

See `man nvim` and `:help --clean` for more details.
