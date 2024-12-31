# Install Latest Version Of Ruby With asdf

When I check the `asdf` Ruby plugin for known versions of Ruby:

```bash
$ asdf list-all ruby | fzf
```

I don't find the latest (`3.4`).

I need to update the plugin. A newer version of the plugin will know about
newer Ruby versions.

```bash
$ asdf plugin-update ruby
```

Now, if I run the `list-all` command again, I'll find the version I'm looking
for — `3.4.1`.

Now that `asdf` and I both know about the version to be installed, I can tell
`asdf` to install it:

```bash
$ asdf install ruby 3.4.1
```

Now, if I check the current Ruby version, I'll see that it is still set to some
other version.

```bash
$ ruby --version
ruby 3.2.2 (2023-03-30 revision e51014f9c0) [x86_64-darwin22]
```

I need to tell `asdf` to start using this newly installed version instead,
either globally or locally.

```bash
$ # globally
$ asdf global ruby 3.4.1
$ # or locally
$ asdf local ruby 3.4.1
```

And now I'm all set:

```bash
$ asdf current ruby
ruby            3.4.1           /Users/jbranchaud/.tool-versions

$ ruby --version
ruby 3.4.1 (2024-12-25 revision 48d4efcb85) +PRISM [x86_64-darwin22]
```
