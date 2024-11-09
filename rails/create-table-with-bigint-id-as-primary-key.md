# Create Table With bigint ID As Primary Key

When creating a new table with an ActiveRecord migration, we specify all the
fields _except_ the `id`. The `id`, which is the primary key, is implicit. We
get it by default.

The type of that `id` defaults to `int` which is a 32-bit signed integer.

We can override the type of `id` in a variety of ways. The one I prefer in most
cases is to make the `id` of type `bigint`. This is a 64-bit signed integer. It
offers quite a bit more headroom for the number of unique identifies in our
table.

This can be specified by including `id: :bigint` as an option to the
`create_table` method.

```ruby
class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts, id: :bigint do |t|
      t.string :title, null: false
      t.string :body, null: false

      t.timestamps
    end
  end
end
```

[source](https://api.rubyonrails.org/v7.1/classes/ActiveRecord/ConnectionAdapters/SchemaStatements.html#method-i-create_table)
