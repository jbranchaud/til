# Specify Alternate Location For Prisma Schema

By default, Prisma looks for a schema in one of two locations:

- `./prisma/schema.prisma`
- `./schema.prisma`

If it isn't in one of those two spots, then you'll get an error.

You can manually specify an alternate location. One way is to use the
`--schema` flag with all `prisma` commands. A less tedious approach
([introduced in this PR](https://github.com/prisma/prisma/pull/3566)) is to
specify the location in your `package.json`.

```json
{
  "prisma": {
    "schema": "../../packages/database/prisma/schema.prisma"
  }
}
```

This is handy in situations where your database schema and utils are packaged
up separately, like in a monorepo. Here is an example of [a monorepo
referencing a prisma schema in a separate
package](https://github.com/skillrecordings/products/blob/b10dece7170abcb9076221c0863549e2291541ae/apps/testingaccessibility/package.json#L201-L203).

[source](https://www.prisma.io/docs/concepts/components/prisma-schema#prisma-schema-file-location)
