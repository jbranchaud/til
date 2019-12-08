# Get An Array Of Values From The Database

We generally get data from our database through [ActiveRecord
models](https://api.rubyonrails.org/classes/ActiveRecord/Base.html):

```ruby
> Product.where(available: true).pluck(:sku)
[ "efg-1234", "pqr-3455", ... ]
```

If we need to do a more specialized query, we might reach for
[`execute`](https://api.rubyonrails.org/classes/ActiveRecord/ConnectionAdapters/DatabaseStatements.html#method-i-execute):

```ruby
> ActiveRecord::Base.connection.execute(<<-SQL)
    select split_part(sku, '-', 1) product_type
      from products
      where available = true;
  SQL
[{ "product_type" => "efg" }, { "product_type" => "pqr" }, ... ]
```

The results are bundled up in a predictable, but verbose array of hashes.

We could trim the result down to just the values using either
[`select_values`](https://api.rubyonrails.org/classes/ActiveRecord/ConnectionAdapters/DatabaseStatements.html#method-i-select_values)
or
[`select_rows`](https://api.rubyonrails.org/classes/ActiveRecord/ConnectionAdapters/DatabaseStatements.html#method-i-select_rows):

```ruby
> ActiveRecord::Base.connection.select_values(<<-SQL)
    select split_part(sku, '-', 1) product_type
      from products
      where available = true;
  SQL
[ "efg", "pqr", ... ]
```

If the SQL statement is to return more than one row in the result, then you'll
want `select_rows` instead of `select_values`.
