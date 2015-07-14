# Select Value For SQL Counts

If you are like me and prefer writing raw SQL over the Arel DSL for counting
stuff in your database, then the `select_value` method will come in handy.
Write a command similar to the following with a type cast to get the count
of _whatever_.

```ruby
> sql = 'select count(*) from posts where published_at is not null'
=> "select count(*) from posts where published_at is not null"
> ActiveRecord::Base.connection.select_value(sql).to_i
   (0.6ms)  select count(*) from posts where published_at is not null
=> 42
```
