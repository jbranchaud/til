# Drizzle Tracks Migrations In A Log Table

When I generate (`npx drizzle-kit generate`) and apply (`npx drizzle-kit
migrate`) schema migrations against my database with Drizzle, there are SQL
files that get created and run.

How does Drizzle know which SQL files have been run and which haven't?

Like many SQL schema migration tools, it uses a table in the database to record
this metadata. Drizzle defaults to calling this table `__drizzle_migrations`
and puts it in the `drizzle` schema (which is like a database namespace).

Let's take a look at this table for a project with two migrations:

```sql
postgres> \d drizzle.__drizzle_migrations
                                  Table "drizzle.__drizzle_migrations"
   Column   |  Type   | Collation | Nullable |                         Default
------------+---------+-----------+----------+----------------------------------------------------------
 id         | integer |           | not null | nextval('drizzle.__drizzle_migrations_id_seq'::regclass)
 hash       | text    |           | not null |
 created_at | bigint  |           |          |
Indexes:
    "__drizzle_migrations_pkey" PRIMARY KEY, btree (id)

postgres> select * from drizzle.__drizzle_migrations;
 id |                               hash                               |  created_at
----+------------------------------------------------------------------+---------------
  1 | 8961353bf66f9b3fe1a715f6ea9d9ef2bc65697bb8a5c2569df939a61e72a318 | 1730219291288
  2 | b75e61451e2ce37d831608b1bc9231bf3af09e0ab54bf169be117de9d4ff6805 | 1730224013018
(2 rows)
```

Notice that Drizzle stores each migration record as [a SHA256 hash of the
migration
file](https://github.com/drizzle-team/drizzle-orm/blob/526996bd2ea20d5b1a0d65e743b47e23329d441c/drizzle-orm/src/migrator.ts#L52)
and a timestamp of when the migration was run.

[source](https://orm.drizzle.team/docs/drizzle-kit-migrate#applied-migrations-log-in-the-database)
