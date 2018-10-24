# Convert A String To A Timestamp

If you have a string that represents a point in time, there are a couple
ways that you can convert it to a PostgreSQL `timestamptz` value.

If the string is in [ISO 8601
format](https://en.wikipedia.org/wiki/ISO_8601), then it can be simply cast
to `timestamptz`.

```sql
> select '2018-10-24'::timestamptz;
      timestamptz
------------------------
 2018-10-24 00:00:00-05
```

A more general purpose approach is to use the
[`to_timestamp`](https://www.postgresql.org/docs/11/static/functions-formatting.html)
function.

```sql
> select to_timestamp('2018-10-24', 'YYYY-MM-DD');
      to_timestamp
------------------------
 2018-10-24 00:00:00-05
```

The first argument is our string-to-be-converted in whatever format. The
second argument is another string describing in what format that string is.

Note: Both of these approaches produce a `timestamptz` value.
