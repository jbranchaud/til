# Put Unique Constraint On Generated Column

You cannot apply a _unique constraint_ to an expression over a column, e.g.
`lower(email)`. You can, however, create a [generated
column](https://www.postgresql.org/docs/current/ddl-generated-columns.html) for
that expression and then apply the unique constraint to that generated column.

Here is what that could look like:

```sql
> create table users (
    id integer generated always as identity primary key,
    name text not null,
    email text not null,
    email_lower text generated always as (lower(email)) stored,
    unique ( email_lower )
);

> \d users
+-------------+---------+-----------------------------------------------------------------+
| Column      | Type    | Modifiers                                                       |
|-------------+---------+-----------------------------------------------------------------|
| id          | integer |  not null generated always as identity                          |
| name        | text    |  not null                                                       |
| email       | text    |  not null                                                       |
| email_lower | text    |  default lower(email) generated always as (lower(email)) stored |
+-------------+---------+-----------------------------------------------------------------+
Indexes:
    "users_pkey" PRIMARY KEY, btree (id)
    "users_email_lower_key" UNIQUE CONSTRAINT, btree (email_lower)
```

And then an demonstration of violating that constraint:

```sql

> insert into users (name, email) values ('Bob', 'bob@email.com');
INSERT 0 1

> insert into users (name, email) values ('Bobby', 'BOB@email.com');
duplicate key value violates unique constraint "users_email_lower_key"
DETAIL:  Key (email_lower)=(bob@email.com) already exists.
```

The main tradeoff here is that you are doubling the amount of storage you need
for that column. Unless it is a massive table, that is likely not an issue.
