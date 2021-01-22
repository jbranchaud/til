# Unstage Changes With Git Restore

Git 2.23 introduced the `restore` command which is a more direct alternative to
`checkout` and `reset` for restoring the state of the working tree and the
index (staging area).

With the `--staged` flag, we can unstage changes, moving them from the index to
the working tree.

> To restore a file in the index to match the version in HEAD (this is the same
> as using git-reset(1))

```
$ git restore --staged README.md
```

Staged changes to `README.md` will be removed from the index and put on the
working tree.

```
$ git restore --staged .
```

That will unstage all changes on the index.

This is now recommended by Git when you run `git status`:

> (use "git restore --staged <file>..." to unstage)

See `man git-restore` for more details.
