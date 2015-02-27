# Stashing Untracked Files

Normally when stashing changes, using `git stash`, git is only going to
stash changes to *tracked* files. If there are any new files in your project
that aren't being tracked by git, they will just be left lying around.

You might not want these *untracked* files left behind, polluting your
working copy. Perhaps these files change your projects functionality or
affect the outcome of tests. You just want them out of the way, for the
moment at least.

And so along comes the `-u` or `--untracked` flag.

```bash
$ touch new_file.rb
$ git stash
No local changes to stash
$ git stash -u
Saved working directory and index state WIP ...
```
