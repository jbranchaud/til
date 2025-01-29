# Unable To Infer Data Type In Production

Inspired by [You Probably Don't Need Query
Builders](https://mattrighetti.com/2025/01/20/you-dont-need-sql-builders), I
wrote a query in one of my applications that has filter clauses that get
short-circuited if the filter value hasn't been included.

That query looked something like this:

```ruby
@tags =
  Tag.where("? is null or normalized_value ilike ?", normalized_query, "%#{normalized_query}%")
     .order(:normalized_value)
     .limit(10)
```

The `normalized_value ilike ?` filtering won't be applied if the
`normalized_query` value isn't present (`nil`). This helps me avoid writing
messy ternaries or if-else conditional query building madness.

Unfortunately, when I shipped this query to production, the page started
failing and Postgres was reporting this error in the logs.

```
Caused by: PG::IndeterminateDatatype (ERROR:  could not determine data type of parameter $1)
```

The query is prepared as a parameterized statement and Postgres appears to be
unable to determine the datatype of the first parameter (`$1`) —
`normalized_query`.

I was unable to reproduce the issue in development. It was only occuring in
production. Until I can come up with a root cause analysis, I have the
following fix that does a casting to `text`. This helps out with the type
inference and makes the issue go away.

```ruby
@tags =
  Tag.where("cast(? as text) is null or normalized_value ilike ?", normalized_query, "%#{normalized_query}%")
     .order(:normalized_value)
     .limit(10)
```

Interestingly, this person using `pgtyped` [ran into the exact same issue with
the same type of query](https://github.com/adelsz/pgtyped/issues/354).
