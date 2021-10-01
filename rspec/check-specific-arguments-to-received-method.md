# Check Specific Arguments To Received Method

Let's say we have a method receiving a big hash of arguments. A hash like this:

```ruby
{
  name: 'Taco Tray',
  product_id: 'taco123',
  price: 4500,
  description: 'A big tray of tacos',
  discounts: {
    coupon: 'DISCOUNT_TACOS'
  }
}
```

In an RSpec test we want to check one of those hash values in a certain
scenario. It can be tedious to type out and check the entire hash. Instead, we
want the test to surgically check just one part of the hash.

We can do this with RSpec's dynamic matcher syntax. The [`hash_including`
argument
matcher](https://rspec.info/documentation/3.4/rspec-mocks/RSpec/Mocks/ArgumentMatchers.html#hash_including-instance_method)
can be nested within the `#with` part of `expect().to receive().with()`.

```ruby
expect(TacoTruck)
  .to receive(:take_order)
  .with(
    hash_including(
      discounts: { coupon: 'DISCOUNT_TACOS'}
    )
  )
```

This will assert about the `discounts` portion of the hash that `#take_order`
gets called with. The rest of the hash will be ignored.

Without `hash_including`, the `with` call would result in a failure when trying
to match against the entire hash.
