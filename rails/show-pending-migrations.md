# Show Pending Migrations

Rails comes with a built-in rake task that allows you to check the status
of migrations in the project.

```bash
$ rake db:migrate:status

database: pokemon_development

 Status   Migration ID    Migration Name
--------------------------------------------------
   up     20150219143706  Create pokemon table
  down    20150228003340  Create stats table
```

For large projects with lots of migrations, this is going to be a lot of
output, so you can trim it down with a simple `grep`:

```bash
$ rake db:migrate:status | grep '^  down'
  down    20150228003340  Create stats table
```

[source](https://github.com/rails/rails/blob/master/activerecord/lib/active_record/railties/databases.rake#L91)
