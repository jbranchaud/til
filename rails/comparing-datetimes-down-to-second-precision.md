# Comparing DateTimes Down To Second Precision

You may have an RSpec test for your Rails codebase that asserts about the
datetime a record gets saved with:

```ruby
two_weeks_ago = 2.weeks.ago

record = Thing.create(two_weeks_ago)

expect(record.some_date_time).to eq(two_weeks_ago)
```

This comparison happens with precision down to the nanosecond. Unfortunately,
depending on your operating system and backing database, you may see
inconsistent results due to variations in precision.

One way to deal with this, if you only care about precision down to the second,
is to modify the expecationa little with the [`be_within`
matcher](https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers/be-within-matcher).

```ruby
two_weeks_ago = 2.weeks.ago

record = Thing.create(two_weeks_ago)

expect(record.some_date_time).to be_within(1.second).of(two_weeks_ago)
```

The `be_within` matcher can also be used as [a nested
matcher](https://twitter.com/jbrancha/status/1213162124777869319?s=20).
