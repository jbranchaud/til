# Open A PR To An Unforked Repo

Sometimes I will clone a repo to explore the source code or to look into a
potential bug. If my curiosity takes me far enough to make some changes, then I
jump through the hoops of creating a fork, reconfiguring branches, pushing to my
fork, and then opening the branch as a PR against the original repo.

The `gh` CLI allows me to avoid all that hoop-jumping. Directly from the cloned
repo I can use `gh` to create a new PR. It will prompt me to creat a fork. If I
accept, it will seamlessly create it and then open a PR from my fork to the
original.

```bash
$ gh pr create
```

This allows me to create the PR with a few prompts from the CLI. If you prefer,
you can include the `--web` flag to open the PR creation screen directly in the
browser.
