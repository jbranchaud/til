# Chaining Multiple RSpec Change Matchers

It can be handy to use RSpec's `change` matchers to determine if some method
or process creates a new record.

```ruby
expect{ Registration.create(attrs) }.to change{ User.count }.by(1)
```

But what if we are testing a method that creates a couple different records
in the system?

RSpec allows us to chain together `change` matchers with `and`. Consider
this additional contrived example.

```ruby
expect {
  Project.generate(attrs)
}.to change{ Project.count }.by(1).and \
     change{ User.count }.by(1)
```

In addition to keeping our tests tight and concise, this approach gives
some pretty nice output on failure.

If we were just beginning our implementation with a failing test, we'd see a
multi-part failure like the following.

```ruby
Failure/Error:
  expect {
    Project.generate(attrs)
  }.to change{ Project.count }.by(1).and \
       change{ User.count }.by(1)

     expected result to have changed by 1, but was changed by 0

  ...and:

     expected result to have changed by 1, but was changed by 0
```
