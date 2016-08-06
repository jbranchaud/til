# Binary Representation Of A String

> A common trick in Elixir is to concatenate the null byte <<0>> to a string
> to see its inner binary representation.

A couple example of this can be seen in the following snippet of code:

```elixir
> "hello" <> <<0>>
<<104, 101, 108, 108, 111, 0>>
> "ƒå®øü†" <> <<0>>
<<198, 146, 195, 165, 194, 174, 195, 184, 195, 188, 226, 128, 160, 0>>
```

[source](http://elixir-lang.org/getting-started/binaries-strings-and-char-lists.html)
