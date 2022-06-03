# Dump The SQL Needed To Recreate A Table

The [`pg_dump`](https://www.postgresql.org/docs/current/app-pgdump.html)
command and its arsenal of flags can do a lot of things. This includes
producing the set of [DDL](https://www.postgresql.org/docs/current/ddl.html)
SQL commands needed to recreate a table and all of it sequences, constraints,
and indexes.

The primary flags to know about for this scenario are `-t` (which lets you
specify a table) and `--schema-only` (which indicates that we want to exclude
data from the data).

```bash
$ pg_dump -t 'users' --schema-only my_database > users.schema.sql
```

Run a command like to create a file `users.schema.sql` that will contain a
series of SQL commands that will:

- create the table with its columns (including defaults, `not null` constraints, etc.)
- create and set the sequence on a serial ID column
- add any foreign key constraints
- create any indexes

Then if you're ever wanting to recreate this table, you can hand that file
directly to `pg_restore`. Or, since it is in SQL, you can run those commands
manually.

There are a ton of flags beyond the two covered here. Read about them in the
[`pg_dump` docs
pages](https://www.postgresql.org/docs/current/app-pgdump.html).
