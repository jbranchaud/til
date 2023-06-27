# Ignore Duplicates When Inserting Records

While trying to run a seed script to set up some application data in a MySQL
database, I ran into several duplicate-key errors. Some of this data had
already been added in another context, but I still need some of the seeds.

```sql
insert into MerchantAccount (col1, col2, col3)
  values ('data1', 'data2', 'data3'),
         ('data4', 'data5', 'data6'),
         (...);
```

The solution was to allow MySQL to `ignore` the duplicate records and insert
the rest.

```sql
insert ignore into MerchantAccount (col1, col2, col3)
  values ('data1', 'data2', 'data3'),
         ('data4', 'data5', 'data6'),
         (...);
```

Notice all I had to do was update the statment by adding `ignore` right after
[`insert`](https://dev.mysql.com/doc/refman/8.0/en/insert.html).

> If you use the `IGNORE` modifier, ignorable errors that occur while executing
> the `INSERT` statement are ignored. For example, without `IGNORE`, a row that
> duplicates an existing `UNIQUE` index or `PRIMARY KEY` value in the table
> causes a duplicate-key error and the statement is aborted. With `IGNORE`, the
> row is discarded and no error occurs. Ignored errors generate warnings
> instead.

[source](https://dev.mysql.com/doc/refman/8.0/en/sql-mode.html#ignore-effect-on-execution)
