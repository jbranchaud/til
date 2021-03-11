# Rollback A Specific Migration Out Of Order

If you want to rollback the latest migration that is `up`, you can use:

```bash
$ rails db:rollback
```

It deals explicitly with the latest `up` migration and nothing else. Even if
you name a specific `VERSION`, it will still just rollback the one latest.

Instead, if you want to target a specific past migration for rollback, you'll
want the `db:migrate:down` command. You'll need to specify the version, which
is the timestamp number in the filename of the migration.

Here is what this looks like for a recent migration I had to rollback.

```bash
$ rails db:migrate:down VERSION=20210302171858
```

[source](https://stackoverflow.com/a/3647820/535590)
