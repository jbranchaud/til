# Write Reversible Migration To Set Default

You can use the `change_column_default` method to alter the default value of a
column. If the column doesn't have a default, then you'd essentially be
changing the default from `nil` to _some value_.

```ruby
def up
  change_column_default :books, :published, false
end

def down
  change_column_default :books, :published, nil
end
```

This is fine, but you can write the migration as a single, reversible `change`
method using the `:from` and `:to` options.

```ruby
def change
  change_column_default :books, :published, from: nil, to: false
end
```

When you migrate, the default will be set to `false`. When you rollback, the
default will be removed.

[source](https://blog.arkency.com/how-to-add-a-default-value-to-an-existing-column-in-a-rails-migration/)
