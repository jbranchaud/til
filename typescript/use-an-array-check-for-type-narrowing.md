# Use An Array Check For Type Narrowing

If you are typing a concatenation function for melding two values together into
a single array, you may end up with a function signature like this:

```typescript
type ConcatFunction = (value: any | any[], array: any[]) => any[];
```

That first argument can be an individual value or an array of values. You'll
need to handle both scenarios in the function implementation. Using the
[`Array.isArray`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/isArray)
function as a _type guard_, you can check differentiate between those two
cases.

```typescript
const concat: ConcatFunction = (value, array) => {
    if(Array.isArray(value)) {
        return [...value, ...array];
    } else {
        return [value, ...array];
    }
}

concat(true, [1,2,3]);
// [true, 1, 2, 3]

concat([1,2,3], ['a', 'b', 'c'])
// [1, 2, 3, 'a', 'b', 'c']
```

This is a form of [type
narrowing](https://www.typescriptlang.org/docs/handbook/2/narrowing.html).
