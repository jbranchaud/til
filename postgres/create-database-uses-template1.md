# Create Database Uses Template1

Whenever you use the [`create
database`](https://www.postgresql.org/docs/current/sql-createdatabase.html)
query, unless otherwise specified, it will create it by cloning `template1` by
default.

You can view, inspect, and even modify this database template by connecting to
it.

```sql
\c template1
```

Every Postgres cluster starts with two templates.

```sql
select datname from pg_database where datistemplate = true;
  datname
-----------
 template1
 template0
(2 rows)
```

You cannot however connect to and modify `template0`. It is a fallback clone of
`template1` that you can utilize if you ever modify `template1` and need to
restore it.

[source](https://supabase.io/blog/2020/07/09/postgresql-templates/)
