# Load Records In Batches With find_each

The base enumerable method offered by Ruby is `#each`. If you need to interact
with an array of elements, that's a method you'll reach for at some point.

When working with an `ActiveRecord` collection in Rails, you should use the
[`#find_each`](https://api.rubyonrails.org/v6.1.0/classes/ActiveRecord/Batches.html#method-i-find_each)
method instead of `#each`. That's because under the hood it batches the records
that it will load in 1000 at a time. This is important to keep your server's
resource usage from exploding when requesting a ton of records.

Consider a `users` table that contains 10,000 records that are _active_.

```ruby
User.where(active: true).each do |user|
  # do something
end
```

With `#each`, all 10,000 records will be loaded into memory at once as
`ActiveRecord` objects. That's potentially a lot of load on the server's
available memory. Then imagine the table contains 100,000 or 1,000,000 records.
This can become a big problem.

```ruby
User.where(active: true).find_each do |user|
  # do something
end
```

With `#find_each`, which uses
[`#find_in_batches`](https://api.rubyonrails.org/v6.1.0/classes/ActiveRecord/Batches.html#method-i-find_in_batches)
under the hood, only 1000 `ActiveRecord` objects get loaded into memory at a
time.

If you want to exercise more control over the batching, you can use
`#find_in_batches` directly.
