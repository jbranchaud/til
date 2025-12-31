# Create Interactive Picker For Set Of Subtasks

For [my TIL repo](https://github.com/jbranchaud/til), I have a `Taskfile.yml`
that defines a set of `notes:*` tasks for interacting with a `NOTES.md` file
that lives in a private Git submodule.

I wanted to make it easier on myself to not have to remember all the different
`notes` subtasks, so I created a helper task to make it easy to see the options
and run one.

A summary of the Taskfile is shown below including the entirety of the `notes`
task. That task will parse a listing of the available tasks (via `task --list`
and some `sed` commands) and pass those to `fzf` to provide an interactive
picker of the available subtasks.

```yaml
tasks:
  notes:
    desc: Interactive picker for notes tasks
    cmds:
      - |
        TASK=$(task --list | grep "^\* notes:" | sed 's/^\* notes://' | sed 's/\s\+/ - /' | fzf --prompt="Select notes task: " --height=40% --reverse) || true
        if [ -n "$TASK" ]; then
          TASK_NAME=$(echo "$TASK" | awk '{print $1}' | sed 's/:$//')
          task notes:$TASK_NAME
        fi
    interactive: true
    silent: true

  notes:edit:
    ...

  notes:sync:
    ...

  notes:open:
    ...

  notes:push:
    ...

  notes:status:
    ...

  notes:pull:
    ...

  notes:diff:
    ...

  notes:log:
    ...
```

Now I can run the `notes` task to get a summary and interactive picker that
looks like the following:

```sh
❯ task notes
Select notes task: 
  9/9
> │                    Interactive picker for notes tasks
  diff:                Show uncommitted changes in notes
  edit:                All-in-one edit, commit, and push notes
  log:                 Show recent commit history for notes
  open:                Opens NOTES.md (syncs latest changes first) in default editor
  pull:                Pull latest changes (alias for sync)
  push:                Commit and push changes to notes submodule
  status:              Check status of notes submodule
  sync:                Sync latest changes from the notes submodule
```

It pulls in the subtask name and description. I can then use `fzf`'s navigation
and filtering to narrow down and select the task I want to run.
