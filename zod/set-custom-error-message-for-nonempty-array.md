# Set Custom Error Message For Nonempty Array

Let's say we have the following schema that represents a team:

```typescript
const TeamSchema = z.object({
  name: z.string(),
  members: z.array(
    z.object({ firstName: z.string(), lastName: z.string() })
  )
})
```

If we want to enforce that a team must contain at least _one_ member in order
to be valid, we can chain the `nonempty` function on the `members` array.

```typescript
const TeamSchema = z.object({
  name: z.string(),
  members: z.array(
    z.object({ firstName: z.string(), lastName: z.string() })
  ).nonempty()
})
```

Then we can set a custom error message for when that _nonempty_ requirement is
violated by adding an object argument with a `message`:

```typescript
const TeamSchema = z.object({
  name: z.string(),
  members: z.array(
    z.object({ firstName: z.string(), lastName: z.string() })
  ).nonempty({
    message: 'A team must contain at least one member'
  })
})
```

Here is that schema in action, not the `message` in the error:

```typescript
TeamSchema.parse({ name: 'A-Team', members: [] })
// Error: [{
//   "code": "too_small",
//   "minimum": 1,
//   "type": "array",
//   "inclusive": true,
//   "exact": false,
//   "message": "A team must contain at least one member",
//   "path": [
//     "members"
//   ]
// }]
```

[source](https://github.com/colinhacks/zod#nonempty)
