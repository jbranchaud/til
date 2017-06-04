# Display Output In A Vertical Format

Output for tables with lots of columns can be hard to read and sometimes
overflow the terminal window. Consider the output from [Show Indexes For A
Table](show-indexes-for-a-table.md):

```sql
> show indexes in users;
+-------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table | Non_unique | Key_name     | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+-------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| users |          0 | PRIMARY      |            1 | id          | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
| users |          0 | unique_email |            1 | email       | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
+-------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
```

We can vertically orient the output of a statement by terminating it with
`\G` instead of `;` (or `\g`).

```sql
> show indexes in users\G
*************************** 1. row ***************************
        Table: users
   Non_unique: 0
     Key_name: PRIMARY
 Seq_in_index: 1
  Column_name: id
    Collation: A
  Cardinality: 0
     Sub_part: NULL
       Packed: NULL
         Null:
   Index_type: BTREE
      Comment:
Index_comment:
*************************** 2. row ***************************
        Table: users
   Non_unique: 0
     Key_name: unique_email
 Seq_in_index: 1
  Column_name: email
    Collation: A
  Cardinality: 0
     Sub_part: NULL
       Packed: NULL
         Null:
   Index_type: BTREE
      Comment:
Index_comment:
```
