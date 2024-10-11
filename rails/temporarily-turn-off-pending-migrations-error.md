# Temporarily Turn Off Pending Migrations Error

Whenever I'm working on an end-to-end feature in a Rails app, soon or later I
am going to see the _Pending Migrations_ error page. I try to visit one of the
routes in the browser and the Rails app serves this error page instead of my
actual request response.

This is typically what I want. If there are migrations just sitting there that
haven't been run yet, that's probably an issue. Maybe I just pulled down the
latest changes from my teammates. The app isn't going to work properly without
whatever schema changes are prescribed in those pending migrations.

The thing to do is run those migrations.

In some special cases though, I know what I'm doing and I would like to operate
my app locally with specific migrations not yet applied.

To skip the error, I can change this `config/environments/development.rb`
setting from:

```ruby
config.active_record.migration_error = :page_load
```

to:

```ruby
config.active_record.migration_error = false
```

I just need to make sure to switch it back when I'm done.

[source](https://til.hashrocket.com/posts/ujcixh5rwi-rails-ignore-pending-migrations)
