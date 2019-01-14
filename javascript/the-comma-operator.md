# The Comma Operator

I was surprised to see the result of this line of code:

```javascript
const what = (1,2,3,4);
console.log(what); //=> 4
```

I asked around on
[twitter](https://twitter.com/jbrancha/status/1084936559323951105) and
learned that the syntax construct at play here is the [comma
operator](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Comma_Operator).

> The comma operator evaluates each of its operands (from left to right) and
> returns the value of the last operand.

And that is why `what` gets bound to `4`.
