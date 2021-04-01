# Mask An ActiveRecord Attribute

Let's say we have a `User` model with backing table that has an `email`
attribute.

If we look up a `User` record, we can grab its email because Rails provides an
accessor to that attribute under the hood.

```ruby
> user.email
'Liz.Lemon@example.com'
```

We can write a custom `#email` method on `User` to mask that attribute. We
could do this for any number of reasons. One might be to always downcase the
email before retrieving it and using it througout app code.

```ruby
class User < ApplicationRecord
  def email
    read_attribute(:email).downcase
  end
end
```

This uses the
[`#read_attribute`](https://api.rubyonrails.org/classes/ActiveRecord/AttributeMethods/Read.html#method-i-read_attribute)
method which retreives the type casted value before hitting the accessor
method. We have to do this, rather than calling `#email` directly, because that
would result in an infinite loop.

```ruby
> user.email
'liz.lemon@example.com'
```

I'd probably handle this email scenario at the DB-layer. Nevertheless, this
demonstrates a technique we can use in a variety of scenarios at the
Rails-layer.
