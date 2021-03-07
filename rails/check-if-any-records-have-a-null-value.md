# Check If Any Records Have A Null Value

I like to add missing `not null` constraints where appropriate when they are
missing. The [`change_column_null`
method](change-the-nullability-of-a-column.md) is the Rails DSL way of doing
this.

But first, you need to be sure that all databases this will be running against
don't have any `null` values already present for any records. If there are
`null` values present, then the migration will fail.

One way of doing that check is with some SQL and the
[`select_values`](https://api.rubyonrails.org/v6.1.0/classes/ActiveRecord/ConnectionAdapters/DatabaseStatements.html#method-i-select_values)
method.

```ruby
ActiveRecord::Base
  .connection
  .select_values("select id from projects where user_id is null")
  .any?
```

This bit of SQL asks for the `id`s of any records in the `projects` table where
a specific column (`user_id`) is explicitly `null`.

If this returns `false`, then you are good to migrate. If this returns `true`,
then you'll have to do some data massaging first.
