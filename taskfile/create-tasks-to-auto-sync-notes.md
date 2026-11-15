# Create Tasks To Auto-Sync Notes

I have a private _notes_ repo that I side-load onto my [TIL repo](https://github.com/jbranchaud/til) as a git submodule. That is where I can
take notes about specific potential TIL topics. I can update and version those
notes over time and know that they are backed up on GitHub.

The core way that I interact with the `NOTES.md` file (that's the only file in
the repo) is a long-running vim / neovim session. My edit task ensures the
latest changes to that repo are synced as the editor opens and when I save and
quit the editor session, it pushes up the latest.

Here is the primary task I run `task notes:edit`:

```yaml
notes:edit:
  desc: All-in-one edit, commit, and push notes
  cmds:
    - task notes:open
    - task notes:push
```

It first runs `task notes:open`. Once that completes (when I run `:wq` in my
`nvim` session), which could be hours or days later, it will run the next task
(`task notes:push`) which commits and pushes the latest changes in the submodule
repo up to GitHub.

Here is the `notes:open` task:

```yaml
notes:open:
  desc: Opens NOTES.md (syncs latest changes first) in default editor
  deps: [notes:sync]
  cmds:
    - $EDITOR {{.NOTES_FILE}}
  interactive: true
```

Notice that this one depends on `notes:sync`, so the repo will be synced from
the remote before it opens the `{{.NOTES_FILE}}` with my configured `$EDITOR`
(`nvim` in my case). The `interactive: true` is important because that is what
allows this to be a long-running editor process.

Here are the `notes:sync` and `notes:push` tasks for reference:

```yaml
  notes:sync:
    desc: Sync latest changes from the notes submodule
    cmds:
      - cd {{.NOTES_DIR}} && git checkout main && git pull
    silent: false

  notes:push:
    desc: Commit and push changes to notes submodule
    dir: '{{.NOTES_DIR}}'
    cmds:
      - git add NOTES.md
      - git commit -m "Update notes - $(date '+%Y-%m-%d %H:%M')"
      - git pull --rebase
      - git push
    status:
      - git diff --exit-code NOTES.md
    silent: false
```

Both `{{.NOTES_FILE}}` and `{{.NOTES_DIR}}` are template interpolations of
static values specific to my repo that are set toward the top of the
`Taskfile.yml` in a `vars` section.

Here is the [full `Taskfile.yml`](https://github.com/jbranchaud/til/blob/master/Taskfile.yml) if
you want to check it out.
