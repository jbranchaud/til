# Interactively Unstage Changes

I often use `git add --patch` to interactively stage changes for a commit.
Git takes me through changes to tracked files piece by piece to check if I
want to stage them. This same interactive _staging_ of files can be used in
reverse when removing changes from the index. Just add the `--patch` flag.

You can use it for a single file

```bash
$ git reset --patch README.md
```

or you can let it operate on the entire repository

```bash
$ git reset --patch
```

This is useful when you've staged part of a file for a commit and then
realize that some of those changes shouldn't be committed.
