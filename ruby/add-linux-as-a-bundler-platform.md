# Add Linux As A Bundler Platform

With a locally developed Ruby project on Mac OSX, I have `darwin` specified as
the _platform_ in the `Gemfile.lock`.

```ruby
PLATFORMS
  x86_64-darwin-19
```

When setting up CI for my project on a linux container, I'd get an error like
this:

> Your bundle only supports platforms ["x86_64-darwin-19"] ...

This platform incompatability can be solved with by adding linux as a platform
and re-resolving the lock file. This is done with [`bundle
lock`](https://bundler.io/v2.0/man/bundle-lock.1.html) and the `--add-platform`
flag.

```bash
$ bundle lock --add-platform x86_64-linux
```

If all existing gems work with the new linux platform, the command will succeed
and the updated `Gemfile.lock` will have the following `PLATFORMS` section.

```ruby
PLATFORMS
  x86_64-darwin-19
  x86_64-linux
```

[source](https://github.com/rubygems/rubygems/issues/4269#issuecomment-759591430)
