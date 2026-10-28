# Create A Private Repo From The CLI

The vast majority of the GitHub repos that I've created over my career have been
done from the web UI. It was only recently that I found out that [I can create a
new repo from the CLI with `gh`](create-and-push-to-new-repo-from-cli.md).

A repo can be created for the current directory (where a local git repo already
exists) using the `gh repo create` command. I'm wanting this to be a private
repo so I can include the `--private` flag instead of the `--public` flag.

```bash
❯ gh repo create marathon-training --private --source=. --remote=origin --push
✓ Created repository jbranchaud/marathon-training on github.com
  https://github.com/jbranchaud/marathon-training
✓ Added remote https://github.com/jbranchaud/marathon-training.git
Enumerating objects: 125, done.
Counting objects: 100% (125/125), done.
Delta compression using up to 16 threads
Compressing objects: 100% (114/114), done.
Writing objects: 100% (125/125), 56.69 KiB | 14.17 MiB/s, done.
Total 125 (delta 52), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (52/52), done.
To https://github.com/jbranchaud/marathon-training.git
 * [new branch]      HEAD -> main
branch 'main' set up to track 'origin/main' by rebasing.
✓ Pushed commits to https://github.com/jbranchaud/marathon-training.git
```

Since I am running this command from the root directory of the git-backed
project, I specify the `--source` as `.` (mean _here_, the current directory).
The remaining flags tell it what the remote should be set up as and that I want
to push this local repo up to the GitHub remote once it is created.

See `gh repo create --help` for more details.
