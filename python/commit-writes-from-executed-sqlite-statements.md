# Commit Writes From Executed SQLite Statements

Let's look at a method that uses a
[`sqlite3`](https://docs.python.org/3/library/sqlite3.html) connection to
execute a couple statements against a SQLite database.

```python
def write_session_with_project(self, session, *, active=False) -> None:
    # Delete the current active session if there is one
    self.conn.execute("""
        delete from sessions where active = 1;
    """)

    # Upsert (find or create) the project based on `session.project_name`
    cursor = self.conn.execute(
        """
        insert into projects (name) values (:project_name)
        on conflict (name) do update set name = excluded.name
        returning id;
    """,
        {"project_name": session.project_name},
    )
    project_id = cursor.fetchone()[0]

    # ...

    self.conn.commit()
```

The first `conn.execute` call is going to implicitly start a database
transaction before executing the statement. Subsequent statements are going to
take place within that transaction. To apply all the changes in the transaction
I have to eventually run `conn.commit()`. If there isn't an issue committing all
the changes and nothing else raised before I committed, then those changes will
all be applied atomically.

I will need to do my own exception handling with a try/catch that handles any
rollback.

I'd rather not have to manage those extra pieces which is the kind of thing
context managers typically help with. Let's improve upon this with the
[Connection context manager](https://docs.python.org/3/library/sqlite3.html#how-to-use-the-connection-context-manager):

```python
def write_session_with_project(self, session, *, active=False) -> None:
    with self.conn:
        # Delete the current active session if there is one
        self.conn.execute("""
            delete from sessions where active = 1;
        """)

        # Upsert (find or create) the project based on `session.project_name`
        cursor = self.conn.execute(
            """
            insert into projects (name) values (:project_name)
            on conflict (name) do update set name = excluded.name
            returning id;
        """,
            {"project_name": session.project_name},
        )
        project_id = cursor.fetchone()[0]

        # ...
```

I get the same transactional behavior as before for everything in the context
manager body. However, now the `commit` is handled and if an exception occurs
the `rollback` is handled as well.

Note: the connection context manager will still re-propagate an exception that
occurred, so I may need to handle that with a try/catch somewhere.
