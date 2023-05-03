# Get The First Item For Every Top-Level Key

Let's say we have a JSON object where each key in that object is tied to a
large array of values. To get a better idea of what the data looks like, we
want to trim down the JSON a bit. Essentially, we want to tie each key to the
first value in each of their respective arrays.

We can do this by reducing the object into a new object where each top-level
key is tied to the first item in its array.

```bash
$ jq '. as $object | reduce keys[] as $k ({}; .[$k] = $object[$k][0])' data.json
```

This uses variables (`$object` and `$k`) and the [`reduce`
function](https://stedolan.github.io/jq/manual/#Reduce) to iterate over the
incoming JSON object and produce a new object with the trimmed down data.

JSON like this:

```json
{
  "key1": ["a", "b", "c"],
  "key2": [1, 2, 3],
  "key3": ["x", "y", "z"]
}
```

will be turned into this:

```json
{
  "key1": "a",
  "key2": 1,
  "key3": "x"
}
```
