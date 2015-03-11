# Quick Quickfix List Navigation

There are lots of commands that will load up Vim's quickfix list with
results that you'll want to traverse. For instance, if you use [Fugitive's
`:Ggrep`](https://github.com/tpope/vim-fugitive/blob/master/doc/fugitive.txt#L94),
it'll load up the quickfix list with line by line occurrences of the search
term.

You can go forwards and backwards through this list using `:cnext` and
`:cprevious`. Though this gets a bit tedious to type over and over,
especially for long lists of results.

You can quickly navigate forwards and backwards through these results
with two bindings provided by
[vim-unimpaired](https://github.com/tpope/vim-unimpaired).
`]q` is mapped to `:cnext`, for going forwards, and `[q` is mapped to
`:cprevious`, for going backwards.
