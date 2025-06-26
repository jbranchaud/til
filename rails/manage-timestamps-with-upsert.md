# Manage Timestamps With Upsert

Modern versions of Rails and ActiveRecord have [an `upsert`
method](https://api.rubyonrails.org/v8.0.2/classes/ActiveRecord/Relation.html#method-i-upsert)
which will, if available, use your database's upsert capability to either
insert a new row or update an existing row based on the unique identifier.

The docs have the following disclaimer:

> It does not instantiate any models nor does it trigger Active Record
> callbacks or validations. Though passed values go through Active Record’s
> type casting and serialization.

It's a bit different to work with than other ActiveRecord methods. It left me
wondering if it would handle timestamp management or if I would have to do that
myself.

Let's upsert a new record into `books`:

```ruby
> Book.upsert({title: "Shogun", author: "James Clavell", added_by_id: 1, publication_date: Date.today}, unique_by: :id)
=> #<ActiveRecord::Result:0x00000001141c3df0 ...

> Book.select(:id, :title, :created_at, :updated_at).last
=> #<Book:0x0000000113bae898 id: 12, title: "Shogun", created_at: "2025-06-26 14:08:26.035633000 +0000", updated_at: "2025-06-26 14:08:26.035633000 +0000">
```

Notice that the `created_at` and `updated_at` timestamps get set.

Now, let's upsert the record (notice we're passing in the `id`) to update the title with an `ō`.

```ruby
> Book.upsert({id: 12, title: "Shōgun", author: "James Clavell", added_by_id: 1, publication_date: Date.today}, unique_by: :id)
=> #<ActiveRecord::Result:0x0000000113cace98 ...

> Book.select(:id, :title, :created_at, :updated_at).last
=> #<Book:0x00000001143aadd0 id: 12, title: "Shōgun", created_at: "2025-06-26 14:08:26.035633000 +0000", updated_at: "2025-06-26 14:10:46.280480000 +0000">
```

Notice that the `updated_at` gets set to a time about 2 minutes later.

Lastly let's look at the `record_timestamps` option. This is `nil` by default
which means the underlying methods default kicks in which _is_ to record the
timestamps. We can override that behavior by passing in `false`.

```ruby
> Book.upsert({id: 12, title: "Shōgun, Part 2", author: "James Clavell", added_by_id: 1, publication_date: Date.today}, unique_by: :id, record_timestamps: false)
=> #<ActiveRecord::Result:0x0000000113989428 ...

> Book.select(:id, :title, :created_at, :updated_at).last
=> #<Book:0x0000000114fe1b80 id: 12, title: "Shōgun, Part 2", created_at: "2025-06-26 14:08:26.035633000 +0000", updated_at: "2025-06-26 14:10:46.280480000 +0000">
```

Notice that the `updated_at` value doesn't change between this upsert and the
previous upsert.
