# Open Heroku Database In Postico From Terminal

I recently downloaded [Postico](https://eggerapps.at/postico/) at the
recommendation of [Dillon Hafer](https://dillonhafer.com/). I tend to use
`psql` as a PostgreSQL client for all my database querying needs. However,
Dillon highly recommended Postico for doing system admin querying.

I needed to connect directly to a production Postgres server on Heroku to
investigate slow queries. Postico presented me with a form of individual fields
for host, port, username, password, database, etc.

This would have been a little annoying to fill in manually. Dillon had a
shortcut to recommend. From the command line you can open Postico with a
connection string. It knows how to split that connection string into the
respective fields.

```bash
heroku config:get DATABASE_URL --app APP_NAME | xargs open -a Postico
```

This requests the `DATABASE_URL` from Heroku. It is a Postgres connection
string with all the fields needed to connect to a remove server. This is then
passed via `xargs` to `Postico` as it is being `open`ed.
