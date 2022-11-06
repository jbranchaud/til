# Apply Separate Formatting With A Blank Line

Prisma's CLI includes a `format` command. When run, this will standardize the
layout of the `schema.prisma` file. This is variable based on the length of
column and attribute names.

You can exercise some control over the formatting and visually organize the
parts of a model by injecting blank lines between sets of statements.

Here is what a formatted model might look like with no blank lines:

```prisma
model Book {
  id              String   @id @default(uuid())
  title           String
  publicationDate DateTime
  author          Author   @relation(fields: [authorId], references: [id])
  authorId        String
  createdAt       DateTime @default(now()) @map(name: "created_at")
  updatedAt       DateTime @updatedAt @map(name: "updated_at")
}
```

All the types get aligned based on the longest column name.

Now, here is what it looks like if I use a blank line to separate all the
primary fields from the `createdAt` and `updatedAt`.

```prisma
model Book {
  id              String   @id @default(uuid())
  title           String
  publicationDate DateTime
  author          Author   @relation(fields: [authorId], references: [id])
  authorId        String

  createdAt DateTime @default(now()) @map(name: "created_at")
  updatedAt DateTime @updatedAt @map(name: "updated_at")
}
```

Notice how the second block of lines is aligned independent of the first.
