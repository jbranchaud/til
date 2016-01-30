# Constructing A Range Of Dates

PostgreSQL offers a number of range types including the `daterange` type.
This can be constructed using the `daterange()` function with two strings
representing the lower and upper bounds of the date range respectively.

```sql
> select daterange('2015-1-1','2015-1-5');
        daterange
-------------------------
 [2015-01-01,2015-01-05)
```

The lower bound is inclusive -- indicated by the `[` character -- and the
upper bound is exclusive -- indicated by the `)` character.

[source](http://www.postgresql.org/docs/current/static/rangetypes.html)
