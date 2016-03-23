# Accessing Arguments To A Function

The `arguments` object is available within any JavaScript function. It is
an array-like object with all of the arguments to the function. Even if not
all of the arguments are referenced in the function signature, they can
still be accessed via the `arguments` object.

```javascript
function argTest(one) {
  console.log(one);
  console.log(arguments);
  console.log(arguments[1]);
}

argTest(1);
// 1
// [1]
// undefined

argTest(1, 'two', true);
// 1
// [1,'two',true]
// 'two'
```

See the [Arguments object
docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/arguments)
on MDN for more details.

h/t Dorian Karter
