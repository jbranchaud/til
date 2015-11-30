# Select A Select By Selector

Generally when using Capybara to select from a `select` input, I reference it by its `name`
which rails associates with the label:

```ruby
select("Charizard", from: "Pokemon")
```

However, not all forms are going to have a label paired with every `select`
input. We don't want to let our test coverage suffer, so we are going to
need a different way to select. Fortunately, Capybara allows us to chain
`select` off a `find` like so:

```ruby
find('#pokemon_list').select('Charizard')
```
