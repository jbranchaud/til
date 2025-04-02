# Create A Filename With The Current Date

I was recently working on a script to pull a scrubbed database dump using the
`pg_dump` Postgres utility. Ultimately, the script does something like this to
dump a remote database to a local file:

```bash
pg_dump \
  -h host.region.rds.amazonaws.com \
  -U db_username \
  -d db_name \
  -F c \
  -f scrubbed-database-$(date +%Y-%m-%d).dump
```

Notice the last part of that command where we define the name of the dump file.
It has a `$(...)` that is used to run and interpolate a command as part of the
filename.

Here is that `date` command run on its own:

```bash
$ date +%Y-%m-%d
2025-04-02
```

In the above command, that would mean if I were to run it today, I'd get
`scrubbed-database-2025-04-02.dump`.

This approach can be used with any command where you are producing a file that
you want to be dated or timestamped.

Here is another example that incorporates the time as well:

```bash
$ touch $(date +%Y%m%d_%H%M%S)-migration.sql
# => 20250402_092442-migration.sql
```
