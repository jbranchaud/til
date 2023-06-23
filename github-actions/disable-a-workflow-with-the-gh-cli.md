# Disable A Workflow With The gh CLI

You may want to temporarily disable a GitHub Actions workflow without deleting
the file for the workflow. In my case, this is handy because I want to keep a
scheduled workflow around as a point of reference, but I don't want it running
all the time.

This can be done with [the `workflow` subcommand of the `gh`
CLI](https://docs.github.com/en/actions/using-workflows/disabling-and-enabling-a-workflow?tool=cli).

First, list the workflows for your current repo so that you can figure out the
workflow ID that you want to disable.

```bash
$ gh workflow list
GitHub Actions Demo          active  60018591
Playwright Demo              active  60142509
Scheduled Actions Demo       active  60028624
```

Now, copy the ID of the workflow you want to disable. In my case, it is
`60028624`.

Then, run the `disable` command for that workflow ID:

```bash
$ gh workflow disable 60028624
✓ Disabled Scheduled Actions Demo
```

That workflow is now disabled and it is no longer going to show up in the
default listing of workflows.

If you want to see it in the list though, you can include the `--all` flag.

```bash
$ gh workflow list --all
GitHub Actions Demo          active             60018591
Playwright Demo              active             60142509
Scheduled Actions Demo       disabled_manually  60028624
```
