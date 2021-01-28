# View The PR For The Current GitHub Branch

As you're working on a feature branch, you may push up an early PR to get your
work-in-progress out in public. You can then continue to work locally and push
up changes.

If at any point in this process you want to view the PR, you can open a browser
tab, visit GitHub, and navigate a few pages to the specific PR. There is a
faster using GitHub's CLI -- [`gh`](https://cli.github.com/).

You can view the main details of the PR for the current branch right in your
terminal with:

```bash
$ gh pr view
```

You can also open up the PR for the current branch in your browser by adding in
the `--web` flag.

```bash
$ gh pr view --web
```

See `gh pr --help` for more details.
