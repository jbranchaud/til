# List Database Objects With Disk Usage

I'll often times use `\d` or `\dt` to check out the tables in my database.
This shows the schema, object name, object type (e.g. `table`), and owner
for each.

By adding the `+` to that meta-command, I can also see the disk usage for
each database object.

Here is an example of look at all tables in a database with the additional
`Size` (or disk usage) information:

```sql
> \dt+
                              List of relations
 Schema |        Name        | Type  |   Owner    |    Size    | Description
--------+--------------------+-------+------------+------------+-------------
 public | amount_types       | table | jbranchaud | 16 kB      |
 public | ingredient_amounts | table | jbranchaud | 8192 bytes |
 public | ingredient_types   | table | jbranchaud | 16 kB      |
 public | ingredients        | table | jbranchaud | 48 kB      |
 public | recipes            | table | jbranchaud | 16 kB      |
 public | schema_migrations  | table | jbranchaud | 16 kB      |
 public | users              | table | jbranchaud | 16 kB      |
```
