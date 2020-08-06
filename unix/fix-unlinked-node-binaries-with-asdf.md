# Fix Unlinked Node Binaries With asdf

You're using `asdf` to manage your version(s) of `node.js`. You have some
packages globally installed with `yarn` that are available as executable
binaries. When you install and switch to a new version of Node, those global
binaries no longer work.

Even uninstalling and re-installing those particular packages doesn't
necesarily fix it. That's because broken symlinks have been left behind.

`asdf` can help fix this with its `reshim` command:

```bash
$ asdf reshim <name> <version>
```

For instance, if you want to start using `14.4.0`, you can reshim like this:

```bash
$ asdf reshim nodejs 14.4.0
```

This will re-sync all the symlinks so that you are able to access and run those
binaries again.
