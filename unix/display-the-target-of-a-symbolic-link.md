# Display The Target Of A Symbolic Link

I have symlinked binaries all over my machine. Many of them are configured via
my [dotfiles setup](https://github.com/jbranchaud/dotfiles). There are also
tools like `uv` that install CLI tooling in a canonical place and then symlink
it to a more user-friendly location.

`ruff` which I [installed as a CLI tool via `uv`](/python/globally-install-cli-tool-with-uv.md) is a good example of this.
When I look at the location of `ruff` via the `which` command, I get a `bin`
directory that differed from where I expected `uv` to install it.

```bash
❯ which ruff
/Users/lastword/.local/bin/ruff
```

When I `ls` that directory, I can see it is full of symlinked binaries (as
annotated by the trailing `@` symbol).

```bash
❯ ls /Users/lastword/.local/bin
 ./                         cursor-agent@        pplay@                       tmux-fork-repo@
 ../                        figprev@             pyright@                     tmux-new-session@
 agent@                     ghprs@               pyright-langserver@          v@
 bic@                       git_better_branch@   pyright-python@              wait_for_port@
 bip@                       local-clone@         pyright-python-langserver@
 claude@                    nvims@               ruff@
 command-history-preview@   pingf@               task*
```

To resolve one of these symlinks to their target location, I can use the
`readlink` utility.

```bash
❯ readlink /Users/lastword/.local/bin/ruff
/Users/lastword/.local/share/uv/tools/ruff/bin/ruff
```

And there it is, the actual directory where I expected `uv` to have installed
`ruff`.

See `man readlink` for more details.
