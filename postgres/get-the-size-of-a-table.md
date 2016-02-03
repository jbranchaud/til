# Get The Size Of A Table

In [Get The Size Of A Database](get-the-size-of-a-database.md), I showed a
PostgreSQL administrative function, `pg_database_size()`, that gets the size
of a given database. With the `pg_relation_size()` function, we can get the
size of a given table. For instance, if we'd like to see the size of the
`reservations` table, we can executing the following query:

```sql
> select pg_relation_size('reservations');
 pg_relation_size
------------------
          1531904
```

This gives us the size of the `reservations` table in bytes. As you might
expect, the referenced table needs to be part of the connected database and
on the search path.

See [the Postgres docs](http://www.postgresql.org/docs/current/static/functions-admin.html) for more details.
