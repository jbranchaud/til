# Export Query Results To A CSV

Digging through the results of queries in Postgres's `psql` is great if you
are a programmer, but eventually someone without the skills or access may
need to check out that data. Exporting the results of a query to CSV is a
friendly way to share said results because most people will have a program
on their computer that can read a CSV file.

For example, exporting all your pokemon to `/tmp/pokemon_dump.csv` can be
accomplished with:

```sql
copy (select * from pokemons) to '/tmp/pokemon_dump.csv' csv;
```

Because we are grabbing the entire table, we can just specify the table name
instead of using a subquery:


```sql
copy pokemons to '/tmp/pokemon_dump.csv' csv;
```

Include the column names as headers to the CSV file with the `header`
keyword:

```sql
copy (select * from pokemons) to '/tmp/pokemon_dump.csv' csv header;
```

If your user has limited access, you can use the \copy command like so:

```sql
\copy (select * from pokemons) to '/tmp/pokemon_dump.csv' with csv header;
```

[source](http://stackoverflow.com/questions/1120109/export-postgres-table-to-csv-file-with-headings)
