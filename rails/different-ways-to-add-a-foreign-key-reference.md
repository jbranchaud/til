# Different Ways To Add A Foreign Key Reference

A foreign key reference creates a relationship between two tables that is
guaranteed by a foreign key constraint.

This is a minimal example.

```ruby
create_table :books
  t.references :author, foreign_key: true
end
```

The `foreign_key: true` is needed here, otherwise just the reference column is
created without a backing constraint. When `foreign_key` is true, an index will
be created for the column as well.

This is a maximal example.

```ruby
create_table :books
  t.references :author, index: true, foreign_key: true, type: :uuid, null: false
end
```

It is explicit about the foreign key and index. It specifies a `not null`
constraint. It declares the type as `uuid` assuming the `authors` table's
primary key is of type `uuid`.

Here is an example with a custom column name.

```ruby
create_table :books
  t.references :written_by, foreign_key: { to_table: :authors }
end
```

Here is adding a reference to an existing table.

```ruby
def up
  add_reference :books, :author, index: true, foreign_key: true
end
```

There are more combinations of these, but I hope there is enough here to be
able to iterate to a solution that works for you.
