# Search For Gem Versions Available To Install

The [`gem list`](https://guides.rubygems.org/command-reference/#gem-list)
command combined with a few flags will produce a listing of all available
versions of that gem like so:

```bash
gem list rails --exact --remote --all

*** REMOTE GEMS ***

rails (7.1.0, 7.0.8, 7.0.7.2, 7.0.7.1, 7.0.7, ...)
```

I can then apply a bit of command-line transformation with `sed` and `tr` to
turn that list of version numbers into a list that can be nicely consumed by
other commands. In particular, I will pipe that list to `fzf` so that I can
fuzzy-search through the huge list for specific version matches.

```bash
$ gem list rails --exact --remote --all \
  | sed -n 's/.*(\([^)]*\)).*/\1/p' \
  | tr ',' '\n' \
  | sed 's/^ //' \
  | fzf
```

The first `sed` command captures everything inside the parentheses. The `tr`
command replaces the commas with new lines. And the second `sed` command
removes those leading space on each line.

Lastly, [`fzf`](https://github.com/junegunn/fzf) provides a fuzzy-search
interface over the list of versions.
