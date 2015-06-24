# List All Columns Of A Specific Type

We can access information about all the columns in our database through the
`information_schema` tables; in particular, the `columns` table. After
connecting to a particular database, we can list all columns (across all our
tables) of a specific type. We just need to know the schema of the tables we
are interested in and the type that we want to track down.

My application's tables are under the `public` schema and I want to track
down all `timestamp` columns. My query can look something like this

```sql
> select table_name, column_name, data_type from information_schema.columns where table_schema = 'public' and data_type = 'timestamp without time zone';
   table_name    | column_name |          data_type
-----------------+-------------+-----------------------------
 articles        | created_at  | timestamp without time zone
 articles        | updated_at  | timestamp without time zone
 users           | created_at  | timestamp without time zone
 users           | updated_at  | timestamp without time zone
(4 rows)
```

Alternatively, I could look for both `timestamp` and `timestamptz` with a
query like this

```sql
> select table_name, column_name, data_type from information_schema.columns where table_schema = 'public' and data_type like '%timestamp%';
```
