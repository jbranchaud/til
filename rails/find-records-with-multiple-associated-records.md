# Find Records With Multiple Associated Records

Relational data often involves a table that has a one-to-many relationship with
another table. For instance, a team can be made up of many members. A question
we may want to ask of that data is, what are the records (`teams`) that are
associated with more than one of this other table (`members`).

With a few SQL features that are supported by ActiveRecord's query syntax, we
can answer that question.

To make it interesting, let's say we are trying to answer the question, "what
are the teams that have multiple _active_ members?"

```ruby
Team
  .joins(:members)
  .where(members: { status: 'active' })
  .having("count(*) >= 2")
  .group("teams.id")
  .count

=> {
  123 => 2,
  345 => 3,
  567 => 2,
  ...
}
```

That final `.count` is going to manifest as a `count(*)` in the `select`
clause. That `count(*)` aggregate combined with the `group("teams.id")` is
going to flatten the results to be unique by team ID. Then the `having` clause
will filter out all teams with a member count less than 2. And before that, the
where will cut down the members to only those that are `active`.

If you just want the IDs, you can tack a `#keys` call onto the end of that
query result.
