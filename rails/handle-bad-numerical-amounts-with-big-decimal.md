# Handle Bad Numerical Amounts With BigDecimal

I'm working on a payment page with a backing Rails controller. The user can
select between their full balance or some partial payment amount. Because this
form accepts an arbitrary value for the amount, I need to do some server-side
validation.

While I could parse the `amount` value and handle the exception that gets raised
on bad numerical values, I'd rather have bad values coerce to `nil` and let
downstream validations handle it from there.

[`BigDecimal`](https://docs.ruby-lang.org/en/master/BigDecimal.html) can help
here with the support of its `exception` option.

```ruby
> BigDecimal('123', exception: false)
=> 0.123e3
> BigDecimal('taco', exception: false)
=> nil
```

Maybe that parsing logic ends up looking something like this:

```ruby
def parse_payment_amount(value, current_balance)
  amount = BigDecimal(value, exception: false)

  if amount.present? && amount == current_balance
    [:full_balance, amount]
  else
    [:other, amount]
  end
end
```

I return tuples where you either get a verified `:full_balance` amount or you
get some `:other` amount. The other amount could be `nil` which would trigger a
downstream validation.
