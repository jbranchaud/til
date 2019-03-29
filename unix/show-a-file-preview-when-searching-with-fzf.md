# Show A File Preview When Searching With FZF

[FZF](https://github.com/junegunn/fzf) by itself is a great way to fuzzy
find files. It gets even better when you can view a preview of a file before
opening it up. The `--preview` flag lets you do just this.

Add a basic file preview with `cat`:

```bash
$ fzf --preview 'cat {}'
```

The `{}` will get replaced a single-quoted string of the highlighted file.

You can spice up the preview a bit with color and line numbers using
[`bat`](https://github.com/sharkdp/bat):

```bash
$ fzf --preview 'bat --color "always" {}'
```

The `--color` flag tells `bat` to produce syntax highlighted output even
though it isn't in interactive mode.

Lastly, you can keep it performant by only showing the first 100 lines:

```bash
$ fzf --preview 'bat --color "always" --line-range 0:100 {}'
```

See `man fzf` for more details.

[source](https://github.com/dkarter/dotfiles/blob/master/vimrc#L362)
