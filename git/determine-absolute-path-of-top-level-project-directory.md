# Determine Absolute Path Of Top-Level Project Directory

The `git rev-parse` command is a git plumbing command for parsing different
kinds of things in git into a canonical form that can be used in a deterministic
way by scripts. I would typically think of using it to work with branch names,
tags, and other kinds of refs.

There is a handy, sorta off-label use for it in determining the absolute path of
the root directory for the current git repository. Use the `--show-toplevel`
flag with no other arguments.

```bash
❯ git rev-parse --show-toplevel
/Users/lastword/dev/jbranchaud/til
```

Here, I am in the local copy of [my TIL repo](https://github.com/jbranchaud/til). This command gives me the absolute
path of the top-level directory where that `.git` directory resides.

This is useful for scripts that need to orient themselves to the current
project's top-level directory regardless of what directory they are being
executed from. This is useful for things like a git hook script or monorepos
with scripts located in a specific sub-project directory.

Also worth mentioning is the `--show-superproject-working-tree` flag. In my TIL
repo, I have a private repository included as a submodule. Within that directory
`--show-toplevel` will produce the absolute path to the submodule. If I instead
want the absolute path of the _super project_ (in this case TIL), then I can use
this other flag.

```bash
❯ git rev-parse --show-toplevel
/Users/lastword/dev/jbranchaud/til/notes

❯ git rev-parse --show-superproject-working-tree
/Users/lastword/dev/jbranchaud/til
```

See `man git-rev-parse` for more details.
