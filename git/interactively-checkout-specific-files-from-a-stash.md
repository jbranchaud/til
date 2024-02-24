# Interactively Checkout Specific Files From A Stash

This command will prompt you with a list of the stashes in your current git
repo. Once you select one of them from the interactive fzf prompt, you will
then be prompted with another fzf prompt, this second one allow multi-select.
From there you can tab select the files you want to checkout. Once you've
marked the ones you want, hit enter and those files will be checked out to your
index.

```bash
git stash show --name-only $(
  git stash list \
  | fzf --height=20% --reverse \
  | sed 's/:.*//'
) \
| fzf --height=20% --multi --sync \
| xargs -I {} sh -c 'git checkout stash@{0} -- {}'
```
