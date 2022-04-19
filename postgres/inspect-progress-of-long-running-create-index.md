# Inspect Progress Of Long-Running Create Index

Strategically applied indexes are an important part of keeping queries against
a database fast. Initially applying those indexes—especially for large tables
in production—can take a bit of time.

The `create index` call doesn't provide any indication of progress. So if
applying an index takes minutes or even hours, it can be disconcerting.

Is it still working or is it locked up? How far along is it?

Postgres tracks the index creation process in `pg_stat_progress_create_index`
and we can query that table.

```sql
select
  now()::time(0), 
  a.query, 
  p.phase, 
  p.blocks_total, 
  p.blocks_done, 
  p.tuples_total, 
  p.tuples_done,
  ai.schemaname,
  ai.relname,
  ai.indexrelname
from pg_stat_progress_create_index p 
join pg_stat_activity a on p.pid = a.pid
left join pg_stat_all_indexes ai on ai.relid = p.relid and ai.indexrelid = p.index_relid;
```

There are a bunch of phases that Postgres goes through to create the index,
especially if it is being created `concurrently`. The `blocks_done` and
`tuples_done` numbers will keep ticking along, giving you an indication that
the process is proceeding.

[source one](https://dba.stackexchange.com/a/249784) and [source two](https://www.depesz.com/2019/04/18/waiting-for-postgresql-12-report-progress-of-create-index-operations/)
