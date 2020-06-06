# Get Size Stats For A Collection

For any collection in your MongoDB instance.

```javascript
> db.getCollectionNames()
["books", "authors", "genres"]
```

You can list a collection of stats, which include the amount of disk space that
collection is utilizing.

```javascript
> db.books.stats().size
11057056
```

By default this size is in bytes, which isn't all that human-readable of a
value.

By passing in a `scale` value to `stats()`, you can get a value that is a bit
more understandable. A scale of `1024` would give you kilobytes, so a scale of
`1024 * 1024` would give you megabytes.

```javascript
> db.books.stats({ scale: 1024 * 1024 }).size
10
```

[source](https://docs.mongodb.com/manual/reference/method/db.collection.stats/)
