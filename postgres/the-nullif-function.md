# The nullif Function

PostgreSQL, in addition to generalized case statements, includes the
[`nullif`](https://www.postgresql.org/docs/current/functions-conditional.html)
function. The docs describe it as a way "to perform the inversation operation
of a `coalesce`".

Rather than resolving to some fallback value if the primary value is `null`
(like `coalesce` does), it will resolve to `null` if the given values are the
same.

```sql
> select nullif(0, 0);
 nullif
--------
      ø
(1 row)
```

If the values are not equal, then the first value is the result of the
function.

```sql
> select nullif(1, 0);
 nullif
--------
      1
(1 row)
```

One way this can be used is in conjunction with the `coalesce` function. For
instance, if I have a table of values that are either 0 or a positive number, I
can coerce all the zeros to be `1` like so.

```sql
> select coalesce(nullif(0, 0), 1);
 coalesce
----------
        1
(1 row)
```

h/t [Ian Jones](https://twitter.com/_jonesian)
