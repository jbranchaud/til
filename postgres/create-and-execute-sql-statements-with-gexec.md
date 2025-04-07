# Create And Execute SQL Statements With \gexec

The [`\gexec`
meta-command](https://www.postgresql.org/docs/current/app-psql.html#APP-PSQL-META-COMMAND-GEXEC)
is a variation of the [`\g`
meta-command](https://www.postgresql.org/docs/current/app-psql.html#APP-PSQL-META-COMMAND-G),
both of which can be used in a `psql` session. Whereas the `\g` command sends
the current query in the buffer to the PostgreSQL server for execution, the
`\gexec` command first sends the query to the server for execution and then
executes each row of the result as its own SQL statement.

This is both a bit absurd and powerful. And a bit unnecessary considering all
of the scripting capabilities with anything from bash to any language with a
SQL client library.

Nevertheless, let's take a look at a contrived example of how it works. Here,
we have a SQL statement that does some string concatenation based off values in
an array. This results in three separate `create schema` statements.

```sql
> select
    'create schema if not exists schema_' || letter || ';'
  from unnest(array['a', 'b', 'c']) as letter
  \gexec

CREATE SCHEMA
CREATE SCHEMA
CREATE SCHEMA

> \dn
       List of schemas
   Name   |       Owner
----------+-------------------
 public   | pg_database_owner
 schema_a | postgres
 schema_b | postgres
 schema_c | postgres
(4 rows)
```

Three new schemas get created which we can inspect with `\dn`.

Notice, if we simply execute the primary statement, we can see the intermediate
result that `\gexec` will subsequently execute.

```sql
> select
    'create schema if not exists schema_' || letter || ';'
  from unnest(array['a', 'b', 'c']) as letter
  \g

               ?column?
---------------------------------------
 create schema if not exists schema_a;
 create schema if not exists schema_b;
 create schema if not exists schema_c;
(3 rows)
```
