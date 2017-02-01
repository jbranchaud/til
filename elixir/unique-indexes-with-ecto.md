# Unique Indexes With Ecto

You can create a unique index in a migration for one or more columns using
the
[`unique_index/3`](https://hexdocs.pm/ecto/Ecto.Migration.html#unique_index/3)
function.

For example, if you are creating a join table for `followers` and want to
ensure that duplicate _follower_ entries are prevented, you may want to
include a unique index like so:

```elixir
create table(:followers) do
  add :followed_user, references(:users), null: false
  add :following_user, references(:users), null: false
end

create unique_index(:followers, [:followed_user, :following_user])
```

Keep in mind that `unique_index/3` is a shorthand for
[`index/3`](https://hexdocs.pm/ecto/Ecto.Migration.html#index/3) when you
set `unique: true`.
