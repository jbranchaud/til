# Experiment With SQLite Queries In Memory

Instead of connecting
[`sqlite3`](https://docs.python.org/3/library/sqlite3.html) to a real file
(database) like so:

```python
db_file: Path = data_dir / "sessions.db"
conn: Connection = sqlite3.connect(db_file)
```

I can point it to `":memory:"`:

```python
conn: Connection = sqlite3.connect(":memory:")
```

One way this can be useful is when experimenting with some DDL (schema-modifying
SQL statements), e.g. creating a table, adding a column, and so forth.

```python
>>> import sqlite3
>>> conn = sqlite3.connect(":memory:")
>>> conn.execute("""
... create table projects (
...     id integer primary key,
...     name text not null unique,
...     created_at text not null default (datetime('now')),
...     updated_at text not null default (datetime('now'))
... );
... """)
<sqlite3.Cursor object at 0x105d6e2c0>
>>> conn.execute("insert into projects (name) values ('TIL'), ('py-vmt'), ('Pool League Pro');")
<sqlite3.Cursor object at 0x105d6e340>
>>> result = conn.execute("select * from projects;")
>>> rows = result.fetchall()
>>> rows
[(1, 'TIL', '2026-08-01 23:59:56', '2026-08-01 23:59:56'), (2, 'py-vmt', '2026-08-01 23:59:56', '2026-08-01 23:59:56'), (3, 'Pool League Pro', '2026-08-01 23:59:56', '2026-08-01 23:59:56')]
```

This does not create any sort of on-disk version of the database. Two separate
connections created this way will be independent in-memory database instances.
This is technically more of [a SQLite feature](https://sqlite.org/inmemorydb.html) than a Python one, but it was in a
Python context that I found this most useful.
