# Uninstall Specific Version Of A Ruby Gem

I have two versions of `bundler` installed on my machine—`2.2.4` and `2.2.10`.
When I check the version of bundler, I see it references the latest one.

```bash
$ bundle --version
Bundler version 2.2.10
```

I want to get rid of `2.2.10` so that I can use `2.2.4` instead. This can be
done by uninstalling that specific version of `bundler`.
 
To do this, specify the `-v` flag when running `gem uninstall`.

```bash
$ gem uninstall bundler -v 2.2.10
Successfully uninstalled bundler-2.2.10
$ bundle --version
Bundler version 2.2.4
```

Alternatively, if you want to use a different version of a gem without
uninstalling the primary version, you can [specify the version after the gem
name when calling it](run-an-older-version-of-bundler.md).

[source](https://stackoverflow.com/questions/23887726/rails-uninstall-specific-version-of-a-library-using-gem)
