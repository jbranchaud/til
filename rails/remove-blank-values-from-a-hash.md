# Remove Blank Values From A Hash

Ruby's [`Enumerable`](https://docs.ruby-lang.org/en/master/Enumerable.html) has
a method `#compact` that will remove `nil` values from `Enumerable` objects like
hashes and arrays.

```ruby
> { one: nil, two: 2, three: "" }.compact
=> {two: 2, three: ""}
> [nil, 2, ""].compact
=> [2, ""]
```

That is often what I want because I'm thinking in terms of values being either
`nil` or valid value.

Sometimes I want to remove all _blank_ values, not just the `nil` ones. This
happens in a Rails context like in a controller when dealing with parameters
from a request -- a form field was left blank (`""`) or no options were picked
from the multi-select (`[]`).

Rails adds
[`#compact_blank`](https://api.rubyonrails.org/classes/Enumerable.html#method-i-compact_blank)
to `Enumerable` to support these cases. Consider that `#compact` corresponds to
`#nil?` where as `#compact_blank` corresponds to `#blank?`.

Here is the example hash pulled from the docs:

```ruby
> { a: "", b: 1, c: nil, d: [], e: false, f: true }.compact
=> {a: "", b: 1, d: [], e: false, f: true}
> { a: "", b: 1, c: nil, d: [], e: false, f: true }.compact_blank
=> {b: 1, f: true}
```

I might want to `compact_blank` a set of search parameters coming from the
client before passing it into my search service:

```ruby
class BooksController < BaseController
  def search
    @results = SearchService.call(search_params.compact_blank)
  end

  private

  def search_params
    params.permit(...)
  end
end
```
