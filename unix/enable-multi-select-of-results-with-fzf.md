# Enable Multi-Select Of Results With fzf

You can pipe the output of any command to
[`fzf`](https://github.com/junegunn/fzf) and it will display it line-by-line in
a list that you can then fuzzy-find against.

By default you get to pick _one_ of those results. That result will go to
stdout, either printing to the terminal or being piped to the next command.

For some combinations of commands, it makes more sense to be able to select
_multiple_ results. `fzf` supports this with the `-m` (or `--multi`) flag.

```bash
$ ls | fzf -m | xargs cat
```

For instance, this series of commands pipes the output of `ls` (files and
directoris) to `fzf`. The `-m` flag means that you can hit `Tab` (or
`Shift+Tab`) to select multile entries. When you hit enter, each of the
selected entries will be executed one by one with `cat`.

I show a slightly more practical example of this in [Make One-Line Commands
Interactive with fzf](https://www.youtube.com/watch?v=wf5eXdwfVws).

See `man fzf` for more details.
