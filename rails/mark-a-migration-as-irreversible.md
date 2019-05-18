# Mark A Migration As Irreversible

It is in your best interest to, as much as is possible, write your Rails
migrations in a way that they can be safely and reliably rolledback. You want
your `down` to mirror your `up`, in case anything goes wrong.

This isn't always possible though. There are some migrations, in particular
data migrations, that cannot be undone. Something is being changed or destroyed
in an unrecoverable way. When this is the case, you should, by convention,
raise an `IrreversibleMigration` exception.

```ruby
class DestructiveMigration < ActiveRecord::Migration[5.2]
  def up
    execute "-- some destructive SQL"
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
```

If anyone ever tries to rollback this migration, they will see the exception.
It will be a signal that some manual work is needed to continue rolling back.

See the
[docs](https://api.rubyonrails.org/classes/ActiveRecord/Migration.html#class-ActiveRecord::Migration-label-Irreversible+transformations)
for more details.
