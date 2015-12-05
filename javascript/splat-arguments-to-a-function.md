# Splat Arguments To A Function

Often times you have a function that takes a certain set of arguments. Like
the following `adder` function:

```javascript
var adder = function(a,b,c) {
  return a + b + c;
};
```

But you are left trying to pass in arguments as an array (e.g. `[1,2,3]`).
You want to be able to *splat* the array of arguments so that it matches the
function declaration. This can be done by using `apply`.

```javascript
> adder.apply(undefined, [1,2,3])
6
```
