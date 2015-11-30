# Adding Composite Uniqueness Constraints

There are two ways in Postgres to create a composite uniqueness constraint;
that is, a constraint that ensures that the combination of two or more
values on a table only appear once. For the following two code snippets,
assume that we have a table relating Pokemon and Trainers and that our
domain restricts each Trainer to only having at most one of each Pokemon.

The first approach is to create a `constraint` directly on the table:

```sql
alter table pokemons_trainers
  add constraint pokemons_trainers_pokemon_id_trainer_id_key
  unique (pokemon_id, trainer_id);
```

The second approach is to create a unique index:

```sql
create unique index pokemons_trainers_pokemon_id_trainer_id_idx
  on pokemons_trainers (pokemon_id, trainer_id);
```
