# Creating Conditional Constraints

There are times when it doesn't make sense for a constraint to apply to all
records in a table. For instance, if we have a table of pokemon, we may only
want to apply a unique index constraint to the names of non-wild pokemon.
This can be achieved with the following conditional constraint:

```sql
create unique index pokemons_names on pokemons (names)
where wild = false;
```

If we try to insert a non-wild pokemon with a duplicate name, we will get an
error. Likewise, if we try to update a pokemon with a duplicate name from
wild to non-wild, we will get an error.

[source](http://www.postgresguide.com/performance/conditional.html)
