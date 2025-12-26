# Regenerate Lock File With Newer Bundler

While upgrading to the latest Ruby version (4.0.0), I also wanted to upgrade the
version of `bundler` that my project uses. This shows up at the bottom of the
`Gemfile.lock` file as the `BUNDLED WITH` line. Despite installing the latest
version of `bundler`, I get the following message when I try to install
dependencies.

```bash
$ bundle install

Bundler 4.0.3 is running, but your lockfile was generated with 2.6.2.
Installing Bundler 2.6.2 and restarting using that version.
...
```

Instead, what we need to tell `bundle` to update the locked version of `bundler`
in the `Gemfile.lock`.

```bash
$ bundle update --bundler

Fetching gem metadata from https://rubygems.org/.........
Resolving dependencies...
Bundle updated!
```

The `--bundler` flag for `bundle-update` says the following:

> Update the locked version of bundler to the invoked bundler version.

So we could pass a specific `bundler` version to that flag, but in this case I
want to use the version I'm invoking it with which is the latest that I just
installed.
