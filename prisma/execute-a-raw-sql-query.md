# Execute A Raw SQL Query

[Prisma](https://www.prisma.io/) with TypeScript acts as a powerful
[ORM](https://en.wikipedia.org/wiki/Object%E2%80%93relational_mapping) for
interacting with your database. However, not every kind of query that you may
need can be represented with the API generated from your schema. For instance,
certain tables might be ignored in your `prisma.schema` file. Or you may want
to hand-craft a query for performance or ergonomics reasons.

Like any good ORM, Prisma provides an escape hatch for this kind of situation
with the
[`$queryRaw`](https://www.prisma.io/docs/concepts/components/prisma-client/raw-database-access#queryraw)
tag function.

```typescript
function getExpiresIn({ email }) {
  const prisma = new PrismaClient()

  const result: Array<object> = await prisma.$queryRaw`
    select
      id,
      code,
      date_trunc('days', expires_at - now())::varchar as expires_in
    from tickets
    where email = ${email}
  `

  // result
  // => [{ id: 123, code: 'abc123', expires_in: '3 days' }]

  return result
}
```

This runs the raw SQL in the template literal against the database. The result
is returned as an array of objects with key-value pairs for each selected
value.

Writing the SQL query myself, in this case, means I can take advantage of
database (Postgres) specific features (e.g.
[`date_trunc`](https://www.postgresqltutorial.com/postgresql-date-functions/postgresql-date_trunc/)
and [interval
math](https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-interval/)).

[source](https://www.prisma.io/docs/concepts/components/prisma-client/raw-database-access)
