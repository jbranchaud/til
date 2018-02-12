# Multi-Argument Functions As Syntactic Sugar

When writing a multi-argument function, like the following `adder` function:

```reason
let adder = (x, y) => x + y;

adder(2, 3); /* => 5 */
```

We are utilizing a syntactic sugar of the function syntax. The same function
can be written as such:

```reason
let adder = (x) => (y) => x + y;

adder(2, 3); /* => 5 */
```

As you can see, we can apply the function in the same way.

This is useful because it means we can partially apply (or _curry_) our
functions to create other functions.

```reason
let adder = (x, y) => x + y;
let twoAdder = adder(2);

twoAdder(5); /* => 7 */
```

[source
code](https://reasonml.github.io/en/try.html?reason=DYUwLgBAhgJjICcIF4IAoAeBKFA+dAnjsvhhANQQEDcAULQFIDOAdMAPYDmas8CaAFgA0EAKxYsdWqEhgA7uwCCcRCmgr+AJkn1mbLmnlKNacZKA)
