# Add ActiveRecord Error Not Tied To Any Attribute

Often the [errors on an ActiveRecord
object](https://api.rubyonrails.org/v6.1.3.2/classes/ActiveModel/Errors.html)
are tied to a specific attribute of that object. For instance, when this
validation is violated

```ruby
validates :name, presence: true
```

Then the error will be tied to `:name`.

With the
[`ActiveModel::Errors#add`](https://api.rubyonrails.org/v6.1.3.2/classes/ActiveModel/Errors.html#method-i-add)
method, we can write custom validation logic that ties an error to a specific
attribute.

```ruby
validate :quantity_for_bulk_purchase

def quantity_for_bulk_purchase
  return if purchase_type != :bulk

  if quantity < 12
    errors.add(:quantity, "must be greater than 12 for bulk purchases")
  end
end
```

Errors don't have to be tied to specific attribute. They can be tied to the
object as a whole. This can be better for validations, like the one above, that
involve multiple attributes.

```ruby
validate :quantity_for_bulk_purchase

def quantity_for_bulk_purchase
  return if purchase_type != :bulk

  if quantity < 12
    errors.add(:base, "Quantity must be greater than 12 for bulk purchases")
  end
end
```

By using the `:base` symbol, we are ascribing this error to the object as a
whole.

```
> my_object.errors
#=> #<ActiveModel::Errors:0x00007fccaa5a8740
 @base=
  #<MyObject:0x00007fcc8a5e9238
    ...
    @details={:base=>[{:error=>"Quantity must be greater than 12 for bulk purchases"}]},
    @messages={:base=>["Quantity must be greater than 12 for bulk purchases"]}>

> my_object.errors.full_messages
#=> ["Quantity must be greater than 12 for bulk purchases"]
```
