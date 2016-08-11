# Git diff file to be commited

Sometimes I check what will be commited for that I'm using `--cached` argument.

Today I change the indentation of a huge file and my diff was unreadable. You can do `-w`

```
-w  --ignore-all-space
       Ignore all white space.
```

If you use ohmyzsh and the git plugin you [have a shortcut for the `git diff --cached`](https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/git/git.plugin.zsh#L80-L81)

My command is then `gdca -w`

