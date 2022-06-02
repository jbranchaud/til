# Show The Hidden Queries Behind Backslash Commands

The `ECHO_HIDDEN` variable in PostgreSQL's `psql` determines whether the
queries behind backslash commands are displayed. It defaults to `false`. So,
generally, when you run something like `\d` or `\l+`, you'll just see the
result and not the query that helped produce it.

If you're curious what's behind any of these backslash commands, then set
`ECHO_HIDDEN` to `true` to get a look.

```sql
> \set ECHO_HIDDEN true
> \d
********* QUERY **********
SELECT n.nspname as "Schema",
  c.relname as "Name",
  CASE c.relkind WHEN 'r' THEN 'table' WHEN 'v' THEN 'view' WHEN 'm' THEN 'materialized view' WHEN 'i' THEN 'index' WHEN 'S' THEN 'sequence' WHEN 's' THEN 'special' WHEN 'f' THEN 'foreign table' WHEN 'p' THEN 'partitioned table' WHEN 'I' THEN 'partitioned index' END as "Type",
  pg_catalog.pg_get_userbyid(c.relowner) as "Owner"
FROM pg_catalog.pg_class c
     LEFT JOIN pg_catalog.pg_namespace n ON n.oid = c.relnamespace
WHERE c.relkind IN ('r','p','v','m','S','f','')
      AND n.nspname <> 'pg_catalog'
      AND n.nspname <> 'information_schema'
      AND n.nspname !~ '^pg_toast'
  AND pg_catalog.pg_table_is_visible(c.oid)
ORDER BY 1,2;
**************************

               List of relations
 Schema |     Name     |   Type   |   Owner
--------+--------------+----------+------------
 public | users        | table    | jbranchaud
 public | users_id_seq | sequence | jbranchaud
```

That query is what `psql` uses to list the relations for your current database.
