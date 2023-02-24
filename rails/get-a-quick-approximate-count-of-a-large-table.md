# Get A Quick Approximate Count Of A Large Table

Let's say our Rails app has a massive `events` table in it's Postgres database.
We might be tempted to reach for an ActiveRecord API method like `Event.count`
to get the number of records in the table. For tables with millions of rows,
this is going to be slow.

If all we need is an approximate count, there is a faster way that uses some of
PostgreSQL's internal bookkeeping.

We can request the approximate number of tuples recorded for our table by name.
This query can be processed as raw SQL by the `#execute` method available on
`ActiveRecord::Base.connection`.

```ruby
ActiveRecord::Base.connection.execute(<<~SQL)
  select reltuples::numeric as count
    from pg_class
  where relname='events';
SQL
```

That is going to spit out the `PG::Result` object which doesn't look like much
on its own.

```
#<PG::Result:0x00 ...>
```

If we tack on a couple other methods, we can get the count as our result.

```ruby
ActiveRecord::Base.connection.execute(<<~SQL).to_a.first["count"].to_i
  select reltuples::numeric as count
    from pg_class
  where relname='events';
SQL
```
