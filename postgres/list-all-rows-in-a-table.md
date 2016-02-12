# List All Rows In A Table

Perhaps the more common way to list all rows in a table is with the
following `select` command:

```sql
select * from bedding_types;
```

There is an alternative approach that also selects all rows from a table.
It's essentially a shorthand -- the `table` command.

```sql
> table bedding_types;
   name
----------
 No Bed
 1 Full
 1 Double
 2 Double
 1 Twin
 2 Twins
 1 Queen
 2 Queen
 1 King
 2 Kings
 3 Kings
 Murphy
 Sofa Bed
```

h/t Jack Christensen
