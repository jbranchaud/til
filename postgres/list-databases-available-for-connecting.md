# List Databases Available For Connecting

I tend to have a couple different versions of Postgres installed on my
development machine. Each server version tends to have a different set of
databases. As I switch between projects and Postgres versions, it can be hard
to remember the name of the database to which I want to connect when using
`psql`.

I usually connect to one of the defaults, which is either named `postgres` or
named after the machine user.

There is a better way. I can first ask `psql` to list all the available
databases.

```
❯ psql --list
Timing is on.
                                               List of databases
              Name              |   Owner    | Encoding |   Collate   |    Ctype    |     Access privileges
--------------------------------+------------+----------+-------------+-------------+---------------------------
 jbranchaud                     | jbranchaud | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 postgres                       | jbranchaud | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 thirty_days_server_development | jbranchaud | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 thirty_days_server_test        | jbranchaud | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
(4 rows)
```

Then I know before connecting which one I'm looking for or if it must be in the
data directory of another Postgres server version.
