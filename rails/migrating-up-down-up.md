# Migrating Up Down Up

When writing Rails migrations, it is good to define, when possible, what
should happen when migrating *up* and what should happen when migrating
*down*. You'll then want to check that both the *up* and *down* work. This
can be accomplished using the following one-liner:

```bash
$ rake db:migrate && rake db:migrate:redo
```

The `rake db:migration` does what we would expect applying our new migration
and showing us that our *up* works. The `rake db:migrate:redo` first
performs a rollback, showing us that our *down* works, and then migrates
back up again. We now know that our latest migration works going both
directions.
