# Lower Is Faster Than ilike

There are a couple ways to do a case-insensitive comparison of data in
PostgreSQL. One way is to use the `ilike` operator for comparison. Another
way is to use the `lower()` function on both sides of the `=` operator for
comparison. Using `lower()` is a bit faster than using `ilike`.

When comparing

```sql
select * from users where email ilike 'some-email@example.com';
```

to

```sql
select * from users where lower(email) = lower('some-email@example.com');
```

we find (via `explain analyze`) that using `lower()` was taking around 12ms
where as the `ilike` example was taking around 17ms.

We earn orders of magnitude in performance when adding a functional index
that uses the `lower()` function like so:

```sql
create unique index users_unique_lower_email_idx on users (lower(email));
```

After adding this index, the example using `lower()` drops to around 0.08ms.

For the full example and `explain analyze` outputs, [see this
document](https://github.com/jbranchaud/postgresing/blob/master/ilike_vs_lower.sql).
