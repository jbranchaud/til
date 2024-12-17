# Explore The Database Schema

The first thing I like to do when connecting to a database is get a quick lay
of the land. What are the tables and what do they look like?

I can list all tables with the `.tables` dot-command.

```sql
sqlite> .tables
ingredient_amounts  ingredients         recipes
```

I can then look at the `create table` statement for specific tables to see what
their schema looks like:

```sql
sqlite> .schema recipes
CREATE TABLE recipes (
  id integer primary key,
  name varchar not null,
  description text not null,
  instructions text not null
);
```

The `.schema` dot-command can also be used without any argument and it will
display the schema for all tables of all connected databases.

Run `.help` from the `sqlite3` prompt for more dot-command options.

[source](https://www.sqlite.org/cli.html#querying_the_database_schema)
