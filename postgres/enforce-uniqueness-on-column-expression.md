# Enforce Uniqueness On Column Expression

When creating a table for, say `users`, where you will store `email` addresses,
you'll likely want to enforce uniqueness on the that `email` field. And because
people have all sorts of ways of entering their emails, in terms of casing, you
may be tempted to try to enforce uniqueness on a lowercased version of `email`.

```sql
create table users (
  id integer generated always as identity primary key,
  email text not null,
  unique ( lower(email) ) -- !! this won't work
);
```

A unique _constraint_ must be on one or more columns. You cannot include an
_expression_ when defining the unique constraint.

You can however accomplish similar aims with [a _unique index_ on the
expression](https://www.postgresql.org/docs/current/indexes-expressional.html).
That is because the index is able to store the result of the expression in
itself.

```sql
create table users (
  id integer generated always as identity primary key,
  email text not null
);

create unique index unq_lower_email on users ( lower(email) );
```

This is likely what you want for this example anyway because it will probably
be a common query to look up the user by `lower(email)` and the index will
speed up those queries.
