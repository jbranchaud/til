# Create A Table From The Structure Of Another

There are a couple ways to create a new table from the structure of another table.

One of those ways is with the [`create table as`
syntax](https://www.postgresql.org/docs/current/sql-createtableas.html).

```sql
create table dupe_table as table existing_table with no data;
```

I wouldn't recommend this approach though because it only reproduces the
columns and datatypes. The modifiers, indexes, and constraints are not
included.

The [`create table`
syntax](https://www.postgresql.org/docs/current/sql-createtable.html), on the
other hand, gives you more options and flexibility for this kind of task.

```sql
create table dupe_table (like existing_table);
```

This works just like the first statement, reproducing just the columns and
datatypes.

There are options for enhancing this statement. We can tell it to additionally
_include_ things like `defaults`, `indexes`, `constraints`, or even just
_everything_ (`including all`).

Here is what it looks like to copy the `existing_table` so that things like
`not null`, B-Tree indexes, and primary key `default` values are reproduced
along with the columns and datatypes.

```sql
create table dupe_table (
  like existing_table
    including defaults
    including indexes
    including constraints
)
```

[source](https://www.reddit.com/r/PostgreSQL/comments/uu8xcs/comment/i9e36m2/)
