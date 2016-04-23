# Turning Off Search Highlighting

After performing a search for a common word, you end up with that word
highlighted all over the place. To turn it off, I generally use the `set`
command with `no` prepended to the `hlsearch` option -- as is convention in
Vim.

It turns out though, that `nohlsearch` is a command in its own right. I can
save a few characters by invoking:

```
:nohlsearch
```

See `:h nohlsearch` for more details.
