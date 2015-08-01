# Next And Previous Floats

The `Float` class has two interesting methods for stepping forward or
backwards through the numbers that can actually be *represented* by floats.
This is handy since floats are not evenly spaced.

Use `#next_float` to go forward

```ruby
> 2.0
=> 2.0
> _.next_float
=> 2.0000000000000004
> _.next_float
=> 2.000000000000001
> _.next_float
=> 2.0000000000000013
> _.next_float
=> 2.0000000000000018
```

Use `#prev_float` to go backwards

```ruby
> 2.0
=> 2.0
> _.prev_float
=> 1.9999999999999998
> _.prev_float
=> 1.9999999999999996
> _.prev_float
=> 1.9999999999999993
> _.prev_float
=> 1.9999999999999991
```

I cannot think of any practical use cases, but it is fun to know they are
there if you need them.
