# Get A Slice Of The Ends Of An Array

[`jq`](https://jqlang.github.io/jq/) has an array slice syntax that allows us
to grab a subset of values from an array. The general form of this syntax is
`[n:m]` where `n` is the index of the start of our slice (inclusive) and `m` is
the index of the end of our slice (non-inclusive).

If we omit the `n`, it defaults to `0`, or the start of the array. Similarly,
if we omit the `m`, it defaults to the end of the list.

Knowing that, we can grab the first few elements of the list like so:

```bash
❯ echo '["a","b","c","d","e","f","g"]' | jq '.[:3]'
[
  "a",
  "b",
  "c"
]
```

We can also use a negative index value to count back from the end of the array.
This allows us to grab a slice from some point relative to the end of the list.
Instead of having to compute it based on knowing the length of the array.

Knowing that, we can grab the last few elements of the list like so:

```bash
❯ echo '["a","b","c","d","e","f","g"]' | jq '.[-3:]'
[
  "e",
  "f",
  "g"
]
```

[source](https://jqlang.github.io/jq/manual/#array-string-slice)
