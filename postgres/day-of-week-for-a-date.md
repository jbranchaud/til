# Day Of Week For A Date

Given a `date` in PostgreSQL

```sql
> select '2050-1-1'::date;
    date
------------
 2050-01-01
```

you can determine the day of the week for that date with the `date_part()`
function

```sql
> select date_part('dow', '2050-1-1'::date);
 date_part
-----------
         6
```

The days of week are `0` through `6`, `0` being Sunday and `6` being
Saturday.

[source](http://www.postgresql.org/docs/current/static/functions-datetime.html)
