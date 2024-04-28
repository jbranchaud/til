# Include Columns In A Covering Index

A _covering index_ is a special type of B-Tree index that, in addition to
indexing on a certain field, also _includes_ one or more columns as extra data
in the leaves of the tree. When created correctly, this can speed up the
queries it targets by achieving an _index-only scan_.

Let's say we have a frequently run query on a large `events` table that looks
like this:

```sql
select user_id, identifier, type
  from events
  where user_id = $1;
```

Here is what it looks like to create an index for this query with the `include`
keyword:

```sql
create index user_id_on_events_idx
  on (user_id)
  include (identifier, type);
```

An index on its own can already cause a significant speed up to the queries it
targets, but may still need to retrieve some `select` attributes from the
table. For hot-path queries with a set of specific columns always included in
the select, there can be significant additional speed ups by having the index
_cover_ those columns.

For more details, check out [A Close Look At The Index Include
Clause](https://use-the-index-luke.com/blog/2019-04/include-columns-in-btree-indexes).
