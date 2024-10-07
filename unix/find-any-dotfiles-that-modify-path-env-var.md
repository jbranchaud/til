# Find Any Dotfiles That Modify Path Env Var

Whether you are using `zsh`, `bash`, or some other shell, there are a variety
of dotfiles where you can place statements to update the `PATH` env var. These
files don't all run in the same contexts and it can be tricky to debug if one
is clobbering the path set by another.

One way to audit how your `PATH` gets set and track down any issues is to find
any place where the path may be getting modified in your dotfiles.

I like to use [`rg` (ripgrep)](https://github.com/BurntSushi/ripgrep) for tasks
like this.

First, I want to check where the `PATH` is explicitly modified.

```bash
$ rg 'export PATH' ~/\.* --max-depth 0
```

This looks at all instances of dotfiles in my home directory where `export
PATH` appears. That should catch the majority of ways that it gets updated.

Next, because I am using `zsh` as my shell, I want to look for another way my
path might be set. `zsh` defaults to setting up `path` as proxy for `PATH` that
acts as an array.

I check for any instances of `path=` or `path+=` in my dotfiles:

```bash
$ rg 'path\+?=' ~/\.* --max-depth 0
```

Note that the `--max-depth 0` is really important for both because otherwise a
ton of irrelevant stuff buried in deeply-nested dot-directories will be
surfaced.

If you want just a file name summary of the results, tack on a `-l` flag.
