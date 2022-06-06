# Alphabetize Schema Columns To Keep Them Consistent

When working on a Rails project with a team, there can be lots of unnecessary
churn in the `db/schema.rb` file. While there are a couple things that can
cause this churn, the main one is reordering of columns during local migration.

The [`strong_migrations` gem](https://github.com/ankane/strong_migrations)
provides [a handy rake task to apply alphabetical ordering to columns
names](https://github.com/ankane/strong_migrations#schema-sanity). This keeps
them in a consistent order which reduces churn.

Assuming you have the `strong_migrations` gem included in your app, add the
following line to the end of your `Rakefile`.

```ruby
task "db:schema:dump": "strong_migrations:alphabetize_columns"
```

This sets `strong_migrations:alphabetize_columns` as a prerequisite task to
`db:schema:dump`. Whenever `db:schema:dump` gets run, the alphabetization task
will get run first. This ensures the resulting `db/schema.rb` file always has
column names in a consistent order.

The origin of this idea is Paul Gross's blog post [Alphabetize schema.rb
Columns](https://www.pgrs.net/2008/03/12/alphabetize-schema-rb-columns/).
