# Build A Hash Of Model Attributes

Have you ever found yourself creating an `ActiveRecord` object with
[FactoryBot](https://github.com/thoughtbot/factory_bot) with the sole purpose
of turning it into a hash of attributes?

```ruby
> FactoryBot.build(:book).attributes
{ "id"=>nil, "title"=>"Fledgling", "genre"=>"fiction" }
```

FactoryBot has a built-in method for doing this:

```ruby
> FactoryBot.attributes_for(:book)
{ title: "Fledgling", genre: "fiction" }
```

It also accepts any traits for that factory:

```ruby
> FactoryBot.attributes_for(:book, :published)
{
  title: "Fledgling",
  genre: "fiction",
  publication_year: 2005,
  page_count: 362
}
```

This is a handy way of build a base set of attributes when testing an API
endpoint.

[source](https://devhints.io/factory_bot)
