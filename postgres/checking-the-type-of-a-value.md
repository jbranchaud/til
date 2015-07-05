# Checking The Type Of A Value

The `pg_typeof()` function allows you to determine the data type of anything
in Postgres.

```sql
> select pg_typeof(1);
 pg_typeof
-----------
 integer
(1 row)

> select pg_typeof(true);
 pg_typeof
-----------
 boolean
(1 row)
```

If you try it on an arbitrary string, it is unable to disambiguate which
string type (e.g. `text` vs `varchar`).

```sql
> select pg_typeof('hello');
 pg_typeof
-----------
 unknown
(1 row)
```

You just have to be a bit more specific.

```sql
> select pg_typeof('hello'::varchar);
     pg_typeof
-------------------
 character varying
(1 row)
```

[source](http://www.postgresql.org/docs/9.3/static/functions-info.html#FUNCTIONS-INFO-CATALOG-TABLE)
