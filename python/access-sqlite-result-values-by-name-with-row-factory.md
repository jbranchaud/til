# Access SQLite Result Values By Name With Row Factory

The default shape of a result from executing a row-returning statement with
`sqlite3` is a tuple. Whose values can be accessed positionally.

```python
>>> res = conn.execute("select * from projects;")
>>> res.fetchone()
(1, 'py-vmt', '2026-07-25 14:53:44', '2026-07-25 14:53:44')
```

If I want something a bit nicer, I can enable [_Row Factory_
results](https://docs.python.org/3/library/sqlite3.html#how-to-create-and-use-row-factories)
for my connection. The values on a _row_ can be accessed by name as well as
positionally.

```python
>>> conn.row_factory = sqlite3.Row
>>> res = conn.execute("select * from projects;")
>>> res.fetchone()
<sqlite3.Row object at 0x1019e3c40>
>>> r1 = _
>>> r1
<sqlite3.Row object at 0x1019e3c40>
>>> r1["name"]
'py-vmt'
>>> r1["id"]
1
>>> r1[1]
'py-vmt'
```

[I used Row Factory on a project
recently](https://github.com/jbranchaud/py-vmt/pull/9/changes) and I think it
made for an improvement in the readability of the code.
