# Rounding Numbers With Precision

Ruby's `Float#round` method gets the job done, but doesn't offer much
configurability. If you'd like to finely control how a rounded number will
display, `ActiveSupport::NumberHelper` offers
[`number_to_rounded`](https://api.rubyonrails.org/classes/ActiveSupport/NumberHelper.html#method-i-number_to_rounded).

When a precision is specified, it will apply to the fraction digits:

```ruby
> ActiveSupport::NumberHelper.number_to_rounded(1.0, precision: 2)
=> "1.00"
```

Unless you include `significant: true` in which case precision will refer to
the number of signficant digits:

```ruby
> ActiveSupport::NumberHelper.number_to_rounded(1.0, precision: 2, significant: true)
=> "1.0"
```

Because this is for display purposes, the return value is a string. You can
further specify that insignificant zeros are stripped from the result:

```ruby
> ActiveSupport::NumberHelper.number_to_rounded(1.0, precision: 2, significant: true, strip_insignificant_zeros: true)
=> "1"
```

And for completeness, here is an example of a number being rounded up:

```ruby
> ActiveSupport::NumberHelper.number_to_rounded(1.29, precision: 2, significant: true)
=> "1.3"
```

[source](https://api.rubyonrails.org/classes/ActiveSupport/NumberHelper.html#method-i-number_to_rounded)
