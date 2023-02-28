# Count Each Collection In A JSON Object

Let's say your JSON file is an object that represents several different
collections (arrays) of data.

```json
{
  "users": [ ... ],
  "orders": [ ... ],
  "carts": [ ... ]
}
```

We can get a nice summary of the counts of those collections using
[`jq`](https://stedolan.github.io/jq/). We can do that with the [`with_entries`
function](https://stedolan.github.io/jq/manual/#to_entries,from_entries,with_entries).
We preserve the key (name) of each collection and then process each list with
the `length` function.

```bash
jq '. | with_entries({ "key": .key, "value": (.value | length)})' data.json
{
  "users": 1234,
  "orders": 5432,
  "carts": 89
}
```

The `with_entries` function essentially maps over each key-value pair
processing it with the given expression. It will then convert that `{"key":
some_key, "value": 123}` mapping back into a key-value pair that gets combined
with all the others.

[source](https://til.simonwillison.net/jq/flatten-nested-json-objects-jq)
