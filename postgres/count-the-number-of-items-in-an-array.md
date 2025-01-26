# Count The Number Of Items In An Array

There are two ways to count the number of items in an array with PostgreSQL.
The one that might jump out at you or show up at the top of search results is
[`array_length`](https://www.postgresql.org/docs/current/functions-array.html).

```sql
> select array_length(array[1,2,3], 1);
+--------------+
| array_length |
|--------------|
| 3            |
+--------------+

> select array_length(array[[1,2], [3,4]], 2);
+--------------+
| array_length |
|--------------|
| 2            |
+--------------+
```

This requires specifying the dimension at which you want to check the length.
The first example, checking the 1st dimension of a one-dimensional array, seems
like the more common and useful scenario. In the second example, we are
checking the 2nd dimension.

The other way we can determine the number of items in an array is with the
[`cardinality`](https://www.postgresql.org/docs/current/functions-array.html)
function.

> Returns the total number of elements in the array, or 0 if the array is
> empty.

```sql
> select cardinality(array[1,2,3]);
+-------------+
| cardinality |
|-------------|
| 3           |
+-------------+

> select cardinality(array[[1,2], [3,4]]);
+-------------+
| cardinality |
|-------------|
| 4           |
+-------------+
```

This behaves the same as `array_length` for a one-dimensional array and doesn't
require a second argument. Where it gets more interesting is with
multi-dimensional arrays. It returns the total number of elements in the
arrayregardless of the nesting.

[source](https://mattrighetti.com/2025/01/20/you-dont-need-sql-builders)
