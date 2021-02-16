# Update The Gemfile Bundled With Version

When you run `bundle install`, whatever is the latest version of `bundler`
installed locally will be used. Your `Gemfile` dependencies will be installed
and the `Gemfile.lock` will be marked at the bottom with a signature for the
version of `bundler` that was used.

```ruby
# Gemfile.lock
...

BUNDLED WITH
   1.1.17
```

On future `bundle install` calls, a matching major version of Bundler will be
used. If you'd like to migrate from 1.x.x to 2.x.x or vice versa, or even if
you want to explicitly change minor versions, you can run:

```bash
$ bundle update --bundler=2.2.4
```

This will bundle your project with `2.2.4` and update the `BUNDLED WITH`
section to reflect that.

Use the version that makes sense for you with the `--bundler` flag.

[source](https://bundler.io/guides/bundler_2_upgrade.html#upgrading-applications-from-bundler-1-to-bundler-2)
