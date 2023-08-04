# Different Ways To Define An Interval

There are several different ways in PostgreSQL to define an `interval` data
type. An `interval` is useful because it can represent a discrete chunk of
time. This is handy for doing date math.

Here are four different ways to define an `interval`:

1. Use the `interval` keyword with a string

```sql
> select interval '3 days';
 interval
----------
 3 days
(1 row)
```

2. Cast a string to the `interval` type

```sql
> select '3 days'::interval;
 interval
----------
 3 days
(1 row)
```

3. The `@` operator is a finicky syntax for declaring an interval

```sql
> select @ 3 days;
 days
------
    3
(1 row)
```

4. The [`make_interval`
   function](https://www.postgresql.org/docs/current/functions-datetime.html)
   can take various forms of arguments to construct an interval

```sql
> select make_interval(days => 3);
 make_interval
---------------
 3 days
(1 row)
```

[source](https://www.postgresql.org/docs/current/datatype-datetime.html#DATATYPE-INTERVAL-INPUT)
