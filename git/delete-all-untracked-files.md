# Delete All Untracked Files

Git provides a command explicitly intended for cleaning up (read: removing)
untracked files from a local copy of a repository.

> git-clean - Remove untracked files from the working tree

Git does want you to be explicit though and requires you to use the `-f`
flag to force it (unless otherwise configured).

Git also gives you fine-grained control with this command by defaulting to
only deleting untracked files in the current directory. If you want
directories of untracked files to be removed as well, you'll need the `-d`
flag.

So if you have a local repository full of untracked files you'd like to get
rid of, just:

```bash
$ git clean -f -d
```

or just:

```bash
$ git clean -fd
```

[source](http://stackoverflow.com/questions/61212/remove-local-untracked-files-from-my-current-git-branch)
