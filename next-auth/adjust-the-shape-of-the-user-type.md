# Adjust The Shape Of The User Type

Let's say we want extra attributes on our `user` object that gets passed around
as part of authentication with [NextAuth.js](https://next-auth.js.org/). If
we're using a database adapter, it's because we have added columns to the
`User` table. Or it may be that we are adding extra attributes to the body of
the JWT token.

Either way, we need the underlying `User` type (rather, interface) to reflect
that.

Within a `declare module` block for NextAuth, we can define a `User` interface
with any additional properties that we want.

This adds `roles` as a required `string` type.

```typescript
declare module "next-auth" {
  interface User {
    // ...other properties
    roles: string;
  }
}
```

Some natural places to add this declaration are in the auth file itself (e.g.
`src/server/auth.ts`). Or we can put it in a dedicated top-level
`next-auth.d.ts` file as long as we tell our `tsconfig.json` to include it:

```json
{
  ...
  "include": [
    "src/**/*",
    "process.d.ts",
    "next-auth.d.ts"
  ],
  ...
}
```
