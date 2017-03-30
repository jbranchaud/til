# Remove The Default Value On A Column

You have a column on one of your database tables with a default value. You'd
like to remove the default value. Removing the default is the same as
setting it to `nil`. You can do this with the ActiveRecord DSL using the
`change_column_default` method.

```ruby
def change
  change_column_default :users, :age, nil
end
```

See [the
docs](http://api.rubyonrails.org/classes/ActiveRecord/ConnectionAdapters/SchemaStatements.html#method-i-change_column_default)
for more details.
