# Git add --patch not indexed files

I'm a huge fan of `git add --patch` aliased with `gapa` thanks to [git plugin in oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/git/git.plugin.zsh#L45).

But I wanted to do it on new files. Files that are untracked. To do that you can use `--intend-to-add` flag.

```
       -N, --intent-to-add
Record only the fact that the path will be added later. An entry for the path is placed in the index with no content. This is useful for, among other things, showing the unstaged content of such files with git diff and committing them with git commit -a.
```

In order :
```shell
$ ga -N .
$ gapa
```

