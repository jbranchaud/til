# Prefer select_all Over execute For Read Queries

Though the `#execute` function provided by ActiveRecord technically works as a
general-purpose query runner for strings of raw SQL, it has some downsides.

First, let's say we have a large semi-complex (better in SQL than ActiveRecord
DSL) SQL query defined in a heredoc.

```ruby
books_by_status_query = <<-SQL
  select
    books.*,
    latest_statuses.status as current_status,
    array_to_json(array_agg(...)) as reading_statuses
  from books
  -- plus several left joins
  -- where clause, group by, and order by
SQL
```

I reflexively reach for
[`#execute`](https://api.rubyonrails.org/classes/ActiveRecord/ConnectionAdapters/DatabaseStatements.html#method-i-execute)
in a situation like that:

```ruby
result = ActiveRecord::Base.connection.execute(books_by_status_query)
```

However, if we're doing a read-only query and we are expecting multiple rows in
the result, then we are better off reaching for
[`#select_all`](https://api.rubyonrails.org/classes/ActiveRecord/ConnectionAdapters/DatabaseStatements.html#method-i-select_all).

```ruby
result = ActiveRecord::Base.connection.select_all(books_by_status_query)
```

It has the advantage of semantically communicating that it's just a read and
won't have any side-effects. It also avoids an unnecessary clear of the query
cache.

> Note: [when execute is used] the query is assumed to have side effects and
> the query cache will be cleared. If the query is read-only, consider using
> select_all instead.

The `#execute` method also has been known to leak memory with some database
connectors.

> Note: depending on your database connector, the result returned by this
> method may be manually memory managed. Consider using exec_query wrapper
> instead.

We can then iterate through and transform the results just as we would have
done with `#execute`.

```ruby
result.map do |row|
  row.tap do |hash|
    hash["reading_statuses"] = JSON.parse(hash["reading_statuses"])
  end

  OpenStruct.new(row)
end
```
