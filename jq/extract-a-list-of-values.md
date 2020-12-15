# Extract A List Of Values

[`jq`](https://stedolan.github.io/jq/) can be used to extract a list of values
from an array in a JSON file.

Consider the following JSON:

```json
{
  "items": [
    { "id": 1, "name": "Liz Lemon" },
    { "id": 2, "name": "Pete Hornberger" },
    { "id": 3, "name": "Tracy Jordan" },
    { "id": 4, "name": "Jenna Maroney" }
  ]
}
```

First, you need to specify the selector path to the list. One it's own that
will grab the list.

```bash
$ jq '.items' data.json
[
  {
    "id": 1,
    "name": "Liz Lemon"
  },
  ...
]
```

Then you need to use brackets to interact with the list. `.items[0]` and
`.items[1]` would grab the first and second item in the list, respectively.
Leaving the brackets empty (`.items[]`) tells `jq` that you want to interact
with each item in the list.

Then tack on a selector for what you want out of each item.

```bash
$ jq '.items[].name' data.json
"Liz Lemon"
"Pete Hornberger"
"Tracy Jordan"
"Jenna Maroney"
```

This grabs the name from each of the objects within the _items_ array. The
results are printed to stdout.
