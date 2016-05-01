# Perform SQL Explain With ActiveRecord

Want to check out the performance characteristics of some SQL query from
within a Pry session? `ActiveRecord` allows you to perform a SQL `explain`
on any `ActiveRecord::Relation` object. After chaining some Arel functions
together, add an `#explain`.

Here is an example:

```ruby
Recipe.all.joins(:ingredient_amounts).explain
  Recipe Load (0.9ms)  SELECT "recipes".* FROM "recipes" INNER JOIN "ingredient_amounts" ON "ingredient_amounts"."recipe_id" = "recipes"."id"
=> EXPLAIN for: SELECT "recipes".* FROM "recipes" INNER JOIN "ingredient_amounts" ON "ingredient_amounts"."recipe_id" = "recipes"."id"
                                 QUERY PLAN
----------------------------------------------------------------------------
 Hash Join  (cost=1.09..26.43 rows=22 width=148)
   Hash Cond: (ingredient_amounts.recipe_id = recipes.id)
   ->  Seq Scan on ingredient_amounts  (cost=0.00..21.00 rows=1100 width=4)
   ->  Hash  (cost=1.04..1.04 rows=4 width=148)
         ->  Seq Scan on recipes  (cost=0.00..1.04 rows=4 width=148)
(5 rows)
```

[source](https://robots.thoughtbot.com/why-postgres-wont-always-use-an-index)
