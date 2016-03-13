# Immutable Remove With The Spread Operator

ES6 introduces the [spread
operator](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_operator)
which allows you to expand arrays in place for function calls, array
composition, array destructuring, etc. One thing the spread operator allows
you to concisely do with array composition is perform immutable operations
on arrays. For instance, to remove an item from an array by index, you can
throw together the following function.

```javascript
const remove = (items,index) => {
  return [...items.slice(0,index),
          ...items.slice(index+1,items.length)];
};

const list = [1,2,3,4,5];
remove(list, 2);
// [1,2,3,4]
list
// [1,2,3,4,5]
```

It only took a couple lines of code and immutability is baked in.

There may be a couple edge cases that are not handled in this solution (e.g.
`remove(list, -1)`), but you get the general idea.
