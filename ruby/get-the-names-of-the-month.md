# Get The Names Of The Month

Ruby's `Date` object has a `MONTHNAMES` constant that returns an array of names
of the month. You'd think that means the array contains 12 items. However, the
size of that array is 13.

```ruby
> Date::MONTHNAMES
=> [nil, "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
```

Notice it has all 12 months, plus an initial value of `nil`.

This is because it allows us to more intuitive access a month by it's index
without having to do a little subtraction. If I want to know what the 9th month
is, I can do an array access for `9`.

```ruby
> Date::MONTHNAMES[9]
=> "September"
```

Because arrays in Ruby use 0-based indexing, without this baked in `nil` value,
you'd instead get `"October"` when passing in `9`.
