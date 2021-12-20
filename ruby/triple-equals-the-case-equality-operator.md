# Triple Equals: The Case Equality Operator

The standard equality operator in Ruby is the double equals (`==`).

```ruby
> 2 + 2 == 4
=> true
```

Ruby supports another operator that looks sneakily like this, but with
different behavior. It's the triple equals (`===`) which is called the [case
equality
operator](https://ruby-doc.org/core-3.0.3/Object.html#method-i-3D-3D-3D) (or
case subsumption operator).

Though the specific behavior can be overridden on a class by class basis, the
operator is generally used to check if the first operand is a bucket that the
second operand fits into.

Here are some examples:

```ruby
> (1..10) === 5
=> true
> (1..10) === 13
=> false

> Integer === 7
=> true
> Integer === 'nope'
=> false

> /fun/ === "fundamentals"
=> true
> /taco/ === "fundamentals"
=> false

> Object === String
=> true
> String === Object
=> false
```

It's important to understand how this works because `===` is the operator used
under the hood by Ruby's case statements.

[source](https://stackoverflow.com/questions/4467538/what-does-the-operator-do-in-ruby/4467823#4467823)
