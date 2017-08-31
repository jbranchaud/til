# Go To File With Line Number

I often use `gf` as supported by Vim or with the help of plugins like
[`rails.vim`](https://github.com/tpope/vim-rails) as a way of quickly
navigating to existing files. For unloaded files, this loads a buffer with
the cursor at the top of the buffer. For existing buffers, it opens to that
buffer with the cursor where it was when you left.

Vim also supports a slightly fancier goto file command, `gF`. If this
command is used while the cursor is over a file with a line number appended
to the end, it will not only open up a buffer with that file, it will move
the cursor to the specified line number.

With this repository, I could try it out by moving the cursor over the
following text and hitting `gF`.

```text
README.md:100
```

This will open up a buffer for `README.md` with the cursor at line 100.

See `:h gF` for more details.
