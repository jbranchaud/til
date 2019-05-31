# Add A Foreign Key Reference To A Table

Foreign keys are a great way to maintain referential integrity within our data.
We can add reference columns with foreign key constraints using the Rails
migration DSL.

Here is how we include one as part of creating a table:

```ruby
def up
  create_table :books do |t|
    # ... other columns

    t.references :author, index: true, foreign_key: true
  end
end
```

This will add a column, `author_id`, to the `books` table that references the
`authors` table. It will have both a foreign key constraint and an index
applied to it.

Here is how we do the same for an existing table:

```ruby
def up
  add_reference :books, :author, index: true, foreign_key: true
end
```

As of Rails 5, this is a bit verbose as `index: true` happens by default.
Though I'm always in favor of explicitness. If for whatever reason you don't
want an index, you will have to specify `index: false`.
