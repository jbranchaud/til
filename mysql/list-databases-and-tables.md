# List Databases And Tables

If you've started a [mysql](https://dev.mysql.com/) session, but haven't
connected to a particular database yet, you can list the available databases
like so:

```sql
> show databases;
+-----------------------------+
| Database                    |
+-----------------------------+
| information_schema          |
| my_app_dev                  |
+-----------------------------+
```

If you are curious about the tables in a particular database, you can list
them by specifying the database's name:

```sql
> show tables in my_app_dev;
+------------------------------+
| Tables_in_my_app_dev         |
+------------------------------+
| pokemons                     |
| trainers                     |
+------------------------------+
```

Alternatively, you can connect to the database of interest and then there is
no need to specify the name of the database going forward.

```sql
> use my_app_dev;
> show tables;
+------------------------------+
| Tables_in_my_app_dev         |
+------------------------------+
| pokemons                     |
| trainers                     |
+------------------------------+
```
