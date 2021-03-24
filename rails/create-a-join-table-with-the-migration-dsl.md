# Create A Join Table With The Migration DSL

The Rails migration DSL comes with a helper for creating a join table between
two other existing tables.

Call `create_join_table` with two arguments, symbols for the names of the two
tables.

```ruby
def change
  create_join_table :tags, :posts
end
```

This will create a table with id references columns to each of the tables. The
`db/schema.rb` addition will look something like this:

```ruby
  create_table "posts_tags", id: false, force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "post_id", null: false
  end
```

A Rails/ActiveRecord convention that comes into play for the creation of this
table.

1. The name should be the pluralized versions of the two joined table names.
2. The joined table names should show up in the table name in alphabetical
   order.

Notice that despite listing `:tags` before `:posts` it creates a table called
`posts_tags`. The DSL handles that for us.

Some `create_join_table` defaults to be aware of:

- It doesn't generate foreign key constraints.
- It uses `bigint` (or `int`) for the keys (even if those tables use UUIDs).
- The references are named after their respective table names.
