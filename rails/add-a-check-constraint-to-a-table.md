# Add A Check Constraint To A Table

PostgreSQL allows you to enforce all kinds of rules about the value of a column
or the relationship between two columns. These rules are defined with [_check
constraints_](https://www.postgresql.org/docs/current/ddl-constraints.html#DDL-CONSTRAINTS-CHECK-CONSTRAINTS).
ActiveRecord's migration DSL does not provide a way for adding check
constraints directly. They can be added by executing a SQL statement in a
migration.

```ruby
class EnsurePageCountIsPositive < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      alter table books
        add constraint ensure_page_count_is_positive
        check (page_count > 0);
    SQL
  end

  def down
    execute <<-SQL
      alter table books
        drop constraint ensure_page_count_is_positive;
    SQL
  end
```

This check constraint ensures that, anytime you add or update a row in the book
column, the value of `page_count` column is always greater than `0`. This is a
nice thing to enforce because it wouldn't make much sense for a book to have,
say, `-10` pages.

Note: these constraints will not appear in your `db/schema.rb` file. If you
want to see what check constraints have been defined across your tables, you
can crack open `psql` to investigate.
