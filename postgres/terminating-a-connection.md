# Terminating A Connection

Consider the scenario where you are trying to drop a database, but there are
existing connections.

```bash
$ dropdb sample_db
dropdb: database removal failed: ERROR:  database "sample_db" is being accessed by other users
DETAIL:  There is 1 other session using the database.
```

If you don't know where these connections are, you can terminate them within
a `psql` session. You just have to figure out the `pid` of those
connections. In [List Connections To A
Database](list-connections-to-a-database.md), I explained how to
get at the `pid` values of connections. Using the `pid` value and
`pg_terminate_backend()`, you can terminate a connection.

```sql
> select pg_terminate_backend(12345);
 pg_terminate_backend
----------------------
 t
```

To terminate all connections to a particular database, use a query like the
following:

```sql
select pg_terminate_backend(pg_stat_activity.pid)
from pg_stat_activity
where pg_stat_activity.datname = 'sample_db'
  and pid <> pg_backend_pid();
 pg_terminate_backend
----------------------
 t
```

This excludes the current session, so you'll need to exit `psql` as well
before dropping the database.

[source](http://stackoverflow.com/questions/5408156/how-to-drop-a-postgresql-database-if-there-are-active-connections-to-it)
