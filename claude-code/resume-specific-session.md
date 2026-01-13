# Resume Specific Session

There are a few different ways to resume a [Claude
Code](https://code.claude.com/docs/en/overview) session.

First, if I have exited a session for the current project and I want to pick
back up with that most recent one, then I can use `claude --continue`.

If I have had a few recent sessions for the current project and I want to
remember what they were and pick up where I left off with one of them, then I
can use `claude --resume` (with no argument). That will open a picker where I
can browser through a summary of the recent sessions based on their starting
prompt. The one I pick is the session that will be resumed.

Finally, if I have grabbed a specific session ID (UUID) during the session from
the `/status` output, then I can reference that value directly.

```sh
$ claude --resume 92170532-be31-4a91-b2a9-025b8fa78232
```

See `claude --help` for more details.
