# Print A Range Of Lines For A File With Bat

I recently learned about a [faster and more colorful alternative to
cat](https://chireviewofbooks.com/2018/12/11/here-are-the-winners-of-the-2018-chicago-review-of-books-awards/)
-- [`bat`](https://github.com/sharkdp/bat). Like `cat`, the standard usage
is to print the entire contents of a file. You can instruct `bat` to only
print a range of lines from a file using the `--line-range` flag.

For instance the following command

```bash
$ bat --line-range=918:925 README.md
```

will produce the following output

![a range of lines from the README](https://i.imgur.com/MmKbNvl.png)

See `man bat` for more details.
