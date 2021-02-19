# List Just The Files Involved In A Commit

As part of a script I was writing I needed a command that could list out all
the files involved in a given commit. The `git-show` command (which is
considered a porcelain command) can do this but isn't ideal for scripting. It
is recommended to instead use _plumbing_ commands.

The `git-diff-tree` command is perfect for listing blobs (files) involved in a
commit.

```bash
$ git diff-tree --no-commit-id --name-only -r <SHA>
```

The `--no-commit-id` flag suppresses the output of the commit id, because we
want just the files. The `--name-only` flag tells the command to suppress other
file info and to only show the file names. The `-r` flag tells the command to
recurse into subtrees so that you get full pathnames instead of just the
top-level directory.

If you're interested, the `git-show` parallel to this is:

```bash
$ git show --pretty="" --name-only <SHA>
```

See `man git-diff-tree` and `man git-show` for more details on these.

[source](https://stackoverflow.com/questions/424071/how-to-list-all-the-files-in-a-commit)
