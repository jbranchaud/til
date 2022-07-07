# Make Remove Column Migration Reversible

The Rails migration DSL includes a
[`#remove_column`](https://edgeapi.rubyonrails.org/classes/ActiveRecord/ConnectionAdapters/SchemaStatements.html#method-i-remove_column)
method for removing a column from a table.

The two required values are the table name and the column name.

```ruby
class RemoveNotesColumnFromTodo < ActiveRecord::Migration[5.2]
  def change
    remove_column :todos, :notes
  end
end
```

This on it's own is not reversible though. If you were to run a `db:rollback`
with this migration, Rails wouldn't know what type to use when re-adding the
column.

To make it reversible, you need to add in the column type as a third argument.

```ruby
    remove_column :todos, :notes, :string
```

Note: perhaps more importantly, this column isn't reversible in the sense that
when you remove the column, you are throwing away all the data associated with
that column. Be sure you're ready to part with this data before deploying a
migration like this.

[source](https://stackoverflow.com/questions/24520550/how-do-you-make-remove-column-reversible)
