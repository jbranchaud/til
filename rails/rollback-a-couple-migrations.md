# Rollback A Couple Migrations

Let's say we need to rollback a couple Rails migrations that have been applied
to our local environment. We run `rails db:migrate:status` and see that there
are _2_ migrations that we want to _undo_.

We can accomplish this by using the `STEP` env var with the rollback command.

```bash
$ rails db:rollback STEP=2
```

Just set `STEP` to the number of migrations that we need to rollback. If we
then rerun `rails db:migrate:status` we'll now see those latest two migrations
are `down`.

Note: by default Rails doesn't like to operate with pending migrations. If we
want to temporarily disable the pending migration check, we can alter the
migration error config in `config/development.rb`.

```diff
  # Raise an error on page load if there are pending migrations.
-  # config.active_record.migration_error = :page_load
+  config.active_record.migration_error = false
```
