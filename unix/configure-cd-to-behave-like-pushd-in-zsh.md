# Configure cd To Behave Like pushd In Zsh

The Zsh environment has a setting that allows you to make the `cd` command
behave like the `pushd` command. Normally when you use `cd` the [remembered
directory stack](list-the-stack-of-remembered-directories.md) is not
effected. However, if you add the following setting to your `~/.zshrc` file:

```bash
setopt auto_pushd
```

then using `cd` to navigate directories will cause those directories to be
added to the `dirs` stack.

This is the default in the [oh-my-zsh configuration of
zsh](https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/directories.zsh#L2).
