# Extract Object Type Keys Into A Union Type

The [object type](https://www.typescriptlang.org/docs/handbook/2/objects.html)
is a way of grouping types together to represent something more complex. For
instance, it may be used to represent the types of events that a reducer can
process.

```typescript
interface GlobalReducerEvent {
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

From this object type, I can extract a [union
type](https://www.typescriptlang.org/docs/handbook/2/everyday-types.html#union-types)
of the keys, perhaps as part of building [a more useful type
mapping](https://dev.to/jbranchaud/breaking-down-a-complex-mapped-type-in5).

This can be done with
[`keyof`](https://www.typescriptlang.org/docs/handbook/2/keyof-types.html).

```typescript
type EventTypes = keyof GlobalReducerEvent;
//=> 'ADD_TODO' | 'LOG_IN' | 'DELETE_TODO'
```

The `keyof` type operator extracts each key of the `GlobalReducerEvent` into a
union type. This can be mixed into other types in all sorts of interesting
ways.
