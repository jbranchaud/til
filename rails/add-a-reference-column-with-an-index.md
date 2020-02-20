# Add A Reference Column With An Index

Though I prefer to always back my reference columns with a [foreign
key](add-a-foreign-key-reference-to-a-table.md), sometimes you may just want to
add the reference column on its own. Though this could be done manually with
the `add_column` directive, you can be more explicit with `add_reference` --
which allows you to specify whether or not an index is to be added.

```ruby
def up
  add_reference :books, :author, index: true
end
```

This will add `authors_id` and an index to the `books` table.

You can additionally specify the type of the column. This is handy if you are
using `uuid`s for all your primary keys.

```ruby
def up
  add_reference :books, :author, type: :uuid, index: true
end
```

[source](https://nandovieira.com/using-uuid-with-postgresql-and-activerecord)
