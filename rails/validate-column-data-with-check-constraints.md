# Validate Column Data With Check Constraints

A check constraint is a feature of database systems like PostgreSQL that allows
you to enforce rules about the data that goes in a table's column. As of Rails
6.1, ActiveRecord provides a way to add a check constraint via the DSL.

In this example, we want to ensure that the value going into the
reading_statuses.status column is one of four values. Nothing else besides
these four values should be allowed.

```ruby
class AddReadingStatusTable < ActiveRecord::Migration[7.2]
  def change
    create_table :reading_statuses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.string :status, null: false
      t.timestamps
    end

    add_check_constraint
      :reading_statuses,
      "status in ('started', 'completed', 'abandoned', 'already_read')",
      name: "reading_statuses_valid_status_check"
  end
end
```

The `#add_check_constraint` method takes the name of the table and a SQL clause
that can evaluate to true or false for a given row. We can optionally include
the name of the check constraint (e.g. {table_name}_{column_name}_check) like
we've done above.
