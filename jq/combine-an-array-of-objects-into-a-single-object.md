# Combine An Array Of Objects Into A Single Object

If you've spent any amount of time pulling data out of a JSON file with `jq`,
you may have run into a result set that looks a little too spacious. It's this
array of single key-value pair objects.

```bash
$ jq '.items | map({(.slug)}: .amount})' my-data.json

[
  {
    "key-1": 123
  },
  {
    "key-2": 345
  },
  {
    "key-3": 456
  },
  ...
]
```

When what you really wanted was a single object full of those unique key-value
pairs.

That query has you 90% of the way there. The trick is to pipe that array
through the [`add` function](https://jqlang.github.io/jq/manual/#add) which
will combine each of those individual objects into a single object.

```bash
$ jq '.items | map({(.slug)}: .amount}) | add' my-data.json

{
  "key-1": 123,
  "key-2": 345,
  "key-3": 456,
  ...
}
```
