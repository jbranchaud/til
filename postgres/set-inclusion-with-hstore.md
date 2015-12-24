# Set Inclusion With hstore

In PostgreSQL, `hstore` records can be compared via set inclusion. The `@>`
and `<@` operators can be used for this. The `@>` operator checks if the
right operand is a subset of the left operand. The `<@` operator checks if
the left operand is a subset of the right operand.

```sql
> select '"one"=>"1", "two"=>"2", "three"=>"3"'::hstore @> '"two"=>"2"'::hstore;
 ?column?
 ----------
  t

> select '"one"=>"1", "two"=>"2", "three"=>"3"'::hstore <@ '"two"=>"2"'::hstore;
 ?column?
----------
 f
```

See the [`hstore` PostgreSQL
docs](http://www.postgresql.org/docs/current/static/hstore.html) for more
details.
