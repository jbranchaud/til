# Add A Database Index If It Does Not Already Exist

Sometimes you aren't sure if an index might already exist in one of the
environments where a migration is going to run. But you still need to add the
index elsewhere. One way of handling that is to add an index with the
`if_not_exists` directive.

```ruby
class AddIndexToEventsCreatedAt < ActiveRecord::Migration[6.1]
  def change
    add_index :events, :created_at, if_not_exists: true
  end
end
```

`ActiveRecord` will translate this directive into the resulting SQL statement
like so:

```sql
create index if not exists index_events_on_created_at on events ... ;
```

This way the index will be created in a database where it doesn't already exist
and otherwise the statement will short-circuit rather than erroring when one
does exist.

A couple notes:

1) From the PostgreSQL manual:

> there is no guarantee that the existing index is anything like the one that
> would have been created.

2) The `if_not_exists` option also works with `create_table`.

[source](https://edgeapi.rubyonrails.org/classes/ActiveRecord/ConnectionAdapters/SchemaStatements.html)
