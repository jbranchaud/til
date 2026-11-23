# Run Specific Scheduled Workflow Early

I have a file in the [`still`](https://still.visualmode.dev) codebase called
`sync-tils.yml` which lives in `.github/workflows/`. This specifies a GitHub
Actions job that is supposed to run once a day on a specific cron schedule. It
looks for the latest additions to my [TIL
repo](https://github.com/jbranchaud/til) and syncs them to _still_.

I was making some Cloudflare DNS proxy changes yesterday. One of the things I
wanted to check after making that change was that my sync script wasn't
impacted. Instead of waiting for cron to trigger the job early this morning, I
manually triggered it.

```bash
❯ gh workflow run sync-tils.yml
✓ Created workflow_dispatch event for sync-tils.yml at main
https://github.com/jbranchaud/still/actions/runs/44989414470

To see the created workflow run, try: gh run view 44989414470
To see runs for this workflow, try: gh run list --workflow="sync-tils.yml"
```

I could inspect the workflow run, which is still in-progress here.

```bash
❯ gh run view 44989414470

* main Sync TILs · 44989414470
Triggered via workflow_dispatch less than a minute ago

JOBS
* sync (ID 137106980079)

For more information about the job, try: gh run view --job=137106980079
View this run on GitHub: https://github.com/jbranchaud/still/actions/runs/44989414470
```

And I could also pull in more information about the job like so.

```bash
❯ gh run view --job=137106980079

✓ main Sync TILs · 44989414470
Triggered via workflow_dispatch less than a minute ago

✓ sync in 10s (ID 137106980079)
  ✓ Set up job
  ✓ Run actions/checkout@v7
  ✓ Run actions/checkout@v7
  ✓ Run ruby/setup-ruby@v1
  ✓ Sync posts
  ✓ Post Run actions/checkout@v7
  ✓ Post Run actions/checkout@v7
  ✓ Complete job

To see the full job log, try: gh run view --log --job=137106980079
View this run on GitHub: https://github.com/jbranchaud/still/actions/runs/44989414470
```
