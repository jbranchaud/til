# Restart Process Managed By `process-compose`

I'm working on a project where we are experimenting with
[`process-compose`](https://github.com/F1bonacc1/process-compose) as a better
way orchestrate a set of processes that all need to be running for a web
development server (Rails) to work. This includes the Rails server itself, a
JavaScript build process, PostgreSQL, a background worker process, etc.

In the past [I've used `overmind` with
Procfiles](/rails/run-dev-processes-with-overmind-instead-of-foreman.md) to do a
similar sort of thing. No matter what tooling is in play, from time to time, I
will eventually need to restart one of the processes that has become stale.

The `vite` (JavaScript build) process is a good example of this. Configuration
changes, new `npm` dependencies, and tailwind classes on new files can all lead
to the build being stale.

From the `process-compose` TUI, I can navigate the cursor over the `vite`
process and hit `Ctrl-r` to restart the process.

I can also issue a restart via the CLI like so:

```
❯ mise exec -- process-compose process restart vite
Process vite restarted
```

[source](https://f1bonacc1.github.io/process-compose/cli/process-compose_process_restart/)
