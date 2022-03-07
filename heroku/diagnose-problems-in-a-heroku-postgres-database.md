# Diagnose Problems In A Heroku Postgres Database

Heroku keeps track of all kinds of diagnostics on the performance of your app's
database. From long running queries and transactions to index cache hit rates
to unused indexes to tables with bloat.

Running the `pg:diagnose` command for your Heroku app will surface all of these
details in the terminal.

```bash
$ heroku pg:diagnose -a APP_NAME
```

The report will start with the biggest problem areas which it color codes in
red. If your app is experiencing degraded performance, the list of red items
would be a good place to start investigating.

The report will then list less urgent problem areas. Those will be color coded
yellow. Though Heroku has deemed these less serious, you may still want to deal
with these.

All the other areas of diagnose will fall into the _green_ bucket. Meaning
Heroku doesn't see any issues in those areas.
