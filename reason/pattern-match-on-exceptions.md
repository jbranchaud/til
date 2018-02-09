# Pattern Match On Exceptions

[ReasonML](https://reasonml.github.io/) supports [powerful pattern
matching](https://reasonml.github.io/docs/en/pattern-matching.html) through
the `switch` statement.  This even includes pattern matching against
exceptions that may arise as a way of catching and handling those
exceptions.

```reason
let values: list(int) = [1,3,5,7,9];

let getValue = (list, index) => {
  switch (List.nth(values, index)) {
  | value => value
  | exception Failure("nth") => 0
  | exception Invalid_argument("List.nth") => 0
  };
};

getValue(values, 0); /* 1 */
getValue(values, 1); /* 3 */
getValue(values, 5); /* 0 */
getValue(values, -1); /* 0 */
```

The [`List.nth` docs](https://reasonml.github.io/api/List.html) detail what
happens in the two kinds of out of bounds scenarios that would raise an
error -- `Failure` and `Invalid_argument`. You can pattern match against
those by declaring the respective cases as exception instances and then
returning the desired values in response.

[source
code](https://reasonml.github.io/en/try.html?reason=DYUwLgBAbghsCuIDOAuCwCWSwAoMDswBKCAXggG0BGAGgGYaBWGgdhoE4BdAbgChfQkAObgAanERkIOTNhoQCAExAAPEqQB8EAN68IEJAHcMYAMYALaQBksYAHSFzOWAmTylqoiV36APtAkQMi0XRD0If1VTEAAHMAwAe3wIADEYDAQAJxAcACJHXPUtAAZwyJVouMTkgEl8FwxFAH0YTKF4AFsQQjybbAcwc0LgiFL9AF8+Sf4AKSQ7YAShHBEwcVdnQKR5Yq8+OYWllbFAzddtiCo93gPF5dX1xDPEC8Zr26OH09C3CABaK5EbhAA)
