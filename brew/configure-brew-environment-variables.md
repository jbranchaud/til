# Configure Brew Environment Variables

The `brew` CLI can be configured with a ton of different environment variables.
A full listing of those can be found in the [Environment section of their
docs](https://docs.brew.sh/Manpage#environment).

If you want to change the defaults of any of those values, you can either set
them directly in your environment:

```bash
$ set HOMEBREW_BAT=1
```

Or you can set them in a more dedicated place like one of Homebrew's
environment files. There are a couple possible locations for these files. I
prefer to use `$HOME/.homebrew/brew.env` (i.e. `~/.homebrew/brew.env`).

```
HOMEBREW_BAT=1
```

This file and directly likely don't exist, so you may have to set them up the
first time:

```
$ mkdir $HOME/.homebrew
$ touch $HOME/.homebrew/brew.env
```
