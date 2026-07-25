# Create And Push To New Repo From CLI

I figured there must be a good way to create a new repo in GitHub using the `gh`
CLI based on a local git repo. I spend so much time in existing git projects
that already have GitHub repos that I haven't had the chance to figure this out.
Until now.

I just finished a first pass on a fresh project for [a GitHub profile
README](https://github.com/jbranchaud/jbranchaud). It was time to put it up on
GitHub and see if worked. Instead of going through the GitHub web UI to create
this new repo, I found the `gh repo create` subcommand. I then asked Claude what
flags I needed for my use case. The recommendation was as follows:

```bash
❯ gh repo create --public --source=. --remote=origin --push
✓ Created repository jbranchaud/jbranchaud on github.com
  https://github.com/jbranchaud/jbranchaud
✓ Added remote https://github.com/jbranchaud/jbranchaud.git
Enumerating objects: 11, done.
Counting objects: 100% (11/11), done.
Delta compression using up to 16 threads
Compressing objects: 100% (6/6), done.
Writing objects: 100% (11/11), 4.21 KiB | 4.21 MiB/s, done.
Total 11 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
To https://github.com/jbranchaud/jbranchaud.git
 * [new branch]      HEAD -> main
branch 'main' set up to track 'origin/main' by rebasing.
✓ Pushed commits to https://github.com/jbranchaud/jbranchaud.git
```

This created the repo on GitHub for my authenticated profile (`jbranchaud`)
using the name of the current directory (`jbranchaud`). It then setup the
`origin` remote to point to that repo on GitHub. It then pushed the current
state of `main` up to the remote.

- `--public` configures the created repo to be a public, rather than private,
one.
- `--source=.` tells the command to run for the current directory (I ran this
from the root of this new project)
- `--remote=origin` tells it what the remote should be called, though `origin`
is the default, so this wasn't strictly necessary
- `--push` tells the command to push to the remote once it is created and
configured

See `gh repo create --help` for more details and examples.
