# Dump And Restore A Database

PostgreSQL comes with two command-line utilities for dumping and then
restoring a database -- `pg_dump` and `pg_restore`, respectively.

Using the `pg_dump` with the `-Fc` flag will create a dump of the given
database in a custom format. The output of this command can be redirected
into a file (the `.dump` extension is a standard convention):

```bash
$ pg_dump -Fc my_database > my_database.dump
```

Using the custom format option provides a couple benefits. The output is
significantly compressed in comparison to a generic SQL dump. The dump and
restoration is more flexible. Lastly, the dump can be performed in parallel
if your machine has multiple cores to work with. Likewise, the restoration
can be done in parallel with multiple jobs.

To restore the dump, create a fresh database and then use `pg_restore`:

```bash
$ createdb my_new_database
$ pg_restore -d my_new_database my_database.dump
```

Note: the dumped tables will depend on some user role. You will need to
ensure that this role exists on the database cluster where the restore is
happening. You can use the `createuser` command if necessary.

See the
[`pg_dump` docs](http://www.postgresql.org/docs/current/static/app-pgdump.html)
and [`pg_restore`
docs](http://www.postgresql.org/docs/current/static/app-pgrestore.html)
for more details.
