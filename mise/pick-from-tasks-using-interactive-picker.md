# Pick From Tasks Using Interactive Picker

In [Add Mise Tasks For Common Workflow
Commands](https://www.visualmode.dev/add-mise-tasks-for-common-workflow-commands),
I wrote about a set of tasks I added as shortcuts for connecting to the `rails console` in various environments.

```toml
# mise.toml
[tasks."console:staging"]
description = "Open a Rails console on staging"
run = "ssh -t my-app-staging dokku run my-app rails console"

[tasks."console:prod"]
description = "Open a Rails console on production"
run = "ssh -t my-app-prod dokku run my-app rails console"
```

When a project is configured with multiple `mise` tasks like this, we can invoke
`mise run` without any specific arguments and it will prompt you with an
interactive picker. The picker will populate with all the tasks like so:

```bash
❯ mise run
Tasks
Select a task to run
❯ console:prod     Open a Rails console on production
  console:staging  Open a Rails console on staging
/
esc clear filter • enter confirm
```

We can navigate between the options with the arrow keys (and if we exit _filter_
mode by hitting `esc`, then `j/k` also work to move down and up). While in
_filter_ mode, we can type into the prompt which will filter the list of
commands down to just the partial matches.

Once we're targeting the task we want to run, we hit `enter` and the task is
executed.
