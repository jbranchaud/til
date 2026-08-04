# Manage Lightweight Schema Migrations With `user_version`

The [`user_version` pragma](https://sqlite.org/pragma.html#pragma_user_version)
in SQLite is a bit of persistent state built into the header of a SQLite
database file.

> The user_version pragma will get or set the value of the user-version integer
> at offset 60 in the database header. The user-version is an integer that is
> available to applications to use however they want. SQLite makes no use of the
> user-version itself.

One use case for `user_version` is as a schema version indicator. It starts at
`0` which can mean nothing has been migrated yet.

```sql
sqlite> pragma user_version;
0
```

Then for each individual migration that my application applies, I can increment
the value of `user_version`. At any point in the application lifecycle, it knows
up to what point schema migrations have been run. If the number of migrations is
greater than the value of `user_version`, then migrations need to be applied.

Here is some Python code (from
[`py-vmt`](https://github.com/jbranchaud/py-vmt/blob/e426b3fda92f59c116494a4a4ed992965bac1dba/src/py_vmt/db.py))
that uses this pattern:

```python
from sqlite3 import Connection

MIGRATIONS = [
  # ...
]


# Using the `user_version` pragma in SQLite, this checks if there are any
# sets of statements in `MIGRATIONS` that have not been run yet. It then
# executes those and updates `user_version`.
def migrate(conn: Connection):
    version = conn.execute("pragma user_version").fetchone()[0]
    for i, statement in enumerate(MIGRATIONS[version:], start=version):
        conn.executescript(statement)
        conn.execute(f"pragma user_version = {i + 1}")
    conn.commit()
```

Notice that `user_version` can be updated directly with an assignment:

```sql
sqlite> pragma user_version = 3;
sqlite> pragma user_version;
3
```

A `select` statement can also be used to access the `user_version` value like
so:

```sql
sqlite> select * from pragma_user_version;
3
```
