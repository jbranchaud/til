# Find All Objects In An Array Where Key Is Set

Let's say we have a large array of objects. And the data in those objects,
while generally having the same shape, does not always have certain values set.

For instance, here is some data where the `token` is sometimes set, sometimes
`null`, and sometimes missing altogether.

```json
[
  {
    "id": 1,
    "token": "abc"
  },
  {
    "id": 3,
    "token": null
  },
  {
    "id": 5
  },
  ...
]
```

We can find out how many objects in this collection have the `token` key set to
an actual value with [a `jq` query](https://stedolan.github.io/jq/manual) like
the following.

```bash
jq '. | map(select(has("token") and .token != null)) | length' data.json
```

This maps over each object selecting those where it has `token` and `token` is
not `null`.

We can instead produce the inverse count—those objects where `token` is not set
to a value—with the `not` operator.

```bash
jq '. | map(select(has("token") and .token != null | not)) | length' data.json
```

If you want to inspect the array of objects that either of these queries filters down to, you can drop the `| length` part.

```bash
jq '. | map(select(has("token") and .token != null))' data.json
```

Here is [a live example](https://jqterm.com/?query=.%20%7C%20map%28select%28has%28%22token%22%29%20and%20.token%20!%3D%20null%20%7C%20not%29%29).
