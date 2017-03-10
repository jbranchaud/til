# Prepare, Execute, and Deallocate Statements

In PostgreSQL, you can prepare a named statement to be executed later using
[`prepare`](https://www.postgresql.org/docs/current/static/sql-prepare.html).

```sql
> prepare column_names (text) as
    select column_name from information_schema.columns where table_name = $1;
PREPARE
```

These statements are kept around for the duration of the session. To see the
available statements, check out the `pg_prepared_statements` view.

```sql
> select * from pg_prepared_statements;
     name     |                                  statement                                  |         prepare_time          | parameter_types | from_sql
--------------+-----------------------------------------------------------------------------+-------------------------------+-----------------+----------
 column_names | prepare column_names (text) as                                             +| 2017-03-10 15:01:09.154528-06 | {text}          | t
              |   select column_name from information_schema.columns where table_name = $1; |                               |                 |
```

To run a prepared statement, use `execute` with the name of the statement
and any arguments.

```sql
> execute column_names('users');
   column_name
-----------------
 id
 email
 password_digest
 created_at
 updated_at
 first_name
 last_name
```

You can also delete a statement with
[`deallocate`](https://www.postgresql.org/docs/current/static/sql-deallocate.html)
if you'd like.

```sql
> deallocate column_names;
DEALLOCATE
```
