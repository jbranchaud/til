# Label Dollar-Quoted Strings With A Tag

In [Escaping String Literals with Dollar
Quoting](escaping-string-literals-with-dollar-quoting.md), I showed how
PostgreSQL supports escaped string literals so that you don't have to put
backslashes everywhere. This is done by opening and closing the string with
`$$`.

What if your string literal is going to contain a sequence of two `$` symbols?
Or a better hypothetical, what if you want to convey some information about
what the string represents?

For either of these, the _tagged_ dollar-quoting is a great fit.

```sql
> select $JSON${"name": "Sally's Bistro", "price": "$$$"}$JSON$::jsonb;
                   jsonb
--------------------------------------------
 {"name": "Sally's Bistro", "price": "$$$"}
(1 row)

> select $JSON${"name": "Sally's Bistro", "price": "$$$"}$JSON$::jsonb->'name' as name;
       name
------------------
 "Sally's Bistro"
(1 row)
```

The tagged dollar-quoting allows me to write a string that can be cast to
`jsonb` without having to think about which characters need to be escaped. In
the second example, I'm able to interact with it like any `jsonb` entity.

Here, our tag is `JSON`. It helps convey that the string literal represents
JSON. A tag "follows the same rules as an unquoted identifier, except that it
cannot contain a dollar sign." The tag goes between the dollar signs and is
case-sensitive.

[source](https://www.postgresql.org/docs/current/sql-syntax-lexical.html#SQL-SYNTAX-DOLLAR-QUOTING)
