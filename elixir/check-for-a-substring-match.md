# Check For A Substring Match

Using Erlang's `:binary.match` function, you can easily check if a string
has a matching substring.

```elixir
> :binary.match("all food is good", "foo")
{4, 3}
> :binary.match("all food is good", "bar")
:nomatch
```

As you can see, the return value on a successful match is a tuple with the
index of where the match starts and the length of the match. If there is no
match, the `:nomatch` atom is returned.

See the [`match/2` and `match/3`
docs](http://erlang.org/doc/man/binary.html#match-2) for more details.

[source](http://stackoverflow.com/questions/35551072/how-to-find-index-of-a-substring)
