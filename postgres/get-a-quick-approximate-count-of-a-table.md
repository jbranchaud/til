# Get A Quick Approximate Count Of A Table

Really large PostgreSQL tables can be slow to work with. Even a count of the
rows in a really large table can take a while to tabulate. I'm talking about
tables on the order of hundreds of millions of rows.

For instance, here is a query grabbing the count of a ~400 million row table.

```sql
> select count(*) from events;

   count
-----------
 427462316
(1 row)

Time: 55113.794 ms
```

If I'm willing to wait nearly a minute (55 seconds), I can get an accurate
count of the rows in this `events` table.

If I don't want to wait and an approximate count will do, there are faster
ways. One way is to query the `pg_class` table.

```
> select reltuples::numeric as count
  from pg_class
  where relname='events';

   count
-----------
 427462000
(1 row)

Time: 0.413 ms
```

The resulting count is within hundreds of the actual value and tells me what I
need to know. And instead of 55 seconds, it takes less than half a millisecond.

[source](https://andyatkinson.com/postgresql-tips)
