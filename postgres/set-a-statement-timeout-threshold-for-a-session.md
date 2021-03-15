# Set A Statement Timeout Threshold For A Session

The `statement_timeout` variable is used to tell the PostgreSQL server that you
want it to terminate statements (queries and transactions) that run past the
specified threshold. This is a great way to [prevent runaway
queries](https://blog.crunchydata.com/blog/control-runaway-postgres-queries-with-statement-timeout)
in a production environment.

You can set this threshold with a `set` statement. It can take an integer
argument of milliseconds. Here I set it to a timeout of 1 minute.

```sql
> set statement_timeout = 60000;
SET
> show statement_timeout;
 statement_timeout
-------------------
 1min
(1 row)
```

This will set the `statement_timeout` for the duration of the session. It won't
effect other sessions.

You can also set the threshold with a string argument which allows you to
include a unit of time. Here I set it to 30 seconds.

```sql
> set statement_timeout = '30s';
SET
> show statement_timeout;
 statement_timeout
-------------------
 30s
(1 row)
```

Now that the `statement_timeout` is set to `30s`, I can run a query that I know
will exceed that threshold
([`pg_sleep`](https://www.postgresql.org/docs/current/functions-datetime.html#FUNCTIONS-DATETIME-DELAY)).

```sql
> select pg_sleep(31);
ERROR:  canceling statement due to statement timeout
Time: 30001.997 ms (00:30.002)
```

After 30 seconds have passed, the Postgres server will interrupt the query.
