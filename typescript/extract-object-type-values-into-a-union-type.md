# Extract Object Type Values Into A Union Type

Let's say we have an object type like the following:

```typescript
type GlobalReducerEvent = {
    ADD_TODO: {
        text: string
    }
    LOG_IN: {
        email: string
    }
    DELETE_TODO: {
        todo_id: number
    }
}
```

We can use the [indexed access
type](https://www.typescriptlang.org/docs/handbook/2/indexed-access-types.html)
to access the value indexed at one the type keys. This works a lot like
JavaScript's object access.

```typescript
type AddTodoType = GlobalReducerEvent['ADD_TODO'];
/*
type AddTodoType = {
  text: string
}
*/
```

Where it gets more interesting and differs from JavaScript's object access is
when we do an indexed access of a union type.

```typescript
type TypesForEvents = GlobalReducerEvent[keyof GlobalReducerEvent];
/*
type TypesForEvents = {
  text: string
} | {
  email: string
} | {
  todo_id: number
}
*/
```

The result is a union of each of the values whose keys had matches in the
union.

Where this gets more interesting and useful is when we use it as part of a
mapped type like I explore in [Breaking Down a Complex Mapped
Type](https://dev.to/jbranchaud/breaking-down-a-complex-mapped-type-in5).
