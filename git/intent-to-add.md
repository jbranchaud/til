# Intent To Add

Git commands like `git diff` and `git add --patch` are awesome, but their
little caveat is that they only work on files that are currently tracked in
the repository. That means that after working on that new feature for 30
minutes, a `git diff` is only going to show you the changes to existing
files and when you go to start making commits with `git add --patch` you
will again be provided with only part of the picture.

The `git add` command has a flag, `-N`, that is described in the git man
pages:

> Record only the fact that the path will be added later. An entry for the
> path is placed in the index with no content. This is useful for, among other
> things, showing the unstaged content of such files
> with git diff and committing them with git commit -a.

By adding untracked files with the `-N` flag, you are stating your *intent
to add* these files as tracked files. Once git knows that these files are
meant to be tracked, it will know to include them when doing things like
computing the diff, performing an interactive add, etc.
