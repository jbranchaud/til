# List Size Stats For All Collections

In [Get Size Stats for a Collection](get-size-stats-for-a-collection.md), we
saw how to use `db.collection.stats()` and its `scale` parameter to get a
useful size metric for a given collection.

We can combine some of this concepts with some scripting to list human-readable
size metrics for all of our database's collections:

```javascript
> db.getCollectionNames().forEach(function (collectionName) {
    sizeInMb = db[collectionName].stats({ scale: 1024 * 1024 }).size;
    print(collectionName + ": " + sizeInMb + "MB");
  })
books: 10MB
authors: 2MB
genres: 1MB
```

This snippet gets all the collections for the current database and iterates
over them. For each collection name, it looks up the `size` stat for that
collection scaled to megabytes and then prints it all out with some contextual
information.

[source](https://docs.mongodb.com/manual/faq/storage/#data-storage-diagnostics)
