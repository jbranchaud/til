# Configure FZF To Use fd For File Finding

By default, FZF uses the `find` command as its source for fuzzy finding
files. So [`fzf.vim`](https://github.com/junegunn/fzf.vim) will also be
using `find` when you invoke `:Files`.  There are some speedier, more
intelligent, and more user-friendly alternatives to `find`. I like
[`fd`](https://github.com/sharkdp/fd).

We can configure `FZF` to use `fd` by adding a line like the following to
our `~/.vimrc` file.

```vimscript
let $FZF_DEFAULT_COMMAND = 'fd --type f --color=always'
```

This will use `fd` to find files (`--type f`) using colorful output.

We can remove some noise from the output by adding a couple extra flags:

```vimscript
let $FZF_DEFAULT_COMMAND = 'fd --type f --color=always' --exclude .git --ignore-file ~/.gitignore'
```

This will keep the `.git` directory out of the result and prevent anything
listed in the main `.gitignore` file from being found.
