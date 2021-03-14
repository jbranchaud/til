# Add timestamptz Columns With The Migration DSL

The Rails migration DSL comes with the
[`t.timestamps`](https://edgeapi.rubyonrails.org/classes/ActiveRecord/ConnectionAdapters/TableDefinition.html#method-i-timestamps)
method. This allows you to add the `created_at` and `updated_at` timestamp
columns that are standard for most models in Rails apps.

```ruby
create_table :posts do |t|
  t.string :title, null: false
  # ...

  t.timestamps
end
```

With a PostgreSQL database, this will result in a `posts` table that has
`created_at` and `updated_at` columns that are of type `timestamp(6) without
time zone`.

I'd prefer to use timestamp columns that include a time zone offset. PostgreSQL
supports this with its [`timestamptz` (`timestamp with time
zone`)](https://www.postgresql.org/docs/current/datatype-datetime.html) data
type.

We can tell the Rails DSL to generate this type of column by abondoning the
`t.timestamps` method and instead creating custom columns with
[`t.column`](https://edgeapi.rubyonrails.org/classes/ActiveRecord/ConnectionAdapters/TableDefinition.html#method-i-column).

```ruby
create_table :posts do |t|
  t.string :title, null: false
  # ...

  t.column :created_at, :timestamptz, null: false
  t.column :updated_at, :timestamptz, null: false
end
```

It is a little less convenient than the `t.timestamps` helper, but it is nice
to know we can have a little more control over the data type.
