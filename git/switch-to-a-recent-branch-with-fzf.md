# Switch To A Recent Branch With FZF

[Git](https://git-scm.com/) and [FZF](https://github.com/junegunn/fzf) make
a powerful team. Once you've installed FZF on your machine, there are all
kinds of add-on scripts that you can include in your shell configuration.

This one, for instance, is a personal favorite.

```bash
fbr() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}
```

When you run the `fbr` command from your shell, FZF will compile a list of
the most recently committed to branches (including remote branches). That
list will then be available in a standard FZF prompt so that you can choose
the branch you want to switch to.

[source](https://github.com/junegunn/fzf/wiki/examples)
