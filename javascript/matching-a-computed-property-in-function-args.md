# Matching A Computed Property In Function Args

The [computed property name](http://es6-features.org/#ComputedPropertyNames)
feature of ES6 allows you to reference a variable in object assignments and
destructurings. This syntax is flexible enough that it can be used in the
arguments portion of a function declaration. In fact, it can even be matched
against another argument -- allowing the creation of some handy, yet terse
functions.

```javascript
const get = (key, { [key]: foundValue }) => foundValue;
```

Notice that the first argument, `key`, will match against the computed
property name in the second argument. The `foundValue` will correspond to
whatever `key` maps to in the given object.

This `get` function can then be used like so.

```javascript
const stuff = { a: 1, b: 2, c: 3 };

console.log("Get a:", get("a", stuff)); // Get a: 1
console.log("Get d:", get("d", stuff)); // Get d: undefined
```

h/t
[@sharifsbeat](https://twitter.com/sharifsbeat/status/1084235020183748610)
