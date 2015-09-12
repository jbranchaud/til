# Deleting Directories Of Files From netrw

In `netrw`, you can delete files and directories by navigating over the
target of deletion and hitting `D`.

By default, `netrw` will use `rmdir` when deleting directories. This means
that if a directory has files in it, then it won't be deleted. `rmdir`
rightly gives an error when the target directory isn't empty.

Not to worry though, `netrw` can be configured to use `rm -r` instead of
`rmdir` when deleting directories.

```
:let g:netrw_localrmdir='rm -r'
```

[source](https://gist.github.com/KevinSjoberg/5068370)
