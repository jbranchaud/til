# Find A File Installed By Brew

I installed a homebrew formula to satisfy a dependency for a Rails application.
Related to [the whole mimemagic
debacle](https://github.com/rails/rails/issues/41750), I had run [`brew install
shared-mime-info`](https://formulae.brew.sh/formula/shared-mime-info). The
specific file that Rails needed from this install was `freedesktop.org.xml`.

It took me two commands to figure out if that file had been included and where
it was living.

The first was to find the _brew prefix directory_ — the place where homebrew
had installed everything related to `shared-mime-info`.

```bash
$ brew --prefix shared-mime-info
/usr/local/opt/shared-mime-info
```

Now that I know about that directory, I can use
[`fd`](https://github.com/sharkdp/fd)—a more user-friendly alternative to
`find`—to _find_ the specific file in that directory. Not wanting to cast too
narrow of a net, I decided to look for any `xml` file in that directory.

```bash
$ fd -e xml . /usr/local/opt/shared-mime-info
/usr/local/opt/shared-mime-info/share/shared-mime-info/packages/freedesktop.org.xml
```

The `-e` flag specifies the file extension. The `.` is the first argument, the
pattern to look for. In this case, anything. The second argument
(`/usr/local/opt/shared-mime-info`) is the path to look within. In this case,
the brew prefix for the `shared-mime-info` package.
