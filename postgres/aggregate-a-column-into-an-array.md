# Aggregate A Column Into An Array

PostgreSQL's `array_agg` function can be used to aggregate a column into an
array. Consider the following column:

```sql
> select num from generate_series(1,5) as num;
 num
-----
   1
   2
   3
   4
   5
```

By wrapping the `array_agg` aggregate function around `num` we are able to
*aggregate* the values in that column into an array, like so:

```sql
> select array_agg(num) from generate_series(1,5) as num;
  array_agg
-------------
 {1,2,3,4,5}
```

See the docs on [aggregate
functions](http://www.postgresql.org/docs/current/static/functions-aggregate.html)
for more details.
