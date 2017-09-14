# Specifying The Digest Directory

By default, Phoenix targets `priv/static` when preparing digested assets for
production. This process happens when running `mix phx.digest`.

If you are doing some custom work with your assets such that they are in a
different location, you'll need to tell Phoenix where to look. To do this,
just include an optional path argument.

```bash
$ mix phx.digest path/to/my/assets
```

The digests will be put in that target directory. If you'd like to specify a
different output directory, such as `priv/static`, include the `-o` flag.

```bash
$ mix phx.digest path/to/my/assets -o priv/static
```
