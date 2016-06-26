# Execute Raw SQL In An Ecto Migration

If you are performing a database migration with
[Ecto](https://hexdocs.pm/ecto/Ecto.html), perhaps the most straightforward
approach is to use Ecto's DSL. However, the DSL may not always be the best
choice. Being able to write raw SQL gives you more control. It will also
enable you to use database features that may not be directly or easily
available through the DSL.

Raw SQL can be included in a Ecto migration with a combination of Elixir's
heredoc syntax and the [`Ecto.Migration#execute/1`
function](https://hexdocs.pm/ecto/Ecto.Migration.html#execute/1). You'll
also need to provide both an `up` and `down` function to ensure that your
migrations are reversible.

```elixir
defmodule MyApp.Repo.Migrations.CreatePostsTable do
  use Ecto.Migration

  def up do
    execute """
      create table posts (
        id serial primary key,
        title varchar not null,
        body varchar not null default '',
        inserted_at timestamptz not null default now(),
        updated_at timestamptz not null default now()
      );
    """
  end

  def down do
    execute "drop table posts;"
  end
end
```
