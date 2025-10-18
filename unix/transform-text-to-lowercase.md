# Transform Text To Lowercase

I was reading through [`setup.sh` in
dkarter/dotfiles](https://github.com/dkarter/dotfiles/blob/master/setup.sh#L7-L9)
and noticed this function for converting a given bit of text to all lowercase
letters.

```bash
lowercase() {
  echo "$1" | sed "y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/"
}
```

It's an interesting use of `sed`, but it made me wonder if `tr` was a better
tool for this job. I looked into it and `tr` is better suited to the task, more
expressive, and also compatible across Mac and Linux.

Here is what it looks like with `tr`:

```bash
lowercase() {
  echo "$1" | tr '[:upper:]' '[:lower:]'
}
```

This has the added benefit of working across all kinds of UTF-8 characters.

```bash
$ echo "ΑΛΦΑΒΗΤΟ ΕΛΛΑΔΑ" | tr '[:upper:]' '[:lower:]'
αλφαβητο ελλαδα
```

See `man tr` for more details.
