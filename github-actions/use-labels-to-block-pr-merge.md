# Use Labels To Block PR Merge

Let's say our GitHub project has custom tags for both `no merge` and `wip`
(_work in progress_). Whenever either of those labels has been applied to a PR,
we want there to be a failed check so as to block the merge. This is useful to
ensure automated tools (as well as someone not looking closely enough) don't
merge a PR that isn't _ready to go_.

This can be achieved with a basic GitHub Actions workflow that requires no
3rd-party actions. We can add the following as
`.github/workflows/block-labeled-prs.yml` in our project.

```yaml
name: Block Labeled PR Merges

on:
  pull_request:
    types: [labeled, unlabeled, opened, edited, synchronize]

jobs:
  prevent-merge:
    if: ${{ contains(github.event.*.labels.*.name, 'no merge') || contains(github.event.*.labels.*.name, 'wip') }}
    name: Prevent Merging
    runs-on: ubuntu-latest
    steps:
      - name: Check for label
        run: |
          echo "Pull request label prevents merging."
          echo "Labels: ${{ join(github.event.*.labels.*.name, ', ') }}"
          echo "Remove the blocking label(s) to skip this check."
          exit 1
```

This workflow is run when a pull request is opened, when it is edited or
synchronized, and when a label change is made. The job `prevent-merge` sees if
any of the label names match `no merge` or `wip`. If so, we echo out some
details in the ubuntu container and then `exit 1` to fail the check.

Shoutout to [Jesse Squire's
implementation](https://www.jessesquires.com/blog/2021/08/24/useful-label-based-github-actions-workflows/#updated-21-march-2022)
which I've heavily borrowed from here.
