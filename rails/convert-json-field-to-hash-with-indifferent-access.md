# Convert JSON Field To Hash With Indifferent Access

Let's say we have an `Event` model whose backing table includes a `JSONB` (or
`JSON`) field called `details`.

When we access `details` in a Rails context, digging into that nested data we
have to use string keys throughout. However, we may have existing related code
that is dealing with this shape of data using symbol keys. This might put us in
a position where we have to rework a bunch of existing code or do defensive
coding like `details[:user] || details["user"]`.

To avoid that, we can instead have the `Event` model override `details`
converting that underlying data to `HashWithIndifferentAccess` before returning
it.

```ruby
class Event < ApplicationRecord
  def details
    data = super
    return data if data.nil?
    
    case data
    when Array
      data.map { |item| item.is_a?(Hash) ? item.with_indifferent_access : item }
    when Hash
      data.with_indifferent_access
    else
      data
    end
  end
end
```

With this in place, anywhere in the codebase where we access `details` on an
instance of `Event` we will be able to use string or symbol keys
interchangeably.
