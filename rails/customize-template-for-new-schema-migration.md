# Customize Template For New Schema Migration

Rails has a set of generator functionality that we can use to scaffold entire
slices of an app all the way down to generating a single migration file.

```bash
$ rails generate migration MakeUserStatusColumnNotNull
```

When we run a migration generator command like that, Rails reaches for the
[baked-in migration
template](https://github.com/rails/rails/blob/92be9af152f721588b7414119c931ea92930947b/activerecord/lib/rails/generators/active_record/migration/templates/migration.rb.tt)
and creates a new migration file based on the given name and any other local
variables that get set internally.

That's the standard behavior. However, we can override the migration template
by defining our own template in `lib/templates/migration.rb.tt` of our Rails
app. We'll need to follow the basic structure, but then we can alter it to our
needs.

For instance, I typically like to use the `#up` and `#down` methods and write
raw SQL for my migrations. To help with that this template provides a good
starting point.

```ruby
class <%= migration_class_name %> < ActiveRecord::Migration[<%= ActiveRecord::Migration.current_version %>]
  def up
    execute <<~SQL
    SQL
  end

  def down
    execute <<~SQL
    SQL
  end
end
```

We can see in
[`migration_generator.rb`](https://github.com/rails/rails/blob/92be9af152f721588b7414119c931ea92930947b/activerecord/lib/rails/generators/active_record/migration/migration_generator.rb#L26-L43)
how locals get set and what template gets chosen.
