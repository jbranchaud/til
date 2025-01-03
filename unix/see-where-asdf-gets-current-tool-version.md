# See Where asdf Gets Current Tool Version

The other day I [installed the latest version of
Ruby](ruby/install-latest-version-of-ruby-with-asdf.md) with `asdf`. I then set
that version (`3.4.1`) as the global default. However, when I then ran `ruby
--version`, I was getting a `3.2.x` version. I checked my current project's
directory and there was no `.tool-versions` file, so it wasn't being set by my
current directory.

`asdf` looks up the current chain of directories until it encounters a
`.tool-versions` file, so it must have been finding one somewhere up there, but
before it was getting to the _global_ `.tool-versions` file. But where?

The `asdf current` command can tell us for a specific tool what the current
version it is set to and what file is giving that directive.

```bash
asdf current ruby
ruby            3.2.2           /Users/jbranchaud/code/.tool-versions
```

As it turns out, I had a `.tool-versions` file in `$HOME/code` that was setting
that `3.2.x` Ruby version.

I didn't want that directory controlling the Ruby version, so I removed `ruby`
from that file. `asdf` was then able to traverse up to `$HOME/.tool-versions`
for the global setting.

See `asdf help` for more details.
