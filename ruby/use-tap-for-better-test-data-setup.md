# Use Tap For Better Test Data Setup

I often use RSpec's `let` statement to set up some test data.

```ruby
let(:order) { create(:order, name: "My Order") }
```

Often times, realistic test data requires setting up peripheral data as well.

```ruby
let(:order) do
  order = create(:order, name: "My Order")
  create(:item, name: "Burger", order: order, price: 4.99)
  create(:item, name: "Fries", order: order, price: 2.99)
  order
end
```

This can get hard to read as the subject of the `let` gets obscured. It is also
clumsy that we have to end with returning the `order`. This can be cleaned up
with the use of [`#tap`](https://devdocs.io/ruby~2.5/object#method-i-tap).

```ruby
let(:order) do
  create(:order, name: "My Order").tap do |order|
    create(:item, name: "Burger", order: order, price: 4.99)
    create(:item, name: "Fries", order: order, price: 2.99)
  end
end
```

The block notation and indentation make it clear that the `order` is what is
getting created. Meanwhile, the interior of the block gives us a designated
area to do what we need to with the newly-created `order` instance.
