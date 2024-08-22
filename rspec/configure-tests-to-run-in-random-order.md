# Configure Tests To Run In Random Order

By default, an RSpec test suite is going to run in a predictable, sequential
order, every time.

When testing the parts of a complex Rails app that have all kinds of test data
that needs to be set up, I prefer to have my tests always run in a random
(repeatable with a seed) order. This way I'm more likely to catch sooner,
rather than later, bugs that are hidden by passing tests due to test data setup
that happens to work in a specific order.

RSpec can be configured to run tests in a random, seedable order in the
`spec_helper.rb` file.

```ruby
RSpec.configure do |config|
  config.order = :random
end
```

Whenever you run your test suite, the first thing you'll see is a message like
this:

```
Randomized with seed 7011
```

That seed number can be used to re-run the suite in a repeatable order when you
need to do so to track down an order-dependent failing test.

```bash
$ be rspec --seed 7011
```
