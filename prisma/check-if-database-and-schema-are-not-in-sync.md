# Check If Database And Schema Are Not In Sync

The [`prisma migrate
diff`](https://www.prisma.io/docs/orm/reference/prisma-cli-reference#migrate-diff)
command is a versatile tool that can be used to check if there is a difference
between two sources. In this case, we want to check if our database is in sync
with the `schema.prisma` file for our project.

If we have made changes to the schema file, but haven't yet migrated or pushed
those changes to our local database, then we want to be notified of that
mismatch.

We'll point at the schema file with `--to-schema-datamodel` and at our local
database with `--from-url`.

```bash
❯ npx prisma migrate diff \
    --to-schema-datamodel ./prisma/schema.prisma \
    --from-url mysql://root@localhost:3309/kcd-products

[*] Changed the `User` table
  [+] Added column `metadata`
```

In the case where there is a different, we see an output summary of the diff.

Let's say we've applied our changes (`prisma db push`) to our local database.
If we now run that same command again, we can see that no difference is
detected and our database is in sync with our schema.

```bash
❯ npx prisma migrate diff \
    --to-schema-datamodel ./prisma/schema.prisma \
    --from-url mysql://root@localhost:3309/kcd-products

No difference detected.
```
