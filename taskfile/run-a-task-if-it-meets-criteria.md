# Run A Task If It Meets Criteria

The [Taskfile `status`
directive](https://taskfile.dev/docs/guide#limiting-when-tasks-run) can be used
to tell a task when it needs to run. If it doesn't need to run, it can be
skipped over. The idea being that we're making a status check to see if we're
up-to-date or need to run the task.

For instance, here is a `status` check that determines if there are changes to
commit and push. If there are changes to `NOTES.md`, then we are out-of-date and
need to run the `cmds` that make up the task.

```yaml
  notes:push:
    desc: Commit and push changes to notes submodule
    dir: '{{.NOTES_DIR}}'
    cmds:
      - git add NOTES.md
      - git commit -m "Update notes - $(date '+%Y-%m-%d %H:%M')"
      - git push
    status:
      - git diff --exit-code NOTES.md
    silent: false
```

This is useful because I don't want the `git add`, `git commit`, and `git push`
commands to run when there is nothing to do.

Note: this is different from the `preconditions` directive. Instead of
short-circuiting a sequence of tasks, this will either run or skip the task and
move on to the next one.
