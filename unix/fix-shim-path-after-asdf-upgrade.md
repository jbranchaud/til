# Fix Shim Path After asdf Upgrade

While doing [`brew install groff`](aws/aws-cli-requires-groff-executable.md),
Homebrew decided to upgrade every last thing it knows about on my machine,
including `asdf`.

`asdf` has undergone some big recent changes, including [a rewrite in
Go](https://stratus3d.com/blog/2025/02/03/asdf-has-been-rewritten-in-go/).

I noticed that `asdf` wasn't picking up my specified tool versions. I tried an
`asdf reshim`, but that didn't do the trick. Someone else wrote that [asdf
seems broken after homebrew
upgrade](https://braytonium.com/2023/01/09/asdf-seems-broken-after-homebrew-upgrade/)
which gave some hints and pointed me to some interesting GitHub issues.

Additionally, I noticed when opening a fresh terminal session the following error from `zsh`:

```bash
/Users/jbranchaud/.zshrc:.:225: no such file or directory: /usr/local/opt/asdf/libexec/asdf.sh
```

That directory and file is gone. So, how does `asdf` now want you to configure
its path with `zsh`? Revisiting their updated docs, I can see that the instead
of sourcing that shell script, we should now export shims to the path:

```bash
# . /usr/local/opt/asdf/libexec/asdf.sh
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
```

Updating my `.zshrc` to the above and then reloading did the trick. My tool
versions are registering now.

[source](https://asdf-vm.com/guide/getting-started.html#_2-configure-asdf)
