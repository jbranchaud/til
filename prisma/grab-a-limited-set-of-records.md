# Grab A Limited Set Of Records

Let's say you want to grab some records from a table, but you want to limit the
result set to 10 records.

You can do that with the `take` option.

```javascript
const posts = await prisma.post.findMany({
  take: 10
});
```

It is generally good to not assume anything about the ordering. Instead, you
should be explicit about the order you want, so let's include an `orderBy` as
well.

```javascript
const posts = await prisma.post.findMany({
  take: 10,
  orderBy: { createdAt: "asc" },
});
```

This will return the 10 most recently created posts.

[source](https://www.prisma.io/docs/reference/api-reference/prisma-client-reference#findmany)
