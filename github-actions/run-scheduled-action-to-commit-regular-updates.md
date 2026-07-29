# Run Scheduled Action To Commit Regular Updates

The quintessential example of what GitHub Actions are used for is running CI
tasks like the test suite, type checker, linter, etc. Each CI step runs to
completion and either passes or fails and you see the results in the GitHub PR
interface. That's a great use case, but far from the only one. GitHub Actions
are a much more general-purpose execution environment that can be used for much
more.

Here is a recent example that expanded my mind a bit on what is possible with
GitHub actions. Imagine a GitHub Action that is scheduled to run once a day, it
executes a script that might make changes to the repo itself (e.g. the
`README.md`), and then commits those changes (self-updating the repo).

Here is a minimal version of a workflow that does that:

```yaml
on:
  schedule:
    - cron: '17 11 * * *' # daily at 11:17 UTC (06:17 CT)
  workflow_dispatch:

permissions:
  contents: write

jobs:
  update:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4 # get the repo + push credentials

      - run: ./bin/regenerate_readme.sh # apply updates to README

      - run: |
          git config user.name  "github-actions[bot]"
          git config user.email "github-actions[bot]@users.noreply.github.com"
          git add -A README.md
          git diff --staged --quiet || {
            git commit -m "chore: regenerate README with latest updates"
            git push
          } # commit updates to README if there are any, otherwise no-op
```

Once a day at 11:17 UTC, GitHub Actions will run this workflow which is made up
of a single job with permissions to write to the repo.

- First, it checks out the repo in the job container which includes push
credentials.
- Then it runs a script that might update the README (e.g. maybe based on other
things that have since been committed to the repo).
- Last, it attempts to stage any changes the script made to the README. If there
are any, then it will commit them with that generic commit message. Finally it
will push that commit to the main branch.

If this all sounds a bit untethered from a real-world example, then take a look
at how I use this exact pattern to [apply daily updates to my GitHub Profile
README](https://github.com/jbranchaud/jbranchaud/blob/main/.github/workflows/update-tils.yml)
based on the latest [TILs](https://github.com/jbranchaud/til) I have written.
