# Spread The Rest With ES6

The spread operator provided by ES6 is a powerful syntactic feature. One way
it can be used is to capture the _rest_ of an object or array in a variable.

```javascript
const pokemon = ["Charmander", "Squirtle", "Bulbasaur"];
const [first, ...rest] = pokemon;

console.log("Remaining: ", rest); // Remaining: ["Squirtle", "Bulbasaur"]

const gymLeaders = {
  brock: "rock",
  misty: "water",
  surge: "electric",
  erika: "grass"
};
let { brock, erika, ...otherLeaders } = gymLeaders;

console.log(otherLeaders); // Object {misty: "water", surge: "electric"}
```

Using this spread destructuring we can capture the remaining parts of an
array or object in a variable. We can also use this syntax in a function
signature to grab specific items from an incoming object argument without
losing track of the rest -- this is especially useful in React.js
development when dealing with incoming props.

This is a [stage 4
feature](https://github.com/tc39/proposal-object-rest-spread) and may not be
available in your particular environment.

See a [live example here](https://codesandbox.io/s/ov2xr1o12y).
