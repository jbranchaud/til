# Max Identifier Length Is 63 Bytes

In PostgreSQL, identifiers -- table names, column names, constraint names,
etc. -- are limited to a maximum length of 63 bytes. Identifiers longer than
63 characters can be used, but they will be truncated to the allowed length
of 63.

```sql
> alter table articles
    add constraint this_constraint_is_going_to_be_longer_than_sixty_three_characters_id_idx
    check (char_length(title) > 0);
NOTICE:  identifier "this_constraint_is_going_to_be_longer_than_sixty_three_characters_id_idx" will be truncated to "this_constraint_is_going_to_be_longer_than_sixty_three_characte"
ALTER TABLE
```

Postgres warns us of identifiers longer than 63 characters, informing us of
what they will be truncated to. It then proceeds to create the identifier.

If postgres is trying to generate an identifier for us - say, for a foreign
key constraint - and that identifier is longer than 63 characters, postgres
will truncate the identifier somewhere in the middle so as to maintain the
convention of terminating with, for example, `_fkey`.

The 63 byte limit is not arbitrary. It comes from `NAMEDATALEN - 1`. By default
`NAMEDATALEN` is 64. If need be, this value can be modified in the Postgres
source. Yay, open-source database implementations.

See [the postgres docs](http://www.postgresql.org/docs/current/static/sql-syntax-lexical.html#SQL-SYNTAX-IDENTIFIERS) for more details.
