# Exclude A Specific File From fd Results

I recent wrote a
[`cat-to-markdown`](https://github.com/jbranchaud/dotfiles/blob/my-dotfiles/bin/cat-to-markdown)
script that can be piped a list of files from the output of another command to
do its thing. I then used [`fd`](https://github.com/sharkdp/fd) to list a
specific set of files by extension that could be piped to this command.

```bash
fd -e js | cat-to-markdown | pbcopy
```

This worked, but I quickly realized that one of the JavaScript files included in
that listing was massive and didn't need to be included.

To exclude it from the list I can use the `-E` flag and then name the file like
so:

```bash
fd -e js -E super-large-file.js | cat-to-markdown | pbcopy
```

I believe this can be an exact match file path or even a pattern that matches
multiple files.

See `man fd` for more details.
