# Narrow The Type Of An Array To Its Values

When an array of string values is defined in a TypeScript context, the inferred
type will be `string[]`. That's because the values of an array can be
reassigned. The most precise TypeScript can be is to say that it is an array of
string.

```typescript
const actions = ['increase', 'decrease'];
// typeof actions => string[]
```

We can freeze the array with its values using `as const`, the [const
assertion](https://www.typescriptlang.org/docs/handbook/release-notes/typescript-3-4.html#const-assertions).
This doesn't actually _freeze_ the array, but it does mark it as `readonly` for
the TypeScript compiler.

That means we can lean on the compiler for a lot more specific feedback.
Consider for instance this `reducer` function.

```typescript
const actions = ['increase', 'decrease'] as const

const reducer = (action: typeof actions[number]) => {
  switch (action) {
    case 'increase':
      // do an increase
    case 'decrease':
      // do a decrease
    case 'submit': // TYPE ERROR, "submit" is not comparable to type 'increase' | 'decrease'
      // do a submit
    default:
      throw Error('Unrecognized action!')
  }
}

// TYPE ERROR, "submit" is not comparable to type 'increase' | 'decrease'
reducer('submit')
```
