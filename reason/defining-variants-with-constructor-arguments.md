# Defining Variants With Constructor Arguments

In [Helping The Compiler Help Us With
Variants](https://github.com/jbranchaud/til/blob/master/reason/helping-the-compiler-help-us-with-variants.md),
I introduced the concept of variants with a basic example of how to define
and use one. The fun doesn't stop there.

We can take variants a step further by defining them with constructor
arguments.

```reason
type listActions =
  | Length
  | Nth(int);
```

The second variant is defined such that it is paired with some extra data --
a single `int` argument.

Here is how we use that variant in our code:

```reason
let performListAction = (l: list(int), action: listActions) => {
  switch(action) {
  | Length => List.length(l)
  | Nth(n) => List.nth(l, n)
  }
};

performListAction([7,8,9], Nth(1)); /* 8 */
performListAction([1,2,3], Length); /* 3 */
```

Our switch statement not only matches on that variant, but it makes the
`int` argument available as a value we can consume in that step of the
switch.

[source
code](https://reasonml.github.io/en/try.html?reason=C4TwDgpgBANglgZ2AQQMbDgewHYKgXgCgooAfKAGQmwHNgALYsqAOQYAo5tgBKAbkKEYEYFEgAnAGaZxAWwqIU6LNgJR2MAFyxFnbjwA0UAIbKc2+EjQYcCHgQB8UAN5MEAdzjBU9dqZvY9q4k5FS0DI6UigB0wuG+MDxM5Gy+gZEKSNHcCUaBTAC+hAUChABSCLGYNOwS0nKZSgHsANoA7AYAHAYAnAC6RqnsAIw8YwIVVTV1MvKK1iqtwwYATAYAzAOU1HT040A)
