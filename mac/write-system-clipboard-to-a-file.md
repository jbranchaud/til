# Write System Clipboard To A File

MacOS has two CLI utilities `pbcopy` and `pbpaste` which, respectively, copy
_to_ and paste _from_ the system clipboard via the CLI.

Let's say I've just copied a large block of text from somewhere onto my system
clipboard. I now want to paste that into a new file. Instead of creating a new
file, opening it up in my preferred editor, pasting all that text, and saving
the file, I can run one small command from the CLI.

```bash
$ pbpaste > data.txt
```

This redirects the contents of `pbpaste` (which is the system clipboard) into
the file `data.txt`. If that file doesn't already exist, then it will be
created before the data is written to it.

See `man pbpaste` for more details.
