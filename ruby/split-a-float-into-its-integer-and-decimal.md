# Split A Float Into Its Integer And Decimal

Let's say we have a float value like `3.725`. We want to break it up into its
constituent parts -- the integer part (`3`) and the decimal part (`0.725`).

This can be done with the `divmod` method on the `Numeric` class.

```ruby
3.725.divmod(1)
=> [3, 0.7250000000000001]
```

In the general case, this method gives you the quotient and the modulus of
dividing the number by the given value. When that given value is specifically
`1`, it will give you those two parts of the float.

One place where this might be useful is when trying to convert a float
representing an amount of time into hours and minutes.

```ruby
hours = 3.725

hours_digit, percentage_minutes = hours.divmod(1)

minutes = (60 * percentage_minutes).to_i
hours_standard = "#{hours_digit}:#{minutes}"
```

[source](https://ruby-doc.org/core-2.5.3/Numeric.html#method-i-divmod)
