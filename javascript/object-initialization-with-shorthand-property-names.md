# Object Initialization With Shorthand Property Names

If I have some variables:

```javascript
const one = 1,
  two = 2,
  three = 3;
```

and I'd like to initialize an object with them, I'll generally do something
like the following:

```javascript
const obj1 = {
  one: one,
  two: two,
  three: three
};
// Object { one: 1, two: 2, three: 3 }
```

That seems pretty standard, but with ES6 comes a feature called *shorthand
property names* which makes that look verbose and redundant. If you already
have properly named variables, they can be used as a short hand for both the
key name and variable value:

```javascript
const obj2 = {
  one,
  two,
  three
};
// Object { one: 1, two: 2, three: 3 }
```

See the [MDN Docs for Object
Initializer](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer)
for more details.
