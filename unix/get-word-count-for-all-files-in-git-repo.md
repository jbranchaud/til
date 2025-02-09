# Get Word Count For All Files In Git Repo

As part of gathering numbers for [A Decade of TILs](), I wanted to get an word
count of all the TIL markdown files I've committed to this project over its 10
year history. By using `git ls-files` with a pattern, I can get a list of all
file names. Then with `xargs` I can pass that entire list to `wc -w` which
gives a word count of each. The final line that `wc -w` outputs is a sum total
of all the file word counts. Lastly, piping that through `tail -n1` gives me
just that last total count line.

```bash
$ git ls-files "*/**.md" | xargs wc -w | tail -n1
  206816 total
```

Since the `tail -n1` obfuscates what the `wc -w` is doing, here is what that
looks like before that final pipe.

```bash
$ git ls-files "*/**.md" | tail -n3 | xargs wc -w
     115 zsh/add-to-the-path-via-path-array.md
     190 zsh/link-a-scalar-to-an-array.md
     214 zsh/use-a-space-to-exclude-command-from-history.md
     519 total
```

I can even clean up the final output a bit more with `awk`:

```bash
$ git ls-files "*/**.md" | xargs wc -w | tail -n1 | awk '{print $1}'
206816
```
