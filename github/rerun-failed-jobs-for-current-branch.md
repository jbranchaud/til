# Rerun Failed Jobs For Current Branch

I have a branch that I've already opened a PR for. I've made more changes, run
the tests, and pushed up the latest to the remote. I know the tests should have
been green, but I'm seeing a flickering test fail in CI. I want to retrigger the
relevant failed jobs to see if I can get the flickers to pass.

First, I need to figure out the workflow ID with any failed jobs.

```bash
❯ gh run list --branch "$(git branch --show-current)" --status failure
STATUS  TITLE           WORKFLOW      BRANCH        EVENT         ID           ELAPSED  AGE
X       Better comp...  Ruby on R...  jbranchau...  pull_request  38778306948  10m54s   about 25 ...
```

This one-liner does that by referencing the current branch (via `git`) and then
asking `gh` to list failed workflows associated with that branch.

Grabbing the `ID` value, I can then ask `gh` to rerun failed jobs for that
workflow.

```bash
❯ gh run rerun 38778306948 --failed
✓ Requested rerun (failed jobs) of run 38778306948
```

Opening that PR up in the browser, I can see that the specific workflow has been
rerun and is currently _in progress_.

See `gh run list --help` and `gh run rerun --help` for more details.
