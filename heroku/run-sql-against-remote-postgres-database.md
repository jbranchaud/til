# Run SQL Against Remote Postgres Database

You can access a remote Heroku PostgreSQL database through a `psql` session
using the following command:

```bash
heroku pg:psql --app my-app
```

That opens an interactive psql session.

If instead you'd like to run a single SQL script against that remote database,
you can redirect that script to the connection.

```bash
heroku pg:psql --app my-app < query.sql
```

The results of running that SQL will be written to stdout.

You can take this a step further by redirecting the output into another file so
that you can review and search the results at your convenience, rather than
only having them appear in your terminal.

```bash
heroku pg:psql --app my-app < query.sql > results.out
```
