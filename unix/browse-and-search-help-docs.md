# Browse And Search Help Docs

There are a lot of tools that don't have dedicated `man` pages, but do have
lengthy output when you pass them the `--help` flag.

We can make those details easier to browse and searchable by piping them to
`less`.

```bash
❯ uv run pytest --help | less
```

First, we see the top of the output inside `less` instead of bottom of the
output right above our next terminal prompt.

From `less`, we can use down and up arrows (or `j` and `k`) to navigate through
the details. We can also jump to a specific word or phrase by searching -- type
`/` and then the pattern we're trying to match. `n` and `N` to go to the next or
previous match, respectively.

See `man less` more more details. And if you like these improvements to viewing
tool usage details, you may also be interested in [a better man page viewer](https://www.visualmode.dev/a-better-man-page-viewer).
