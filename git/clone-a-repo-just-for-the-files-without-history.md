# Clone A Repo Just For The Files, Without History

Though the history of a Git repository is a huge part of its value, sometimes
you just want a copy of the files for the current state of the main branch.

Using the `--depth` flag with `git-clone` allows you to clone a repo without
its history. You can do that with a depth of `1` which will clone the top of
the tree and exclude all the past history.

```bash
$ git clone --depth 1 git@github.com:jbranchaud/til.git
```

If you do a `git log` after this, you'll see there is only one commit in the
history. Depending on the size and history of the repo, you may notice that the
clone is quicker than one that includes the full history.

See `man git-clone` for more details.
