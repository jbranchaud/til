# A Better Way To Reload ZSH Configuration

I have an alias in my `~/.zshrc` that I set up to make it easy to "reload" my
ZSH configuration. This is handy if I'm iterating on some changes to my
`~/.zshrc` file and need verify them as I go.

```bash
alias reload='source ~/.zshrc'
```

With this alias, I can call `reload` from the terminal and the latest version
of my configuration (according to the `~/.zshrc` file) will be loaded for that
shell instance.

This has some downsides. It doesn't account for the other kinds of files that
contribute to your shell configuration (e.g. `~/.zprofile`) and it can lead to
duplicate values in your `PATH` and init scripts being run an additional time.

A better way is to use:

```bash
$ omz reload
```

This is [a wrapper call around `exec
zsh`](https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/cli.zsh#L669-L677),
which restarts the `zsh` process. It also clears the completion cache.

I've since updated my `~/.zshrc` alias for `reload`:

```bash
alias reload='omz reload'
```

[source](https://batsov.com/articles/2022/09/15/reload-zsh-configuration/)
