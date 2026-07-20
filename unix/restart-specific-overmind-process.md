# Restart Specific Overmind Process

I have been in the bad habit of fully killing and re-running the entire
`overmind` process for a project whenever I have a new JavaScript file that I
need `vite` to pick up and bundle. `vite` is only one of three processes, so I'm
restarting two processes unnecessarily.

```bash
❯ overmind status
PROCESS   PID       STATUS
web       50897     running
vite      50898     running
worker    50899     running
```

Instead, what I can do is specifically target the `vite` process for a
`restart`.

```bash
❯ overmind restart vite
```

This will restart that specific process, ensuring that the new JS files get
picked up and bundled.

I can clearly see that only `vite` was restarted by looking at the `status`
subcommand again.

```bash
❯ overmind status
PROCESS   PID       STATUS
web       50897     running
vite      84163     running
worker    50899     running
```

Notice the `web` and `worker` processes still have the same PIDs, but `vite` has
a new much higher PID.

See `overmind restart --help` for more details.
