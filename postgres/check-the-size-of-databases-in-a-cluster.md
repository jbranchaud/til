# Check The Size Of Databases In A Cluster

The `\l` command in `psql` will list all the databases for the server. The
field surfaced by this meta-command are:

- Name
- Owner
- Encoding
- Locale Provider
- Collate
- Ctype
- ICU Locale
- ICU Rules
- Access privileges

If we add a `+`, issuing instead `\l+`, we get three additional fields:

- Size
- Tablespace
- Description

The _Size_ column is the human-formatted size of each database.

Another way to do this is with some SQL querying the underlying record keeping
of the server's database.

```sql
select
  db.datname as db_name,
  pg_size_pretty(pg_database_size(db.datname)) as db_size
from pg_database db
order by pg_database_size(db.datname) desc;
```

Credit to [this StackOverflow
answer](https://stackoverflow.com/a/18907188/535590) for how to do this with a
SQL query.

[source](https://www.postgresql.org/docs/current/app-psql.html#APP-PSQL-META-COMMAND-LIST)
