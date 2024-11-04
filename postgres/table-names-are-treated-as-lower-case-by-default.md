# Table Names Are Treated As Lower-Case By Default

This one is a bit unintuitive and can cause some real confusion -- when you
create a table in PostgreSQL, any casing is ignored, it is treated as
lower-case. Let's see it to believe it:

```sql
> create table BookMarks (
    id integer generated always as identity primary key,
    location text not null
  );

> \d
+--------+--------------------+----------+----------+
| Schema | Name               | Type     | Owner    |
|--------+--------------------+----------+----------|
| public | bookmarks          | table    | postgres |
| public | bookmarks_id_seq   | sequence | postgres |
+--------+--------------------+----------+----------+
```

Notice that when we list our tables, the uppercase `M` and `B` are gone. That's
because Postgres folds away the casing when processing the table name
identifier.

It doesn't matter how we refer to it for queries:

```sql
> select * from BookMarks;
+----+----------+
| id | location |
|----+----------|
+----+----------+

> select * from bookmarks;
+----+----------+
| id | location |
|----+----------|
+----+----------+
```

You can force Postgres to respect the casing by wrapping the table name in
quotes.

```sql
> create table "BookMarks" (
    id integer generated always as identity primary key,
    location text not null
  );

> \d
+--------+--------------------+----------+----------+
| Schema | Name               | Type     | Owner    |
|--------+--------------------+----------+----------|
| public | BookMarks          | table    | postgres |
| public | BookMarks_id_seq   | sequence | postgres |
+--------+--------------------+----------+----------+

> select * from "BookMarks";
+----+----------+
| id | location |
|----+----------|
+----+----------+

> select * from "bookmarks";
relation "bookmarks" does not exist
LINE 1: select * from "bookmarks"
                      ^

> select * from BookMarks;
relation "bookmarks" does not exist
LINE 1: select * from BookMarks
                      ^
```

That then means you have to quote your table name anytime you want to refer to
it in a query. It's not worth it. It is better to always keep your table names
lower-case using snake case.

[source](https://weiyen.net/articles/avoid-capital-letters-in-postgres-names)
