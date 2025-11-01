# Set Up A Project-Local Cluster With Postgres.app

I want to set up a PostgreSQL cluster in my project directory. This helps
provide some separation and clarity that this cluster and its databases are just
for this project.

This can be done with `Postgres.app` (on Mac) hitting the `+` button in the
bottom left corner of the app. This will pop open a "Create new server" modal.

From there, you'll want to give the server a name that you can identify within
`Postgres.app`. E.g. "<App Name> Cluster"

Then select the Postgres version. My existing project is still on 17, so I'll
select that.

The not so intuitive part is the _Data Directory_. Use the "Choose..." file
picker to find the root directory of your project. Select that. Then click into
the text input for the data directory and append the name of the data directory
_to be created_ to that path. If I want it to all go in `postgres-data`, then my
path will look like:

```
/Users/me/dev/my-app/postgres-data
```

The `postgres-data` directory doesn't exist yet. But it will in a moment.

You probably want the default port, so leave that at `5432` unless you know
otherwise.

Click `Create server`, though that won't actually create the server yet. Now
with that server selected in `Postgres.app` click the `Initialize` button. That
will create the `postgres-data` directory and then run `initdb` under the hood
which will add everything your server needs. It will now be running at that
port, ready to connect.
