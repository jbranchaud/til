# Override Table Name For Prisma Model

When defining your Prisma schema, you'll add models to your
`prisma/schema.prisma` file that look something like this:

```
model Book {
  id               BigInt   @id @default(autoincrement()) @db.BigInt
  title            String
  author           String
  publication_year Int
  created_at       DateTime @default(now())
  updated_at       DateTime @updatedAt
}
```

The prisma client (ORM-layer) that gets generated will have a `Book` type and
you'll be able to reference the model to, for instance, create a record with
`prisma.book.create(...)`. Both of these things are derived from the model
name: `Book`.

The other thing that is derived from the model name is the name given to the
underlying database table. So you end up with a table called `Book`. You may,
however, prefer a table naming convention where this one would be named `books`
(snake_case and pluralized).

To achieve that, you have to manually override the table name with [the `@@map`
directive](https://www.prisma.io/docs/orm/reference/prisma-schema-reference#map-1).
Add it toward the bottom of the model like so:

```
model Book {
  id               BigInt   @id @default(autoincrement()) @db.BigInt
  title            String
  author           String
  publication_year Int
  created_at       DateTime @default(now())
  updated_at       DateTime @updatedAt

  @@map("books")
}
```
