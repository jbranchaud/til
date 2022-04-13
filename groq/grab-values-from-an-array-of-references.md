# Grab Values From An Array Of References

Let's say we have a `post` object in our schema. A `post` can have an array of
references to `tags` telling you what topics the post covers. Each `tag` has a
slug and we want to get the `string` value for each slug.

Let's say we are interested in the post with `_id` of `123`.

Here is how we can achieve that with a `groq` query:

```groq
*[
  _type == 'post' && _id == 123
]{
  'tags': tags[]->slug.current
}.tags

=> ["javascript", "react-js"]
```

If the schema was such that each `post` just had a single tag reference, then
you could write the chain of references as `tag->slug.current`. Because it is
an array of references, we need the `[]` to declare that we want each value.

The `->` operator follows the reference. Otherwise we'd just have access to the
`_ref` and `_type` values.

The final `.tags` unnests the `tags` value we gathered into an object. Then the
result is just the array of slug values.
