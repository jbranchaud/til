# Range Into List Using Comprehensions

Using an _identity_ comprehension and the `:into` option, we can easily
convert a range into a list.

```elixir
> for x <- 1..10, into: [], do: x
[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```

Check out [the docs for the `:into`
option](http://elixir-lang.org/getting-started/comprehensions.html#the-into-option)
for more details.
