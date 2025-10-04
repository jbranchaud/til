# Scope Records To A Lower Or Upper Bound

Typically when we use
[`#where`](https://api.rubyonrails.org/classes/ActiveRecord/QueryMethods.html#method-i-where)
to scope queries against ActiveRecord models, we are looking to do a direct
"equals" comparison.

Such as `auth_codes.user_id = 1` in the example below.

```ruby
> AuthCode.where(user_id: 1)
  AuthCode Load (0.4ms)  SELECT "auth_codes".* FROM "auth_codes" WHERE "auth_codes"."user_id" = 1 /* loading for pp */ LIMIT 11
```

We can do more powerful things with `#where` (assuming your database supports
it, in my case PostgreSQL), such as comparing over ranges of dates. Ruby's
range syntax gives us an elegant way to express ranges.

```ruby
> 2..10 # range with lower bound of 2 and upper bound of 10

> 2.. # 'end'less range

> ..10 # 'begin'less range
```

These latter two examples are ranges that are unbounded on one side or the
other. We can use these in ActiveRecord `#where` queries to do "greater than or
equal to" and "less than or equal to" conditionals.

And we can do the same with ranges of dates like in the following queries.


```ruby
> AuthCode.where(created_at: 10.days.ago..).count
  AuthCode Count (97.1ms)  SELECT COUNT(*) FROM "auth_codes" WHERE "auth_codes"."created_at" >= '2025-09-24 00:35:46.937715'

> AuthCode.where(created_at: 10.days.ago..5.days.ago).count
  AuthCode Count (0.6ms)  SELECT COUNT(*) FROM "auth_codes" WHERE "auth_codes"."created_at" BETWEEN '2025-09-24 00:35:59.901441' AND '2025-09-29 00:35:59.901512'

> AuthCode.where(created_at: ..5.days.ago).count
  AuthCode Count (0.3ms)  SELECT COUNT(*) FROM "auth_codes" WHERE "auth_codes"."created_at" <= '2025-09-29 00:36:09.731444'
```

Notice in the generated SQL how the simple `#where` method gets transformed
into a `>=`, a `<=`, or a `between` clause.

And while dates are a powerful example of this, there is nothing to stop us
from querying against other kinds of ranges like numeric ones.

```ruby
# Orders under $10
ten_dollars_in_cents = 10 * 100
Order.where.not(fulfilled_at: nil).where(amount: ..ten_dollars_in_cents)
```
