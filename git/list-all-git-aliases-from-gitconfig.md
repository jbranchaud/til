# List All Git Aliases From gitconfig

Running the `git config --list` command will show all of the configuration
settings you have for `git` relative to your current location. Though most of
these setting probably live in `~/.gitconfig`, you may also have some locally
specified ones in `.git/config`. This will grab them all including any `alias`
entries.

We can narrow things down to just `alias` entries using the `--get-regexp` flag.

```bash
$ git config --get-regexp '^alias\.'

alias.ap add --patch
alias.authors shortlog -s -n -e
alias.co checkout
alias.st status
alias.put push origin HEAD
alias.fixup commit --fixup
alias.squash commit --squash
alias.doff reset HEAD^
alias.add-untracked !git status --porcelain | awk '/\?\?/{ print $2 }' | xargs git add
alias.reset-authors commit --amend --reset-author -CHEAD
```

I use `git doff` all the time on feature branches to "pop" the latest commmit
onto the working copy. I was trying to remember exactly what the `git doff`
command is and this was an easy way to check.
