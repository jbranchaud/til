# for...in Iterates Over Object Properties

I don't reach for _for loops_ very often, so when I needed one recently I
thought I'd check out the newer `for...in` construct. It didn't behave quite
how I was expecting. I thought it would iterate over the values in the
target list, instead it seemed to be iterating over the indices.

The [MDN
docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/for...in)
explain what is going on:

> The `for...in` statement iterates over all non-Symbol, enumerable properties
> of an object.

An array is an object whose properties are the indices of the values stored
in the array.

```javascript
const fruits = ["apple", "banana", "orange"];
for (let fruit in fruits) {
  console.log(fruit, fruits[fruit]);
}
// => "0" "apple"
// => "1" "banana"
// => "2" "orange"
```

The iteration value wasn't what I was looking for, but in this case I can
use it to access the value from the list. I'd be better off using a standard
_for loop_ though.
