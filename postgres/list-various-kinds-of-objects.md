# List Various Kinds Of Objects

Our PostgreSQL database can end up with all kinds of objects: tables,
sequences, views, etc. We can use a variety of `psql` meta-commands to list
the different types of (user-created) objects in our database.

- `\dt` will list all the tables
- `\dE` will list all the foreign tables
- `\di` will list all the indexes
- `\ds` will list all the sequences
- `\dv` will list all the views
- `\dm` will list all the materialized views

These can also be combined. For instance, to see all the tables and
sequences, we can run `\dts`.
