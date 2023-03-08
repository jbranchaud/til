# Add Generic Typing To An Anonymous Function

A common pattern, especially when dealing with collections of data (read:
arrays), is to have a function that can transform an array of any type of data.
In order to keep this kind of function general-purpose and have it preserve
types, we'll need to use generics.

For an anonymous function to work with a generic type, it needs to open with a
signature for the generic type:

```typescript
<T>() => {}
```

With that in mind, we can write a function that accepts an array of type `T`,
does something to that collection, and then returns an array of type `T`.

For instance, here is a function that takes the first `n` elements from the
array and returns them.

```typescript
const take = <T>(arr: Array<T>, n: number): Array<T> => {
  return arr.slice(0, n)
}
```

This both enforces and preserves the type of the array. It works well for
situations where the array is a bunch of complex objects with specific types
like we'd get from a Prisma query.
