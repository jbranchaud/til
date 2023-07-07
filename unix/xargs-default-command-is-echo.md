# xargs Default Command Is echo

With the `fd` command, all the found files are output line by line like so.

```bash
❯ fd '.*.md' --max-depth=1
CONTRIBUTING.md
README.md
TODO.md
built-in-commands.md
newsletter.md
tailwind.md
```

I can normalize the whitespace, squishing everything to be separated by single
spaces by piping it to `xargs`. This is equivalent to call `xargs` with `echo`.
That is because `echo` is the default command that `xargs` uses when another
command isn't given.

```bash
❯ fd '.*.md' --max-depth=1 | xargs
CONTRIBUTING.md README.md TODO.md built-in-commands.md newsletter.md tailwind.md

❯ fd '.*.md' --max-depth=1 | xargs echo
CONTRIBUTING.md README.md TODO.md built-in-commands.md newsletter.md tailwind.md
```

We can see further evidence of that by using the `-n` flag with `2` to have it
process results two at a time. In either case, each pair of file names is
echo'd before the next two are processed.

```bash
❯ fd '.*.md' --max-depth=1 | xargs -n2
CONTRIBUTING.md README.md
TODO.md built-in-commands.md
newsletter.md tailwind.md

❯ fd '.*.md' --max-depth=1 | xargs -n2 echo
CONTRIBUTING.md README.md
TODO.md built-in-commands.md
newsletter.md tailwind.md
```

See `man xargs` for more details, as well as this [excellent
article](https://abhinavg.net/2022/06/04/xargs-spaces/).
