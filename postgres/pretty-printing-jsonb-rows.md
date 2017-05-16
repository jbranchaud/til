# Pretty Printing JSONB Rows

Who needs a document store when you can just use PostgreSQL's `JSONB` data
type? Viewing rows of `JSONB` output can be challenging though because it
defaults to printing them as a single line of text.

```sql
> select '{"what": "is this", "nested": {"items 1": "are the best", "items 2": [1, 2, 3]}}'::jsonb;
                                      jsonb
----------------------------------------------------------------------------------
 {"what": "is this", "nested": {"items 1": "are the best", "items 2": [1, 2, 3]}}
(1 row)
```

Fortunately, Postgres comes with a function for prettying up the format of
the output of these rows --
[`jsonb_pretty`](https://www.postgresql.org/docs/current/static/functions-json.html)

```sql
> select jsonb_pretty('{"what": "is this", "nested": {"items 1": "are the best", "items 2": [1, 2, 3]}}'::jsonb);
            jsonb_pretty
------------------------------------
 {                                 +
     "what": "is this",            +
     "nested": {                   +
         "items 1": "are the best",+
         "items 2": [              +
             1,                    +
             2,                    +
             3                     +
         ]                         +
     }                             +
 }
(1 row)
```

h/t Jack Christensen
