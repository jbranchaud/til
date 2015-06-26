# Default Schema

Schemas can be used to organize tables within a database. You can see all
the schemas your database has like so

```sql
> select schema_name from information_schema.schemata;
    schema_name
--------------------
 pg_toast
 pg_temp_1
 pg_toast_temp_1
 pg_catalog
 public
 information_schema
(6 rows)
```

When you create a new table, it will need to be placed under one of these
schemas. So if you have a `create table posts (...)`, how does postgres know
what schema to put it under?

Postgres checks your `search_path` for a default.

```sql
> show search_path;
   search_path
-----------------
 "$user", public
(1 row)
```

From our first select statement, we see that there is no schema with my user
name, so postgres uses public as the default schema.

If we set the search path to something that won't resolve to a schema name,
postgres will complain

```sql
> set search_path = '$user';
SET
> create table posts (...);
ERROR:  no schema has been selected to create in
```
