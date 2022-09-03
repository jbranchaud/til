# Remove A Database Column From A Table

The `ActiveRecord` migration DSL includes a method
[`remove_column`](https://api.rubyonrails.org/v7.0.3.1/classes/ActiveRecord/ConnectionAdapters/SchemaStatements.html#method-i-remove_column)
that can be used to remove an existing column from a table.

It can be used like so, to remove the `sign_in_count` column from the `users`
table.

```ruby
def change
  remove_column :users, :sign_in_count
end
```

Though that will work fine, you'll run into an `IrreversibleMigration` error if
you try to `rails db:rollback`. It usually a good bet to make migrations
reversible when it is easy to do so.

All we need in order to make this migration reversible is to add the column
type.

```ruby
def change
  remove_column :users, :sign_in_count, :integer
end
```

Now you can rollback (or [migrate up-down-up](migrating-up-down-up.md)) no
problem.

Keep in mind that only the structural changes are reversible. When you remove
the column, all of the data goes with it, and that cannot be undone with a
simple rollback.
