# Ensure Shell Can Find Global npm Binaries

When you install a package globablly either with yarn (or npm)

```bash
$ yarn global add vercel
```

It places the binaries for that package in the `bin` directory of your package
manager's configured path prefix.

The absolute path to this `bin` directory can be found with:

```bash
$ yarn global bin
/Users/jbranchaud/.asdf/installs/nodejs/15.4.0/.npm/bin
```

You can ensure that everything located in that `bin` directory is on your
shell's path by adding the following line to your shell's config file (e.g.
`.bashrc` or `.zshrc`).

```bash
export PATH="$PATH:$(yarn global bin)"
```

Once you've updated your shell config, make sure you _source_ the file or
restart your shell.

[source](https://stackoverflow.com/a/40333409/535590)
