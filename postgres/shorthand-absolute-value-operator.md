# Shorthand Absolute Value Operator

Postgres offers many [math
functions](https://www.postgresql.org/docs/8.0/functions-math.html) including
`abs` for computing the absolute value of a number.

```sql
> select abs(-1);
 abs
-----
   1
(1 row)
```

There is also an absolute value _operator_ -- the `@` symbol. This can be used
to do the same thing.

```sql
> select @ -1;
 ?column?
----------
        1
(1 row)
```

[source](https://kb.objectrocket.com/postgresql/why-use-postgres-abs-function-in-sql-729)
