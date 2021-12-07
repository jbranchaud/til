# Check If A Number Is Positive Or Negative

The
[`Math`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math)
module has a handy function for checking if a number is _positive_ or
_negative_. Or _zero_, for that matter.

It is
[`Math.sign`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/sign).

```javascript
> Math.sign(5)
1

> Math.sign(-5)
-1

> Math.sign(0)
0
```

Any positive number will result in `1`. Any negative number will result in
`-1`. If the number happens to be `0`, then `0` will be returned.

This function goes real well with a switch statement.

Note also that anything that isn't a number will result in `NaN`.

```javascript
> Math.sign("one")
NaN
```
