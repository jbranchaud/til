# Set Default As SQL Function In Migration

With static default values, like `0`, `true`, or `'pending'`, we can set them
directly as the value of `default`.

```ruby
class CreateActionsTable < ActiveRecord::Migration[7.2]
  def change
    create_table :actions do |t|
      t.string :status, default: 'pending'
    end
  end
end
```

However, if we want our default value to be a SQL function like `now()`, we
have to use a lambda.

Let's extend the above example to see what that looks like:

```ruby
class CreateActionsTable < ActiveRecord::Migration[7.2]
  def change
    create_table :actions do |t|
      t.string :status, default: 'pending'

      t.column :created_at, :timestamptz, default: -> { 'now()' }, null: false
    end
  end
end
```

If we need to alter the default of an existing table's column, we can do
something like this:

```ruby
class AddDefaultTimestampsToActions < ActiveRecord::Migration[7.2]
  def up
    change_column_default :actions, :created_at, -> { "now()" }
    change_column_default :actions, :updated_at, -> { "now()" }
  end

  def down
    change_column_default :actions, :created_at, nil
    change_column_default :actions, :updated_at, nil
  end
end
```

I believe this functionality is available to Rails 5.0 and later.

[source](https://github.com/rails/rails/issues/27077#issuecomment-261155826)
