# Show Tables That Match A Pattern

An unfamiliar database with tons of tables can be a difficult thing to
navigate. You may have an idea of the kind of table you are looking for
based on a domain concept you've seen elsewhere.

You can pare down the results returned by `show tables` by including a
`like` clause with a pattern. For example, this statement will show me only
tables that have the word `user` in them:

```sql
> show tables like '%user%';
+-------------------------------+
| Tables_in_jbranchaud (%user%) |
+-------------------------------+
| admin_users                   |
| users                         |
+-------------------------------+
```
