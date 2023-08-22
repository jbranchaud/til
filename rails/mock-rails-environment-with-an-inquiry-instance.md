# Mock Rails Environment With An Inquiry Instance

As discussed in [Make A String Attribute Easy to Inquire
About](make-a-string-attribute-easy-to-inquire-about.md), the `Rails.env` is
assigned an instance of `ActiveSupport::StringInquirer`. This allows us to ask
whether the current Rails environment is `#production?`, `#development?`, etc.

With this in mind, we can have a test execute in a specific environment by
mocking how `Rails.env` responds. Though the actual env for a test is going to
be `test`, we can simulate a different environment with an RSpec `before` block
like the following:

```ruby
before do
  allow(Rails).to receive(:env) { "staging".inquiry }
end
```

Or similarly, to simulate the `production` environment:

```ruby
before do
  allow(Rails).to receive(:env) { "production".inquiry }
end
```

The `#inquiry` being monkey-patched onto the `String` class gives you the
willies, you could do the following instead:

```ruby
before do
  allow(Rails).to receive(:env) do
    ActiveSupport::StringInquirer.new("production")
  end
end
```

[source](https://stackoverflow.com/a/25134591/535590)
