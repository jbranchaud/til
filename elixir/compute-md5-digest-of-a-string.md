# Compute md5 Digest Of A String

To compute the md5 digest of a string, we can use Erlang's top-level `md5`
function.

```elixir
> :erlang.md5("#myelixirstatus")
<<145, 148, 139, 99, 194, 176, 105, 18, 242, 246, 37, 69, 142, 69, 226, 199>>
```

This, however, gives us the result in the raw binary representation. We
would like it in a base 16 encoding, as md5 digests tend to be.

We can wrap (or pipe) this with `Base.encode16` to get the result we are
looking for.

```elixir
> Base.encode16(:erlang.md5("#myelixirstatus"), case: :lower)
"91948b63c2b06912f2f625458e45e2c7"
```

[source](https://gist.github.com/10nin/5713366#gistcomment-1445219)
