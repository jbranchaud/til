# Rename A Remote

If you just added a remote (`git remote add ...`) and messed up the name or
just need to rename some existing remote, you can do so with the `rename`
command.

First, let's see the remotes we have:

```bash
$ git remote -v
origin  https://github.com/jbranchaud/til.git (fetch)
origin  https://github.com/jbranchaud/til.git (push)
```

To then rename `origin` to `destination`, for example, we can issue the
following command:

```bash
$ git remote rename origin destination
```

See `man git-remote` for more details.
