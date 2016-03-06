# List All The Databases

There are two ways to list all the available databases. The first is a
`psql` only command:

```
\list
```

The second approach is to query the `pg_database` table. Something like the
following will suffice:

```sql
select datname from pg_database;
```
