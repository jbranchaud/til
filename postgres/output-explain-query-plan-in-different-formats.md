# Output Explain Query Plan In Different Formats

The output of an [`explain` (or `explain analyze`) query
plan](https://www.postgresql.org/docs/current/sql-explain.html) for a given
query defaults to a `TEXT` format that is meant to be read by a person.

```sql
> explain (analyze) select title from books where created_at > now() - '1 year'::interval;
                                           QUERY PLAN
-------------------------------------------------------------------------------------------------
 Seq Scan on books  (cost=0.00..1.28 rows=5 width=32) (actual time=0.011..0.017 rows=22 loops=1)
   Filter: (created_at > (now() - '1 year'::interval))
 Planning Time: 0.052 ms
 Execution Time: 0.027 ms
(4 rows)
```

If we instead want the query plan in a standardized format that is parseable
and readable by a program, we can specify an alternate format like `JSON`,
`YAML`, or `XML`.

Here is the same plan with `format json`:

```sql
> explain (analyze, format json) select title from books where created_at > now() - '1 year'::interval;
                           QUERY PLAN
----------------------------------------------------------------
 [                                                             +
   {                                                           +
     "Plan": {                                                 +
       "Node Type": "Seq Scan",                                +
       "Parallel Aware": false,                                +
       "Async Capable": false,                                 +
       "Relation Name": "books",                               +
       "Alias": "books",                                       +
       "Startup Cost": 0.00,                                   +
       "Total Cost": 1.28,                                     +
       "Plan Rows": 5,                                         +
       "Plan Width": 32,                                       +
       "Actual Startup Time": 0.008,                           +
       "Actual Total Time": 0.014,                             +
       "Actual Rows": 22,                                      +
       "Actual Loops": 1,                                      +
       "Filter": "(created_at > (now() - '1 year'::interval))",+
       "Rows Removed by Filter": 0                             +
     },                                                        +
     "Planning Time": 0.050,                                   +
     "Triggers": [                                             +
     ],                                                        +
     "Execution Time": 0.023                                   +
   }                                                           +
 ]
(1 row)
```

I present all four formats for a complex query plan [in this
Gist](https://gist.github.com/jbranchaud/731b1a68f5cc70c4f7a9e1f5ef570836).
