# List Untracked Files

Git's `ls-files` command is a plumbing command that allows you to list
different sets of files based on the state of the working directory. So, if
you want to list all untracked files, you can do:

```
$ git ls-files --others
```

This includes files *ignored* by the `.gitignore` file. If you want to
exclude the ignored files and only see *untracked* and *unignored* files,
then you can do:

```
$ git ls-files --exclude-standard --others
```

There are some other flags worth checking at at `git help ls-files`.

[source](http://stackoverflow.com/questions/2657935/checking-for-a-dirty-index-or-untracked-files-with-git)
