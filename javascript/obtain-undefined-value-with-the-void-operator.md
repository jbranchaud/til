# Obtain Undefined Value With The Void Operator

The [`void`
operator](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/void)
takes any expression, evaluates it, and then results in the `undefined` value.
A common use of the `void` operator is to get the primitive `undefined` value
in a consistent way.

```javascript
> void(0);
undefined
```

This is handy for instances where you need to check if a value is `undefined`:

```javascript
function doSomething({ arg }) {
  if (arg === void 0) {
    throw new Error("arg is undefined 😱");
  }

  // ...
};
```
