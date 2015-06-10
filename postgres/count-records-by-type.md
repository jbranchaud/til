# Count Records By Type

If you have a table with some sort of type column on it, you can come up
with a count of the records in that table by type. You just need to take
advantage of `group by`:

```sql
> select type, count(*) from pokemon group by type;

  type   | count 
-----------------
 fire    |    10
 water   |     4
 plant   |     7
 psychic |     3
 rock    |    12
```
