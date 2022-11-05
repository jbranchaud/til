# Dump And Restore With A Single gzip File

The `mongodump` and `mongorestore` utilities provide a way for grabbing all the
data from one database and putting it into another database. These commands are
useful for transitioning production data to a database instance with more
computing resources.

The `--archive` and `--gzip` flags, supported by both commands, are what allow
us to do the whole process with a single file. Without flags, `mongodump` will
output multiple `.bson` files.

Here is what the `mongodump` command might look like pointed at a remote URI:

```bash
mongodump \
  --uri="mongodb+srv://<USER>:<PASSWORD>@<CLUSTER-HOST-URL>" \
  --archive="myapp-dump.20221105.gz" \
  --gzip
```

This will take a little while to run based on the size of the database. The
result will be a file in your current directory with the name
`myapp-dump.20221105.gz`. Because it is gzip'd, it will be a few times smaller
than the standing database.

To then load all the data into your new Mongo database cluster, you'll use
`mongorestore` with all the same flags, making sure to swap out the destination
URI details with those of the new instance.

```bash
mongorestore \
  --uri="mongodb+srv://<USER>:<PASSWORD>@<NEW-CLUSTER-HOST-URL>" \
  --archive="myapp-dump.20221105.gz" \
  --gzip
```

For more details, see [Output an Archive
File](https://www.mongodb.com/docs/database-tools/mongodump/#output-to-an-archive-file)
and [Compress the
Output](https://www.mongodb.com/docs/database-tools/mongodump/#compress-the-output).
