# Include All Queries In The Log File

The default log-level (`log_statement` setting) for a PostgreSQL server is
`none`. Other valid log-levels for [that setting are `ddl`, `mod`, and
`all`](https://www.postgresql.org/docs/13/runtime-config-logging.html).

If you want to see all the queries hitting a database, you'll want to set it to
`all`. This can be set as a server-wide setting or it can be set on a
per-session basis.

Because `all` is so noisy, I like to use it on a per-session basis when I'm in
a situation where I know I'd like to see all queries.

```sql
> set log_statement = 'all';
```

After running that statement in my `psql` session, I can tail the log file to
keep an eye on queries hitting the database.

Be sure that [logging is enabled via the
`logging_collector`](enable-logging-of-database-activity.md) as well.
