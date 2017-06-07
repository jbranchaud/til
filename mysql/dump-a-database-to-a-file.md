# Dump A Database To A File

The `mysqldump` client is a handy tool for creating a backup or snapshot of
a MySQL database. The standard use of this command produces an alphabetical
series of statements that comprise the structure and data of the specified
database. It directs all of this to `stdout`. You'll likely want to redirect
it to a file.

```bash
$ mysqldump my_database > my_database_backup.sql
```

The output will include special comments with MySQL directives that disable
things like constraint checking. This is what allows the output to be in
alphabetical order without necessarily violating any foreign key
constraints.

If you need to dump multiple databases, include the `--databases` flag with
a space-separated list of database names. Or dump all of them with
`--all-databases`.

See `man mysqldump` for more details.
