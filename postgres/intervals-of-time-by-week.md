# Intervals Of Time By Week

It is pretty common to use hours or days when creating a Postgres
interval. However, intervals can also be created in week-sized chunks

```sql
> select '2 weeks'::interval;
 interval
----------
 14 days
(1 row)

> select make_interval(0,0,7,0,0,0,0);
 make_interval
---------------
 49 days
(1 row)
```
