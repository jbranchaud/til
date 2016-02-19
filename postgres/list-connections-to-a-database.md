# List Connections To A Database

The `pg_stat_activity` table can be used to determine what connections there
currently are to the PostgreSQL server and to a particular database. To see
the process ids and usernames of all connection to your PostgreSQL server,
run the following query:

```sql
> select pid, usename from pg_stat_activity;
  pid  |  usename
-------+------------
 57174 | jbranchaud
 83420 | jbranchaud
```

Include `datname` in the requested columns to figure out the database of
each connection.

```sql
> select pid, usename, datname from pg_stat_activity;
  pid  |  usename   |  datname
-------+------------+-----------
 57174 | jbranchaud | hr_hotels
 83420 | jbranchaud | pgbyex
```

The results can be restricted to a particular database as necessary.

```sql
> select pid, usename from pg_stat_activity where datname = 'hr_hotels';
  pid  |  usename
-------+------------
 57174 | jbranchaud
```
