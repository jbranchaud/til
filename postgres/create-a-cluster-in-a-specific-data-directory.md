# Create A Cluster In A Specific Data Directory

Let's say I want to create a PostgreSQL cluster near my app. So, I create a
`postgres/data` directory next to my app. Then I run the `initdb` command
pointing at that directory and specifying the UTF-8 locale.

Here is what that looks like:

```bash
$ /usr/local/opt/postgresql@13/bin/initdb -D postgres/data --locale=en_US.UTF-8

The files belonging to this database system will be owned by user "jbranchaud".
This user must also own the server process.

The database cluster will be initialized with locale "en_US.UTF-8".
The default database encoding has accordingly been set to "UTF8".
The default text search configuration will be set to "english".

Data page checksums are disabled.

fixing permissions on existing directory postgres/data ... ok
creating subdirectories ... ok
selecting dynamic shared memory implementation ... posix
selecting default max_connections ... 100
selecting default shared_buffers ... 128MB
selecting default time zone ... America/Chicago
creating configuration files ... ok
running bootstrap script ... ok
performing post-bootstrap initialization ... ok
syncing data to disk ... ok

initdb: warning: enabling "trust" authentication for local connections
You can change this by editing pg_hba.conf or using the option -A, or
--auth-local and --auth-host, the next time you run initdb.

Success. You can now start the database server using:

    '/usr/local/opt/postgresql@13/bin/pg_ctl' -D postgres/data -l logfile start
```

As stated at the end of the command's output, I can run the `postgres` server
with that data directory with:

```bash
$ '/usr/local/opt/postgresql@13/bin/pg_ctl' -D postgres/data -l logfile start
```
