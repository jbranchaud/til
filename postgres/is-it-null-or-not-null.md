# Is It Null Or Not Null?

In PostgreSQL, the standard way to check if something is `NULL` is like so:

```sql
select * as wild_pokemons from pokemons where trainer_id is null;
```

To check if something is not null, you just add `not`:

```sql
select * as captured_pokemons from pokemons where trainer_id is not null;
```

PostgreSQL also comes with `ISNULL` and `NOTNULL` which are non-standard
ways of doing the same as above:


```sql
select * as wild_pokemons from pokemons where trainer_id isnull;
```

```sql
select * as captured_pokemons from pokemons where trainer_id notnull;
```
