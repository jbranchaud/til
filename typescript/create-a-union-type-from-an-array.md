# Create A Union Type From An Array

Let's say we have an array of _actions_ that our program knows how to handle.

```typescript
// inferred type: string[]
const actions = ['increase', 'decrease', 'reset'];
```

The inferred type of that array is `string[]` which is a pretty wide type. We
can't do much with it. We can prevent the widening of this array's inferred
type using `as const`.

```typescript
// inferred type: readonly ['increase', 'decrease', 'reset']
const actions = ['increase', 'decrease', 'reset'] as const;
```

That inferred type is specific enough that we can do something with it, like
create a union type.

```typescript
const actions = ['increase', 'decrease', 'reset'] as const;

type Actions = typeof actions[number];
//=> type Actions = 'increase' | 'decrease' | 'reset'
```

We could use the `Actions` type to specify that a function only takes values
that correspond to known actions, for instance.

[source](https://bobbyhadz.com/blog/typescript-create-union-type-from-array)
