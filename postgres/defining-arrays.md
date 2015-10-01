# Defining Arrays

In postgres, an array can be defined using the `array` syntax like so:

```sql
> select array['a','b','c'];
  array
---------
 {a,b,c}
```

If you are inserting into an existing array column, you can use the array
literal syntax.

```sql
> create temp table favorite_numbers(numbers integer[]);
CREATE TABLE
> insert into favorite_numbers values( '{7,3,9}' );
INSERT 0 1
> select numbers[2] from favorite_numbers;
 numbers
---------
       3
```

Postgres also supports two-dimensional arrays.

```sql
select array[[1,2,3],[4,5,6],[7,8,9]] telephone;
         telephone
---------------------------
 {{1,2,3},{4,5,6},{7,8,9}}
```
