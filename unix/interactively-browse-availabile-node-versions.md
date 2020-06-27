# Interactively Browse Available Node Versions

There are a variety of ways to install and manage your version(s) of Node. My
tool of choice is [`asdf`](https://github.com/asdf-vm/asdf).

Once I have the [Node.js asdf plugin](https://github.com/asdf-vm/asdf-nodejs)
installed, I can view the versions of Node that are available to install.

```bash
$ asdf list-all nodejs
```

This is a massive list. Normally my next step would be to `grep` against the
output. We can take it a step further by making the results interactively
browsable with [`FZF`](https://github.com/junegunn/fzf).

```bash
$ asdf list-all nodejs | fzf
```

I can type into the FZF prompt which will fuzzily narrow down the results. I
can even add a splash of regex to anchor agains the major version.

For instance, `10` will show `10.x.x` as well as pre-1.0 results that contain
`10`. If, however, I prompt FZF with `^10`, then the `10` is anchored to the
front of the string which is the major version -- so `10.x.x` results.
