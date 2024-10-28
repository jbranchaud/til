# Get Fields For Inserted Row

With Drizzle, we can insert a row with a set of values like so:

```typescript
await db
  .insert(todoItems)
  .values({
    title,
    userId,
    description,
  })
```

The result of this is `QueryResult<never>`. In other words, nothing useful is
coming back to us from the database.

Sometimes an insert is treated as a fire-and-forget (as long as it succeeds) or
since we know what data we are inserting, we don't need the database to
response. But what about values that are generated or computed by the database
-- such as an id from a sequence, timestamp columns that default to `now()`, or
generated columns.

To get all the fields of a freshly inserted row, we can tack on [the
`returning()` function](https://orm.drizzle.team/docs/insert#insert-returning)
(which likely adds something like [`returning
*`](https://www.postgresql.org/docs/current/dml-returning.html)) to the insert
query under the hood).

```typescript
await db
  .insert(todoItems)
  .values({
    title,
    userId,
    description,
  })
  .returning()
```

This will have a return type of `Array<type todoItems>` which means that for
each inserted row we'll have all the fields (columns) for that row.

Alternatively, if we just need the generated ID for the new row(s), we can use
a partial return like so:

```typescript
await db
  .insert(todoItems)
  .values({
    title,
    userId,
    description,
  })
  .returning({ id: todoItems.id })
```
