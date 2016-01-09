# Sleeping

Generally you want your SQL statements to run against your database as
quickly as possible. For those times when you are doing some sort of
debugging or just want your queries to look very computationally expensive,
PostgreSQL offers the `pg_sleep` function.

To sleep for 5 seconds, try the following:

```sql
> select now(); select pg_sleep(5); select now();
              now
-------------------------------
 2016-01-08 16:30:21.251081-06
(1 row)

Time: 0.274 ms
 pg_sleep
----------

(1 row)

Time: 5001.459 ms
              now
-------------------------------
 2016-01-08 16:30:26.252953-06
(1 row)

Time: 0.260 ms
```

As you'll notice, the `pg_sleep` statement took about 5 seconds.

[source](http://www.if-not-true-then-false.com/2010/postgresql-sleep-function-pg_sleep-postgres-delay-execution/)
