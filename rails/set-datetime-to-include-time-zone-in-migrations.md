# Set Datetime To Include Time Zone In Migrations

When using Rails and PostgreSQL, your migrations will contain DSL syntax like
`t.datetime` and `t.timestamps` which will produce columns using the
`timestamp` (`without time zone`) Postgres data type.

While reading [A Simple Explanation of Postgres' <code>Timestamp with Time
Zone</code>](https://naildrivin5.com/blog/2024/10/10/a-simple-explanation-of-postgres-timestamp-with-time-zone.html),
I learned that there is a way to configure your app to instead use
`timestamptz` by default. This data type is widely recommended as a good
default, so it is nice that we can configure Rails to use it.

First, add these lines to a new initializer (`config/initializers/postgres.rb`)
file.

```ruby
require "active_record/connection_adapters/postgresql_adapter"
ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.datetime_type = :timestamptz
```

Alternatively, you can configure this via `config/application.rb` per the
[Configuring ActiveRecord
docs](https://guides.rubyonrails.org/configuring.html#activerecord-connectionadapters-postgresqladapter-datetime-type).

Then, if you have a new migration like the following:

```ruby
class AddEventsTable < ActiveRecord::Migration[7.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.timestamps
    end
  end
end
```

you can expect to have four `timestamptz` columns, namely `start_time`,
`end_time`, `created_at`, and `updated_at`.

Here is the [Rails PR](https://github.com/rails/rails/pull/41084) that adds
this config option.
