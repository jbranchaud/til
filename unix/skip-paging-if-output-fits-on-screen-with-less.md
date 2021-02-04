# Skip Paging If Output Fits On Screen With Less

The `less` command can be used to display a file or the output of a command. It
is sometimes referred to as a pager because it paginates text that won't fit
onto a single screen.

```bash
$ ls | less
```

This will list the files for the current directory with `less`.

By default it will even display a small amount of text output within the pager.
If you want `less` to output text that fits onto a single screen directly to
the terminal, you can pass the `-F` and `-X` flags.

```bash
$ ls | less -FX
```

The `-F` flag tells `less` to exit if the output fits onto a single screen. The
`-X` tells `less` to skip screen clearing.

This is handy if you want the output of a command to show up in your shell
history.

See `man less` for more details.
