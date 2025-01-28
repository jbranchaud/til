# List All Fonts On Your Machine

In trying to figure out what _FiraCode_ font I have installed on my machine
and what it is called, I came across [this StackOverflow
answer](https://stackoverflow.com/a/52789662/535590) which shares the
following one-liner:

```bash
$ fc-list | awk '{$1=""}1' | cut -d: -f1 | sort | uniq
```

This uses `fc-list` to get the names of all the fonts available on your
machine. This seems to work on both Linux and Mac. Through a series of `awk`,
`cut`, and `sort | uniq`, this command produces a clean, easily-browsed list
of fonts.

I like to take this a step further by piping it all to `fzf` where I can then
narrow down the output to just lines that match _FiraCode_.

```bash
$ fc-list | awk '{$1=""}1' | cut -d: -f1 | sort | uniq | fzf
```

See also [`system_profiler SPFontsDataType`](https://apple.stackexchange.com/questions/35852/list-of-activated-fonts-with-shell-command-in-os-x/243746#243746).
