# Connect To A Database By Color

All of your PostgreSQL databases in Heroku are given attachment names that use
a random color. This might be _pink_, _brown_, _cobalt_, etc. And the
attachment names then look like `HEROKU_POSTGRESQL_PINK`,
`HEROKU_POSTGRESQL_BROWN`, `HEROKU_POSTGRESQL_COBALT`, etc.

We can connect to a Heroku-managed PostgreSQL instance from the command-line
like so:

```bash
$ heroku pg:psql --app my-app
```

This is going to connect to the _default_ database which is the one with the
`DATABASE_URL` attachment.

There are lots of instances where we may have other databases besides the
primary (e.g. let's say we have a read replica follower). If we want to connect
to that one, we can do so by _color_.

If that database's attachment is `HEROKU_POSTGRESQL_IVORY`, then we'd connect
to it like so:

```bash
$ heroku pg:psql ivory --app my-app
```

[source](https://devcenter.heroku.com/articles/managing-heroku-postgres-using-cli#pg-psql)
