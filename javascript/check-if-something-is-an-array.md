# Check If Something Is An Array

The `Array` class has a function on it called
[`isArray()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/isArray)
which can be used to check if something is an array.

```javascript
> Array.isArray('Hello, World!');
// => false

> Array.isArray(['One', 2, [3]]);
// => true

> Array.isArray({ foo: 'bar' });
// => false

> Array.isArray([]);
// => true
```

The MDN docs provide an [example
polyfill](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/isArray#Polyfill)
if it is not natively available.

```javascript
if (!Array.isArray) {
  Array.isArray = function(arg) {
    return Object.prototype.toString.call(arg) === '[object Array]';
  };
}
```
