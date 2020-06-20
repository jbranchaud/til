# Dump A Remote Database

Here is a single-line script for dumping a remote mongo database. This will
dump it to your local filesystem in a binary format (`.bson`) that you can then
restore to another mongo instance.

Create a file like this called `mongdump-cmd` and replace the various
placeholder values (e.g. `<HOST>`) with valid values for your remote mongo
instance.

```bash
mongodump --host '<HOST>:<PORT>' \
          --ssl \
          --username '<USER>' \
          --password '<PASSWORD>' \
          --authenticationDatabase 'admin' \
          --out ./mongo-backups/<DATE>-dump
```

Create the backup directory:

```bash
$ mkdir mongo-backups
```

Then execute the bash script:

```bash
$ bash mongodump-cmd
```

This will dump everything on the remote instance into the
`mongo-backups/2020-06-20-dump/` directory. You can also include the `--db`
flag to dump a specific database.

This can later be used with `mongoresetore` to restore the data to the mongo
instance you specify.
