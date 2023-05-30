# Batch Insert Records With createMany

As part of its suite of CRUD functionality, [Prisma has a `createMany`
function](https://www.prisma.io/docs/reference/api-reference/prisma-client-reference#createmany)
that allows you to `insert` many records at once with your target database.
This will perform one large insert statement which will generally be faster
than an equivalent series of individual insert statements.

```javascript
const createResult = await prisma.books.createMany({
  data: [
    { isbn: '123', title: 'The Goldfinch' },
    { isbn: '345', title: 'Piranesi' },
    { isbn: '987', title: 'The Fifth Season' },
  ],
  skipDuplicates: true
})
```

With the `skipDuplicates` option, any inserts that would result in a duplicate
record (`isbn` is my unique key in this example) will be skipped.

The result of the query will include a `count` key to let you know how many
records were actually inserted.

If I'm bulk inserting a _ton_ of data, I like to chunk it up so that I'm not
creating queries that are too big. For a recent script, I found that `1000` was
a good chunking number.

```javascript
import 'chunk' from 'lodash/chunk'

const chunkedBatchInsert = async (records) => {
  for(const batch of chunk(records, 1000)) {
    await prisma.books.createMany({
      data: batch,
      skipDuplicates: true
    })
  }
}
```
