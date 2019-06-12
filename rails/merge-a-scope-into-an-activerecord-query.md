# Merge A Scope Into An ActiveRecord Query

Consider an ActiveRecord model with a scope:

```ruby
class Book < ApplicationRecord
  scope :published, -> { where("books.published_at is not null") }
end
```

Now let's say we are working in another part of the codebase composing a query
that gathers all authors with published books. That might look something like
this:

```ruby
published_authors =
  Authors.joins(:book).where("books.published_at is not null")
```

This will get the job done, but we've now duplicated the same logic in
different parts of the app. We can utilize the existing scope on `Book` using
ActiveRecord's
[`merge`](https://devdocs.io/rails~5.2/activerecord/spawnmethods#method-i-merge)
method.

```ruby
published_authors =
  Authors.joins(:book).merge( Book.published )
```

The `merge` method can be used to incorporate any conditions from other partial
queries -- this means both `where` clauses and `joins` clauses.

[source](http://aokolish.me/blog/2015/05/26/how-to-simplify-active-record-scopes-that-reference-other-tables/)
