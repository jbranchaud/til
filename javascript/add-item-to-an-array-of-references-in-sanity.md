# Add Item To An Array Of References In Sanity

Let's say we have an existing record in our Sanity dataset. The schema for that
record allows for an array of references to another type of record. As part of
programmatically importing some data, we need to tie some records together by
adding to that array of references.

We've already set up our [Sanity client](https://www.sanity.io/docs/js-client)
(via the JavaScript SDK). We have an `_id` for the record we want to patch. We
have a `resourceId` for the resource that we want to _reference_ in the array.

Here is how we perform that `patch`:

```javascript
await sanityClient
  .patch(_id)
  .setIfMissing({resources: []})
  .append('resources', [{_type: 'reference', _ref: resourceId}])
  .commit({autoGenerateArrayKeys: true})
```

1. We give it the `_id` of the record we want to `patch`.
2. We set our array of `resources` to an empty array (`[]`) if it hasn't
   already been set.
3. We `append` to the `resources` array with an array containing a single item,
   a reference to our resource.
4. We `commit` the changes with the directive that Sanity should auto-generate
   the `_key` value for any new array items.
