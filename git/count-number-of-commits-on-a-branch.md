# Count Number Of Commits On A Branch

The `git rev-list` command will show all commits that fit the given revision
criteria. By adding in the `--count` flag, we get a count of the number of
commits that would have been displayed. Knowing this, we can get the count of
commits for the current branch like so:

```bash
$ git rev-list --count HEAD
4
```

This finds and counts commits from `HEAD` (usually the top of the current
branch) all the back in reverse chronological order to the beginning of the
branch (typically the beginning of the repository). This works exactly as
expected for a the `main` branch.

What about when we are on a feature branch though?

Let's say we've branched off `main` and made a few commits. And now we want the
count.

```bash
$ git rev-list --count HEAD
7
```

Unfortunately, that is counting up the commits on the feature branch but it
keeps counting all the way back to the beginning of the repo.

If we want a count of just the commits on the current branch, then we can
specify a range: from whatever `main` was when we branched to the `HEAD` of
this branch.

```bash
$ git rev-list --count HEAD
3
```

This is the same as saying, I want all commits on `HEAD`, but exclude (`^`) the
commits on `main`:

```bash
git rev-list --count HEAD ^main
3
```

See `man git-rev-list` for more details.
