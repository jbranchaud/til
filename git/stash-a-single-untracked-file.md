# Stash A Single Untracked File

If you want to stash everything in your work tree and untracked files, you can
run:

```bash
$ git stash -u
```

If you want a bit more control over what gets stashed from the work tree, you
can interactively stash with `--patch` (or `-p`):

```bash
$ git stash -p
```

Unfortunately, the two don't work together.

```bash
$ git stash -u -p
Can't use --patch and --include-untracked or --all at the same time
```

So, if you'd like to stash a specific untracked file, you can instead formulate
a command like the following:

```bash
$ git stash -u -- <name-of-untracked-file>
```

This will stash just the specified untracked file and leave the rest of them as
they are.

I found this useful when trying to test the setup of a new library. There was
an extra new file that I didn't think I needed. Stashing it temporarily gets it
out of the way without losing it.
