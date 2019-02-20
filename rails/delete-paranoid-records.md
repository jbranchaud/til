# Delete Paranoid Records

The [ActsAsParanoid gem](https://github.com/ActsAsParanoid/acts_as_paranoid)
provides soft delete functionality to `ActiveRecord` objects in Rails. You
can enhance a model with its functionality like so:

```ruby
class User < ActiveRecord::Base
  acts_as_paranoid
end
```

This gem hijacks `ActiveRecord`'s standard `destroy` and `destroy!`
functionality. If you call either of these methods, instead of the record
being deleted from the database, it's `deleted_at` column is updated from
`nil` to the current timestamp. Resulting in a _soft deleted_ record.

If you call `destroy` or `destroy!` a second time (i.e. on a record that has
already been soft deleted), it will be actually deleted from the database.
Alternatively, you can call `destroy_fully!` from the beginning to skip the
soft delete.
