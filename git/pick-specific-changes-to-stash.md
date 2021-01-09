# Pick Specific Changes To Stash

If you run `git stash`, all of the changes to tracked files on the working tree
will be put into a commit-like entity in the stash list.

If you want to be a bit choosier about what gets saved during a stash, you can
include the `--patch` flag.

> With --patch, you can interactively select hunks from the diff between HEAD
> and the working tree to be stashed.

```bash
$ git stash --patch
```

Once in the interactive mode initiated by `--patch`, you'll be presented with a
change of changes and some options. You hit `y` for "yes, include this" and `n`
for "no, don't include that". And then there are some more advanced options
which you can read about in the _Interactive Mode_ section of `git-add`'s man
page.

See `man git-stash` for more details.
