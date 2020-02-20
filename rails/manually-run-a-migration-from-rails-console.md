# Manually Run A Migrations From Rails Console

A migration can be manually run from the rails console. In 99% of cases you are
going to be better off using the migration CLI that Rails provides (e.g. `rails
db:migrate`, `rails db:rollback`, etc.).

If you are in a hyper-specific scenario where you need to run the `up` or the
`down` of a migration without the migration-table check, then you'll want to
consider this approach.

First, connect to the rails console: `rails c`. Then require your migration
file.

```ruby
> require "./db/migration/20200220181733_some_migration.rb"
#=> true
```

You'll now have access to the `SomeMigration` constant. Create an instance of this and then run either the `up`-side of the migration:

```ruby
> SomeMigration.new.up
#=> ... # a bunch of migration output
```

or the `down`-side of it:

```ruby
> SomeMigration.new.down
#=> ... # a bunch of migration output
```

[source](https://stackoverflow.com/a/754316/535590)
