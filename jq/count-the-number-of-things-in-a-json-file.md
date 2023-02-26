# Count The Number Of Things In A JSON File

JQ is a great tool for finding out the number of things in a JSON file.

If the top-level contents of the JSON is a list, then you can pipe it directly
to the [`length` function](https://stedolan.github.io/jq/manual/#length).

```bash
// [1, 2, {"three": 4}]
$ jq '. | length' data.json
3
```

It works the same for counting the number of entries (key-value pairs) in a
top-level JSON object.

```bash
// { "hello": "world", "list": [1,2,3] }
$ jq '. | length' data.json
2
```

If you are trying to get the count of a nested value, navigate to it and then
pipe that to `length`.

```bash
// { "hello": "world", "list": [1,2,3] }
$ jq '.list | length' data.json
3
```

You can even count each value in a JSON object by transforming it into an array
of the values with `[]`.

```bash
// { "hello": "world", "list": [1,2,3] }
$ jq '.[] | length' data.json
5
3
```

Notice, the length of `"world"` is `5` characters and the length of `[1,2,3]`
is `3` elements.
