# Test For A Subset Of Attributes On A Model

Let's say you are using RSpec to test some code that creates or updates an
ActiveRecord object. To evaluate that the code is working, you want to check
the value of a couple different attributes. Though you could have a series of
assert statements to check each value, you may want to combine them into a
single statement.

```ruby
book = process_that_updates_book(params)

expect(book.attributes).to match(
  "title" => 'Updated title',
  "publication_year" => 2001,
  # ... you have to check *every* attribute
)
```

The `#match` matcher requires that every attribute in the hash matches. We
don't really care to check the `created_at`, `updated_at`, and other irrelevant
attributes.

Instead, we can `match` on
[`hash_including`](https://rubydoc.info/gems/rspec-mocks/RSpec%2FMocks%2FArgumentMatchers:hash_including).
Additionally, we can `symbolize_keys` on the `attributes` to make the expected
data a little cleaner.

```ruby
book = process_that_updates_book(params)

expect(book.attributes).to match(hash_including(
  title: 'Updated title',
  publication_year: 2001,
))
```

If the specified attributes match, then the expectation will pass. If at least
one of them doesn't, then it will fail. All other attributes are ignored.
