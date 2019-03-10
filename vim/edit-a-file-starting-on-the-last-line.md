# Edit A File Starting On The Last Line

Generally when you start editing a file whether as a new Vim session (`vim
file.txt`) or in an existing Vim session (`:e file.txt`), your cursor will
be positioned at the beginning of the file.

You can start editing a file with the cursor positioned at the end of a file
using an _edit command_ -- include `+` with no line number. This may be
useful for a large file or even if you just know that you'll be adding
content directly to the bottom of the file.

If you are starting a new Vim session:

```bash
$ vim + file.txt
```

or if you are already in a Vim session:

```
:e + file.txt
```

See `man vim` or `:h +cmd` for more details.
