# Insert Just The Defaults

If you are constructing an `INSERT` statement for a table whose required
columns all have default values, you may just want to use the defaults. In
this situation, you can break away from the standard:

```
> insert into table_name (column1, column2) values (value1, value2);
```

Instead, simply tell Postgres that you want it to use the default values:

```
> insert into table_name default values;
```
