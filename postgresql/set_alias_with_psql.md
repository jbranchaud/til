# Set alias with psql

When you type too often the same command in `psql` you can create shortcuts like

```
\set eav 'EXPLAIN ANALYZE VERBOSE'
```

Then you can use it like

```
:eav SELECT COUNT(*) FROM pg_tables;
```
