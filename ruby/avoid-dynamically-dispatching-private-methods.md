# Avoid Dynamically Dispatching Private Methods

Ruby makes it easy to call any method on an object with the
[`Object#send`](https://docs.ruby-lang.org/en/4.0/Object.html#method-i-send)
method. It's powerful because I can dynamically call methods (e.g. based on a
variable that is being passed in) and I can even dispatch private methods which
is normally disallowed.

```ruby
obj.send(:initialize, new_args)
```

If I want the benefits of dynamic dispatch without allow private methods to be
called, then I can instead reach for the
[`Object#public_send`](https://docs.ruby-lang.org/en/4.0/Object.html#method-i-public_send)
method.

Here is a basic `Invoice` class to demonstrate:

```ruby
class Invoice
  TAX_RATE = 0.08

  def initialize(subtotal:)
    @subtotal = subtotal
  end

  def total
    (@subtotal + tax).round(2)
  end

  private

  def tax
    @subtotal * TAX_RATE
  end
end

invoice1 = Invoice.new(subtotal: 250)

puts "Total: #{invoice1.send(:total)}"
puts "Tax: #{invoice1.send(:tax)}"

# this will error
invoice1.public_send(:tax)
```

When I run this file, the two `send` statements both work while the
`public_send` on a private method raises:

```bash
❯ ruby object_send.rb
Total: 270.0
Tax: 20.0
object_send.rb:25:in 'Kernel#public_send': private method 'tax' called for an instance of Invoice (NoMethodError)

invoice1.public_send(:tax)
        ^^^^^^^^^^^^
Did you mean?  tap
	from object_send.rb:25:in '<main>'
```

Where this behavior might be most useful is in a Rails _concern_ file where I am
defining some shared behavior that needs to work dynamically across classes that
are including it.

```ruby
module ValidatesAttachment
  extend ActiveSupport::Concern

  IMAGE_TYPES = %w[image/gif image/jpeg image/jpg image/png].freeze
  MAX_SIZE = 5.megabytes

  class_methods do
    def validates_attachment(name, content_types: IMAGE_TYPES, max_size: MAX_SIZE, types_message: nil)
      validate do
        attachment = public_send(name)

        # ... validation logic omitted
      end
    end
  end
end
```
