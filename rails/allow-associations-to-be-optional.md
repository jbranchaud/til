# Allow Associations To Be Optional

As of Rails 5, whenever a `belongs_to` association is declared in an
`ActiveRecord` model, it is assumed to be a required association.

```ruby
class Book < ApplicationRecord
  belongs_to :author
end
```

If we were to create a `Book` instance without an `Author`, then we would get
an error – `Validation Failed: Author is missing`.

We could either make sure to always create books with authors or, if it makes
sense for our data model, we could treat the author as optional.

The most explicit and precise way to make a relation optional is to declare it
as such in the `belongs_to` directive.

```ruby
class Book < ApplicationRecord
  belongs_to :author, optional: true
end
```

Another approach, though I don't recommend it unless you have a strong reason,
is to globally make associations optional. You can do this by adding the
following line to your `config/application.rb` file.

```ruby
config.active_record.belongs_to_required_by_default = false
```

[source](https://www.bigbinary.com/blog/rails-5-makes-belong-to-association-required-by-default)
