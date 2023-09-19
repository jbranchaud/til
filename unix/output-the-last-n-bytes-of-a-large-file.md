# Output The Last N Bytes Of A Large File

After creating a massive JSON file as part of a data export, I wanted to check
the timestamp of the last value in the file. However, even for Vim, the file
was big and it was taking a while to bring the whole thing into memory.

I didn't really need to open it in a full-fledged editor, I just needed to grab
the trailing bits (bytes!) of the file until I could see enough data to verify
the export.

The `tail` command is a great tool for this because it can quickly read
information from the end of a file. The `-c` flag in particular allows you to
grab the last N bytes of the file and output them.

So, I started with:

```bash
$ tail -c 100 data.json
```

That didn't quite show me enough info, so I bumped it up:

```bash
$ tail -c 1000 data.json
```

That time I was able to see enough to verify the export.

Both commands ran instantaneously, meanwhile my editor was still opening the
file.

See `man tail` for more details.
