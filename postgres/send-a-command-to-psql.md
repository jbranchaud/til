# Send A Command To psql

You can send a command to `psql` to be executed by using the `-c` flag

```bash
$ psql -c "select 'Hello, World!';"
   ?column?
---------------
 Hello, World!
(1 row)
```

Specify a particular database as needed

```bash
$ psql blog_prod -c 'select count(*) from posts;'
 count 
-------
     8 
(1 row)
```

h/t Jack Christensen
