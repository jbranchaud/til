# Show Rails Models With Pry

With the [`pry-rails`](https://github.com/rweng/pry-rails) gem, you get some
extra goodies in the Rails console for your project. One of those goodies is
`show-models`, a command for printing out a list of all models in the rails
project. Add and bundle the `pry-rails` gem, run `rails c`, and then run
`show-models` to give it a go.

```
> show-models
Pokemon
  id: integer
  name: string
  level: integer
  pokemon_type: varchar
  belongs_to Trainer
  created_at: datetime
  updated_at: datetime
Trainer
  id: integer
  name: string
  has_many Pokemons
```
