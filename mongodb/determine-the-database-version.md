# Determine The Database Version

Whether your Mongo database is local or remote, you should connect to it using
the [`mongo` CLI](https://docs.mongodb.com/manual/mongo/).

Once connected, you can issue the following query:

```
db.version()
```

This will output the version of your Mongo database.

[source](https://docs.mongodb.com/manual/reference/method/db.version/)
