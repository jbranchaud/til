# Using Expressions In Indexes

Though we usually see column names by themselves when defining an index, it
is also possible to create an index with an expression.

Let's say I have a `users` table with an `email` column. Then I may end up
creating an index like this

```sql
create index email_idx on users (email);
```

If I always perform queries on the `email` column with the `lower()`
function, like this

```sql
select * from users where lower(email) = lower('some@email.com');
```

then I will want to also create an index with that full expression --
`lower(email)`

I can do this with a statement like the following

```sql
create index lower_email_idx on users (lower(email));
```

Without an index that uses the full `lower(email)` expression, `select`
statements like the one above will be forced to do full sequential scans
instead of indexed scans.
