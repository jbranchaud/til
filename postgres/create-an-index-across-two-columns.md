# Create An Index Across Two Columns

Most commonly when we create an index, it is targeted at a single column of a
table. Sometimes an expensive query that works with two different columns would
be better off with an index that combines those two columns. This is called a
_composite index_.

Let's consider this query:

```sql
select * from events
  where user_id = 123
  order by created_at desc
  limit 1;
```

Though this query will use the index on `created_at` to do an Index Scan, it
will still have to do a bunch of expensive filtering of `user_id` values after
the fact.

What this query needs to be efficient is a _composite index_ on `user_id` and
`created_at`. We can create one like so:

```sql
create index events_user_id_created_at_idx
  on events (user_id, created_at);
```

Instead of doing a bunch of post-index filtering on `user_id` values, that
expensive query will factor `user_id` into its Index Scan and complete much
quicker.

See [the Postgres docs on multicolumn
indexes](https://www.postgresql.org/docs/current/indexes-multicolumn.html) for
more details.
