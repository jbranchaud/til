# Check Specific Attributes On ActiveRecord Array

If you're writing a test against a method that returns a collection of
ActiveRecord results, it can be tedious to check specific values for each.
There are certainly an endless number of ways to approach those assertions.

You can keep your assertion fairly concise by using nested RSpec matchers.
There are two in particular that can help with this kind of check:

```ruby
books = get_books_by("David Sedaris")

expect(books).to match_array(
  [
    have_attributes(
      "title" => "Calypso",
      "publication_year" => "2018",
    ),
    have_attributes(
      "title" => "Theft By Finding",
      "publication_year" => "2017",
    ),
  ],
)
```

The outer part of the assertion is `match_array` which checks that the result
is an array of a certain size with specific elements. On its own we'd have to
spell out all the attributes of each book, including things like `created_at`
and `updated_at`. However, by combining it with `have_attributes` matchers, we
are able to make the assertion over a subset of each record's attributes.
