# Shift The Month On A Date Object

One of things that Ruby loves to do is overload operators to support
specialized class-specific functionality. For instance, with the `Date` class,
you can use the `+` and `-` operators to add or remove days from a given
`Date`.

```ruby
> Date.today
=> #<Date: 2023-07-13 ((2460139j,0s,0n),+0s,2299161j)>
> Date.today + 1
=> #<Date: 2023-07-14 ((2460140j,0s,0n),+0s,2299161j)>
> Date.today - 3
=> #<Date: 2023-07-10 ((2460136j,0s,0n),+0s,2299161j)>
```

That one feels pretty natural to me.

The `Date` class overloads another operator to do something that doesn't feel
quite as natural.

The `<<` operator will shift (increment or decrement) the month of the given
`Date` object. Given a positive number, it will shift the date that many months
in the future (even wrapping to a new year as necessary). Given a negative
number, it will shift the date back in time that many months.

```ruby
> Date.today
=> #<Date: 2023-07-13 ((2460139j,0s,0n),+0s,2299161j)>
> Date.today << 1
=> #<Date: 2023-06-13 ((2460109j,0s,0n),+0s,2299161j)>
> Date.today << -2
=> #<Date: 2023-09-13 ((2460201j,0s,0n),+0s,2299161j)>
> Date.today << 6
=> #<Date: 2023-01-13 ((2459958j,0s,0n),+0s,2299161j)>
```

This is a bit clever for my liking, but fun to know about.

[source](https://ruby-doc.org/stdlib-3.0.0/libdoc/date/rdoc/Date.html#method-i-3C-3C)
