# Wipe Out All Precompiled Assets

You can clean up precompiled assets using:

```bash
$ rails assets:clean
```

This command is built to be safe for situations like rolling deploys. Any
assets that are still being used will not be cleaned up.

If you really want to wipe out _all_ precompiled assets, you should _clobber_
them:

```bash
$ rails assets:clobber
```

[source](https://edgeguides.rubyonrails.org/command_line.html#rails-assets)
