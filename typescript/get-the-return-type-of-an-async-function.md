# Get The Return Type Of An Async Function

When working with TypeScript-first libraries like Prisma, you'll be working
with functions that have useful, but complex type signatures. The TypeScript
built-in [Utility
Types](https://www.typescriptlang.org/docs/handbook/utility-types.html)
make a big difference when working with these.

For instance, a function that makes a couple Prisma calls with join'ed data
will have a large return type that you can't easily recreate with imported
types from the Prisma client.

Given a function like this, we can start out extracting its return type with
the
[`ReturnType`](https://www.typescriptlang.org/docs/handbook/utility-types.html#returntypetype)
utility type, passing it the `typeof` the function as the generic.

```typescript
type FuncReturnType = ReturnType<typeof getPostsForUser>
```

A function like this is going to be async, so its return type will be wrapped
in a promise. We can "unwrap" the promise with
[`Awaited`](https://www.typescriptlang.org/docs/handbook/utility-types.html#awaitedtype).

```typescript
type FuncReturnType = ReturnType<typeof getPostsForUser>
type ResolvedFuncReturnType = Awaited<FuncReturnType>
```

We are often querying for lists of things, so the result will be an array of
the type we are interested in. We can extract the type of an array with
`[number]`.

```typescript
type FuncReturnType = ReturnType<typeof getPostsForUser>
type ResolvedFuncReturnType = Awaited<FuncReturnType>
type PostType = ResolvedFuncReturnType[number]
```

Putting it all together into a single line looks like this:

```typescript
type Post = Awaited<ReturnType<typeof getPostsForUser>>[number]
```

[source](https://twitter.com/jbrancha/status/1603505456458207232)
