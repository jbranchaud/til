# Target Another Repo When Creating A PR

I have a [`dotfiles` repo](https://github.com/jbranchaud/dotfiles) that I forked
from [`dkarter/dotfiles`](https://github.com/dkarter/dotfiles). I'm adding a
bunch of my own customizations on a `main` branch while continually pulling in
and merging upstream changes.

The primary remote according to `gh` is `jbranchaud/dotfiles`. 98% of the time
that is what I want. However, I occasionally want to share some changes upstream
via a PR. Running `gh pr create` as is will create a PR against my fork. To
override this on a one-off basis, I can use the `--repo` flag.

```bash
$ gh pr create --repo dkarter/dotfiles
```

This will create a PR against `dkarter:master` from my branch (e.g.
[`jbranchaud:jb/fix-hardcoded-paths`](https://github.com/dkarter/dotfiles/pull/373)).

See `man gh-pr-create` for more details.
