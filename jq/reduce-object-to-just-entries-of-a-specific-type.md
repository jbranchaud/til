# Reduce Object To Just Entries Of A Specific Type

Let's say I have a large JSON data file with a ton of top-level fields of
varying types. It can be hard to wade through it as is. [The `jq`
utility](https://stedolan.github.io/jq/manual/) can help. I can filter a JSON
object down to just the fields of a certain type.

For instance, I may want to start with a view of the JSON that is restricted to
just the values of type `array`.

To do this, I need to use a couple different `jq` helper functions.

```bash
jq '. | to_entries | map(select(.value | type | match("array"))) | from_entries' data.json
```

This starts with `to_entries` to convert an object into an array of key-value
pairs. I then `map` over those pairs selecting just the pairs whose value
matches the `"array"` type. I then use `from_entries` to turn the reduced array
back into an object.

There is a less verbose way to do the above. The `to_entries` and
`from_entries` can be collapsed into a `with_entries` that wraps the `map`
call.

```bash
jq '. | with_entries(map(select(.value | type | match("array")))' data.json
```
