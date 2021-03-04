# Create A Custom Named References Column

The `t.references` and `add_reference` methods both create a foreign key column
name based on the target table.

For instance,

```ruby
add_reference :guests, :user, foreign_key: true, index: true, null: false
```

would create a `user_id` column on the `guests` table.

At times, you'll need to customize the name of the foreign key column. The
Rails migration DSL supports this with the `foreign_key` option.

Here is an example that shows the syntax for both a new table and an existing
table.

```ruby
class AddInvitedByColumnToUser < ActiveRecord::Migration[6.1]
  def change
    create_table :guests, id: :uuid do |t|
      t.string :email, null: false
      t.timestamps

      t.references :invited_by,
        type: :uuid,
        index: true,
        null: false,
        foreign_key: { to_table: :users }
    end

    add_reference :guests, :signed_up_as,
      type: :uuid,
      index: true,
      null: false,
      foreign_key: { to_table: :users }
  end
end
```

The `t.references` call creates a foreign key column to the `users` table named
`invited_by`. The `add_reference` call adds a `signed_up_as` foreign key column
to `guests` that points to users.

[source](https://stackoverflow.com/a/42056089/535590)
