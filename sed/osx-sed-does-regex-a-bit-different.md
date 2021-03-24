# OSX sed Does Regex A Bit Different

With GNU sed, `\+`, `\?`, `\(...\)` and friends are considered extended regex
characters. You can use them directly with the preceding backslashes. Or you
can include the `-r` flag to turn on extended regex and use them without.

```bash
$ echo '11+1 = 12' | sed 's/1+/3/'
131 = 12
$ echo '11+1 = 12' | sed -r 's/1+/3/'
3+1 = 12
```

With OSX sed, `\+`, `\?`, and `\|` are not interpreted as part of the basic
regex. To use them at all you need to include `-E` to turn on extended regex.
The capture characters (`\(...\)`) are available with basic regex.

```bash
# Basic, always treated as literal +
$ echo '11+1 = 12' | sed 's/1+/3/'
131 = 12
$ echo '11+1 = 12' | sed 's/1\+/3/'
131 = 12

# Extended, + is now a meta-character
$ echo '11+1 = 12' | sed -E 's/1+/3/'
3+1 = 12
$ echo '11+1 = 12' | sed -E 's/1\+/3/'
131 = 12
```

[source](https://unix.stackexchange.com/a/131940/5916)
