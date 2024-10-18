# Postgres Does Not Support Unsigned Integers

PostgreSQL has a variety of sizes of integer types, from `smallint` (2 bytes)
to `integer` (4 bytes) to `bigint` (8 bytes), as well as [other numeric
types](https://www.postgresql.org/docs/current/datatype-numeric.html).

It does _not_ however support unsigned versions of these numeric types.

That means, with an `integer` for instance, we can store numbers between
`-2147483648` and `+2147483647`. That's everything that can fit into 4 bytes.
In a system that supported 4 byte unsigned integers we'd be able to represent
from `0` all the way up to `4294967295`.

In PostgreSQL, we're limited to these _signed_ numeric types.

That means if we were hoping that the data type could essentially enforce a
non-negative restriction on the data in one of our columns, we're going to have
to be more creative. The obvious choice to me is to consider adding a [check
constraint](https://www.postgresql.org/docs/current/ddl-constraints.html#DDL-CONSTRAINTS-CHECK-CONSTRAINTS)
(e.g. `quantity integer check (quantity > 0)`).

Another option, as pointed out by [this StackOverflow
answer](https://stackoverflow.com/a/31833279/535590), is to create [a
user-defined _domain
type_](https://www.postgresql.org/docs/current/domains.html) that restricts
valid values. To me, the ergonomics of using a domain type are a bit awkward
and not worth the effort.

With either of these solutions, we are only approximating an unsigned integer
and do not actually have the same range of values available.
