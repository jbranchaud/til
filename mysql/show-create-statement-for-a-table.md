# Show Create Statement For A Table

In MySQL, you can get a quick rundown of a table using `describe users`. An
alternative to this approach is to have MySQL show the `create` statement
for a table.

```sql
> show create table users\G
*************************** 1. row ***************************
       Table: users
Create Table: CREATE TABLE `users` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(80) NOT NULL,
  `last_name` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL,
  `middle_initial` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
```

This includes some additional information like primary key and index
information. It is also a great way to study the SQL that it takes to create
all the facets of a table.

See the [`show create table`
docs](https://dev.mysql.com/doc/refman/5.7/en/show-create-table.html) for
more details.

h/t Jake Worth
