# Show All Versions Of An Operator

We may be familiar with PostgreSQL's containment operator (`@>`). Maybe
we've used it with an array before, so we understand the general idea. But
now we are curious about what are the other types with which this
containment operator can be used.

We can quickly find out the answer with the `\do` command in `psql`:

```sql
> \do @>
                               List of operators
   Schema   | Name | Left arg type | Right arg type | Result type | Description
------------+------+---------------+----------------+-------------+-------------
 pg_catalog | @>   | aclitem[]     | aclitem        | boolean     | contains
 pg_catalog | @>   | anyarray      | anyarray       | boolean     | contains
 pg_catalog | @>   | anyrange      | anyelement     | boolean     | contains
 pg_catalog | @>   | anyrange      | anyrange       | boolean     | contains
 pg_catalog | @>   | box           | box            | boolean     | contains
 pg_catalog | @>   | box           | point          | boolean     | contains
 pg_catalog | @>   | circle        | circle         | boolean     | contains
 pg_catalog | @>   | circle        | point          | boolean     | contains
 pg_catalog | @>   | jsonb         | jsonb          | boolean     | contains
 pg_catalog | @>   | path          | point          | boolean     | contains
 pg_catalog | @>   | polygon       | point          | boolean     | contains
 pg_catalog | @>   | polygon       | polygon        | boolean     | contains
 pg_catalog | @>   | tsquery       | tsquery        | boolean     | contains
```

The `Left arg type` and `Right arg type` columns tell us what we need to
know.

This `\do` command can be used with any operator for a similar set of
information.

h/t Bruce Momjian
