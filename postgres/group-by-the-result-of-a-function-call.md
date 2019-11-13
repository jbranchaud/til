# Group By The Result Of A Function Call

Typically, a query that I write involving a `group by` will look more or less
like this:

```sql
select category, count(*)
  from products
  group by category;
```

The `category` column is the thing I'm grouping by. In this case, I'm doing a
little data exploration.

We are not strictly limited to grouping by a column. We can use all sorts of
functions offered by Postgres to get at more interesting results. [String
functions](https://www.postgresql.org/docs/current/functions-string.html) are a
great place to start.

Let's say our `products` table also has an `identifier` column with a naming
scheme where the first three letters of the identifier correspond to the
product's classification. We can group by that part of the `identifier`:

```sql
select substring(identifier from 1 for 3), count(*)
  from products
  group by substring(identifier from 1 for 3);
```

The funkiness of the `substring` syntax aside, we were able to group our
products in a new way and learn something about our data.
