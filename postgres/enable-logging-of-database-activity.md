# Enable Logging Of Database Activity

For logging to be enabled for a PostgreSQL server, it needs to be properly
configured. This means ensuring the `logging_collector` option is on. By
default I believe it is `off`.

This is configured in the `postgresql.conf` file and requires a server restart.

First, to find where the conf file is. I can answer that question in a `psql`
session.

```sql
> show config_file;
                             config_file
---------------------------------------------------------------------
 /Users/jbranchaud/.asdf/installs/postgres/12.3/data/postgresql.conf
(1 row)
```

Now, I can open up that file and search for the line that has
`logging_collector`. I uncomment that line and change `off` to `on`.

```
# This is used when logging to stderr:
logging_collector = on 		# Enable capturing of stderr and csvlog
					# into log files. Required to be on for
					# csvlogs.
					# (change requires restart)
```

This requires a restart of the Postgres server.

```bash
$ ~/.asdf/installs/postgres/12.3/bin/pg_ctl -D ~/.asdf/installs/postgres/12.3/data restart
waiting for server to shut down.... done
server stopped
waiting for server to start...
 done
server started
```

I can now adjust any further logging-related configurations on a server or
session basis. And then view those logs.
