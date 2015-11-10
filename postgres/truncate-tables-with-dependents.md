# Truncate Tables With Dependents

In [Truncate All Rows](truncate-all-rows.md), I talked about how
postgres's `truncate` can be used to quickly delete all rows in a table. In
practice this alone won't be very useful though, because tables usually have
other tables that depend on them via foreign keys. If you have tables `A`
and `B` where `B` has a foreign key referencing `A`, then trying to truncate
`A` will result in something like this:

```sql
> truncate A;
ERROR:  cannot truncate a table referenced in a foreign key constraint
```

Fortunately, `truncate` has some tricks up its sleeve.

If you know two tables are tied together via a foreign key constraint, you
can just truncate both of them at once:

```sql
> truncate A, B;
TRUNCATE TABLE;
```

If many tables are tied together in this way and you are looking to throw
all of it out, then a simpler approach is to cascade the truncation:

```sql
> truncate A cascade;
NOTICE:  truncate cascades to table "B"
TRUNCATE TABLE
```

Use these with care and potentially within transactions because your data
will go bye bye.

h/t Dillon Hafer and Jack Christensen
