# Run Statements In A Transaction

I'm connecting to a production MySQL database to make some changes to a
specific user account. That means I am going to run an `update` statement and I
expect that statement to affect exactly *one* row in the `users` table.

If I run the `update` statement in a transaction, then I can verify all looks
good before committing those changes. And importantly, I can rollback the
changes if anything looks off.

```sql
> start transaction;

> update users set roles = 'admin' where id = '1234';
Query ok, 1 row affected

> select * from users where id = '1234';
-- check that all looks good

> commit;
```

In the above case, all looked good, so I ran `commit`. If more rows than I
expected were affected or the changed record didn't look right, I could instead
`rollback`. None of those changes would make it into live production data.

[source](https://dev.mysql.com/doc/refman/8.0/en/commit.html)
