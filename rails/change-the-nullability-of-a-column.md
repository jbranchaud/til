# Change The Nullability Of A Column

Do you have an existing table with a column that is exactly as you want it
except that it needs to be changed to either `null: false` or `null: true`?

One option is to use ActiveRecord's `change_column_null` method in your
migration.

For example to change a nullable column to `null: false`, you'll want a
migration like the following:

```ruby
def change
  change_column_null :posts, :title, false
end
```

Note, if you have existing records with `null` values in the `title` column,
then you'll need to deal with those before migrating.

If you want to make an existing column nullable, change that `false` to
`true`:

```ruby
def change
  change_column_null :posts, :title, true
end
```
