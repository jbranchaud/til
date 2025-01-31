# Add A Generated Column To A PostgreSQL Table

As of Rails 7, ActiveRecord supports generated columns for app's backed by a
PostgreSQL database. This is achieved with a `virtual` column.

```ruby
class CreateTags < ActiveRecord::Migration[8.0]
  def change
    create_table :tags, id: :bigint do |t|
      t.string :value
      t.virtual :normalized_value, type: :text, as: "lower(value)", stored: true

      t.timestamps
    end
  end
end
```

With a table like this, any time we add a record with a `value`, PostgreSQL
computes and stores the `normalized_value` column based on that.

[source](https://blog.saeloun.com/2022/01/25/rails-7-postgres-support-for-generated-columns/)
