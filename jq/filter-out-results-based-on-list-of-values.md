# Filter Out Results Based On List Of Values

Let's say we have an array of objects in a JSON file. We want to extract some
data about each of those objects, but first we want to filter out some of the
objects that we don't need. This will be based on a list of IDs.

The JSON might look something like this:

```json
[
  {'id': '123', ...},
  {'id': '456', ...},
  {'id': '789', ...},
  {'id': '963', ...},
  ...
]
```

With the [`select`](https://jqlang.github.io/jq/manual/#select) function, we
can filter the array down to those objects whose IDs are
[`not`](https://jqlang.github.io/jq/manual/#and-or-not)
[`inside`](https://jqlang.github.io/jq/manual/#inside) the list of IDs to
exclude.

```
jq '.[] | select([.id] | inside["456", "963"] | not)' data.json
```

Inside that `select`, we grab the `id` as a single value array, check if that
value is inside our _exclude_ array, and then invert that result. If there is a
match, that object will be filtered out.

We can then chain additional filtering and extraction on to the end of the
query to produce the result we want.
