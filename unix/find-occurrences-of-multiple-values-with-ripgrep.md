# Find Occurrences Of Multiple Values With Ripgrep

Let's say I have a several values that show up throughout the files in my
project. They are `Valid`, `Restricted`, `Refunded`, `Disputed`, and `Banned`.

I want to find all occurrences of each of these values.

This can be done with [`rg` (ripgrep)](https://github.com/BurntSushi/ripgrep)
and a bit of regex.

```bash
rg "\b(Valid|Restricted|Refunded|Disputed|Banned)\b"
```

This uses `\b` on both ends to indicate word boundaries. This ensures it
matches on `Valid` without also matching on `Validate`. It then wraps all the
options in parentheses separated by `|` which says, "match on this word, this
word, ..., or this word".

I can even take this a step further by only matching on quoted instances of
these words like so:

```bash
$ rg "[\"']\b(Valid|Restricted|Refunded|Disputed|Banned)\b[\"']"
```
