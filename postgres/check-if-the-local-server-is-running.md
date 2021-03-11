# Check If The Local Server Is Running

An install of PostgreSQL comes with a number of utilities including the
`pg_isready` command. This command can be used to check if the local PostgreSQL
server is up, running, and ready to receive connections.

If the server has not yet been started, running the command will result in a
`no response` response.

```bash
$ pg_isready
localhost:5432 - no response
```

In this case, the `pg_ctl` command can be used to start the server.

```bash
$ pg_ctl -D $HOME/.asdf/installs/postgres/12.3/data start
waiting for server to start....

...

 done
server started
```

It tells us that the server is started and we can confirm that by again running
`pg_isready`.

```bash
$ pg_isready
localhost:5432 - accepting connections
```

This command is most useful as part of a script, such as in a CI environment.
In that case, you may not want it writing to `stdout`, you just want to use the
command's exit code. For that, you can tack on the `--quiet` flag.

```
$ pg_isready --quiet
```

[source](https://www.postgresql.org/docs/current/app-pg-isready.html)
