# Override The Global Git Ignore File

One of the places that `git` looks when deciding whether to pay attention to or
ignore a file is in your global _ignore_ file. By default, `git` will look for
this file at `$XDG_CONFIG_HOME/git/ignore` or `$HOME/.config/git/ignore`.

I don't have `$XDG_CONFIG_HOME` set on my machine, so it will fall back to the
config directory under `$HOME`.

I may have to create the `git` directory and `ignore` file.

```bash
$ mkdir $HOME/.config/git
$ touch $HOME/.config/git/ignore
```

Then I can add file and directories to exclude to that `ignore` file just like
I would any other `.gitignore` file.

If I'd prefer for the global _ignore_ file to live somewhere else, I can
specify that location and filename in my `$HOME/.gitconfig` file.

```
[core]
	excludesFile = ~/.gitignore
```

Setting this will override the default, meaning the default file mentioned
above will be ignored ("now you know how it feels, ignore file!"). In this
case, I'll need to create the `.gitignore` file in my home directory and add
any of my ignore rules.

[source](https://git-scm.com/docs/gitignore)
