# Creating Indexes With Ecto

Using indexes in the right places within relational databases is a great way
to speed up queries.

To add a basic index in an Ecto migration, use `Ecto.Migration.index\2`:

```elixir
create index(:users, [:email])
```

Creating a composite index doesn't require jumping through any hoops; just
put the relevant column names in the list:

```elixir
create index(:posts, [:user_id, :title])
```

See `h Ecto.Migration.index` for more details.
