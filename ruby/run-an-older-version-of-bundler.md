# Run An Older Version Of Bundler

You can check your current version of bundler like so:

```bash
$ bundle --version
1.17.3
```

If you have older versions of bundler, you run against those by specifying the
version in the command:

```bash
$ bundle _1.16.6_ --version
1.16.6
```

Likewise this can be used with any bundler command:

```bash
$ bundle _1.16.6_ install
```

[source](https://makandracards.com/makandra/9741-run-specific-version-of-bundler)
