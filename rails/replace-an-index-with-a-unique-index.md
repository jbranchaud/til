# Replace An Index With A Unique Index

Indexes and uniqueness constraints often go together. In fact, in Postgres,
when you create a unique constraint, an index is created under the hood to
support that constraint.

What if you already have an index, but you want to turn it into a unique index?
There is no way to alter or update the index to be unique. Instead, what you'll
want to do is drop the index and then recreate it as a unique index.

Here's how you can do that with the Rails migration DSL:

```ruby
class ReplaceIndexWithUniqueIndex < ActiveRecord::Migration[5.2]
  disable_ddl_transaction!

  def up
    remove_index :users_roles, [:user_id, :role_id]
    add_index :users_roles, [:user_id, :role_id], unique: true, algorithm: :concurrently
  end

  def down
    remove_index :users_roles, [:user_id, :role_id]
    add_index :users_roles, [:user_id, :role_id], algorithm: :concurrently
  end
end
```

This removes the original multi-column index and then adds back in a unique
index that covers the same columns. I added `disable_ddl_transactions!` so that
the new index could be added concurrently.

I've also included a `down` migration that reverses the process in case a
rollback is needed.
