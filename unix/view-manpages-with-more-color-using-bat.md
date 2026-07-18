# View Manpages With More Color Using Bat

The default pager (program for display large text documents) for manpages is
`less`. That is, when I run something like `man git-log`, I am starting a `less`
process for viewing that document and I have access to all the features and
keybindings of `less`.

A comparable alternative to `less` is [`bat`](https://github.com/sharkdp/bat)
which support manpage-specific syntax highlighting. With the `-p` flag, `bat`
uses _plain_ styling which removes the extra formatting. With the `-l` flag I
can set the language for syntax highlighting to `man`.

```bash
❯ MANPAGER="bat -plman" man git-log
```

That's a nice way to experiment with using `bat` as the man pager, but if I want
it set longterm I should add that env var setting for `MANPAGER` to my shell
config or [dotfiles](https://github.com/jbranchaud/dotfiles).

While `bat` is an improvement with the color that it sprinkles in, I am going to
stick with [neovim as my configured manpage viewer](https://www.visualmode.dev/a-better-man-page-viewer). Neovim gives me a
similar level of color plus a lot of other really nice features that only an
editor could provide.

[source](https://bsky.app/profile/tylerhillery.com/post/3mqunqyt44c2m)
