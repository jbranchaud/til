# Do Project Time Tracking From The CLI

The [`watson` CLI utility](https://github.com/jazzband/Watson) is built to help
track time across projects right from the terminal. It is written in Python and
can be installed via `brew` or `pip3`.

To start tracking a new or existing project, I can specify it by name like so:

```bash
$ watson start my-project +reporting
Starting project my-project [reporting] at 00:28
```

This starts a timer for the `my-project` project and includes the tag
`reporting`. Tags are optional but can give some context to what part of a given
project this time session is for.

At any point during a session, we can check the status.

```bash
$ watson status
Project my-project [reporting] started 14 seconds ago (2025.11.14 00:28:31-0600)
```

And when we are done working on that project for the time being, we can stop it.

```bash
$ watson stop
Stopping project my-project [reporting], started a minute ago and stopped just now. (id: e8e8ed5)
```

Once we're ready to start another session (`timeframe`), we just need to run
`watson start ...` again.

See `watson --help` for other subcommands provided by the utility.
