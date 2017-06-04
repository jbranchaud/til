# Show Indexes For A Table

When describing a table, such as the table `users`:

```sql
> describe users;
+------------+-----------------------+------+-----+---------+----------------+
| Field      | Type                  | Null | Key | Default | Extra          |
+------------+-----------------------+------+-----+---------+----------------+
| id         | mediumint(8) unsigned | NO   | PRI | NULL    | auto_increment |
| first_name | varchar(80)           | NO   |     | NULL    |                |
| last_name  | varchar(80)           | NO   |     | NULL    |                |
| email      | varchar(80)           | NO   | UNI | NULL    |                |
+------------+-----------------------+------+-----+---------+----------------+
```

I can see in the `Key` column that there is a primary key and a unique key
for this table on `id` and `email`, respectively.

These keys are indexes. To get more details about each of the indexes on
this table, we can use the
[`show indexes`](https://dev.mysql.com/doc/refman/5.7/en/show-index.html)
command.

```sql
> show indexes in users;
+-------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table | Non_unique | Key_name     | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+-------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| users |          0 | PRIMARY      |            1 | id          | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
| users |          0 | unique_email |            1 | email       | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
+-------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
```
