# Parameterize A String With Underscores

I have human-readable status strings that I'm working with like `In progress`,
`Pending approval`, and `Completed`. I need to deterministically turn those
into parameterized values that I can compare. That is, I want them lowercased
and separated by underscores instead of spaces.

The `ActiveSupport` `#parameterize` method, as is, gets me pretty close.

```ruby
> statuses = [
  "In progress",
  "Pending approval",
  "Completed"
]

> statuses.map(&:parameterize)
=> [
  "in-progress",
  "pending-approval",
  "completed"
]
```

Those are separated by dashes though. Fortunately, `parameterize` takes a
`separator` option that we can use to verride what character is used to
separate words. Let's use an underscore (`_`).

```ruby
> statuses.map { |str| str.parameterize(separator: '_') }
=> [
  "in_progress",
  "pending_approval",
  "completed"
]
```

See the [`#paramterize`
docs](https://api.rubyonrails.org/classes/ActiveSupport/Inflector.html#method-i-parameterize)
for more details.
