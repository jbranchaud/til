# Dry Runs in Git

There are a few commands in git that allow you to do a *dry run*. That is,
git will tell you the effects of executing a command without actually
executing that command.

For instance, if you are clearing out untracked files, you can double check
what files are going to be deleted with the *dry run* flag, like so:

```
$ git clean -fd --dry-run
Would remove tmp.txt
Would remove stuff/
```

Similarly, if you want to check in which files a commit is going to be incorporated,
you can:

```
$ git commit --dry-run --short
M  README.md
A  new_file.rb
```

Try running `git commit --dry-run` (that is, without the `--short` flag).
Look familiar? That is the same output you are getting from `git status`.
