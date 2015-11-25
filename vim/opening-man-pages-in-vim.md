# Opening Man Pages In Vim

In [Quick Man Pages](quick-man-pages.md), I explained how you can quickly
open man pages with `K`. For times when the particular command isn't in the
buffer or the command contains a hyphen, you can instead use `:Man`. With
the `ft-man-plugin` enabled, you can use `:Man` with the name of any command
that has a manual page and the respective man page will be opened in a split
buffer. For example, check out `git log` with:

```
:Man git-log
```

If you don't want the first manual entry, provide a specific number. For
instance, you can open the `echo(3)` man page with:

```
:Man 3 echo
```

See `:h :Man` for more details.
