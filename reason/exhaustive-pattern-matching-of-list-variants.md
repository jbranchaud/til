# Exhaustive Pattern Matching Of List Variants

ReasonML's `switch` expression allows for powerful pattern matching. When
using `switch` to pattern match against a list, the compiler will be sure to
warn you if you haven't accounted for all variants of a list.

```reason
let getFirst = (numList: list(int)): int => {
  switch(numList) {
  | [first, ...rest] => first
  };
};
```

> this pattern-matching is not exhaustive. Here is an example of a value
> that is not matched: []

The compiler knows that a list can either be 1) empty (`[]`) or 2) contain
at least one value and another list (`[a, ...rest]`). To ensure all variants
are accounted for, we can include the `[]` case in our switch.

```reason
let getFirst = (numList: list(int)): int => {
  switch(numList) {
  | [] => -1
  | [first, ...rest] => first
  };
};
```

[source
code](https://reasonml.github.io/en/try.html?reason=DYUwLgBAdgrgtgIxAJwM4C4LAJarACmyjAEoIBeCAbQDYAaABjvvoEYBdAbgChvRIA5uABi2NJEr5YcADK4wmHHkLESJTEQkA+CAG9uECKgDu2MAGMAFlPhy8ZfYYA+1AGZi8dCADpfyEHjsFDru4gYQAL48UbwAUqjewAD2AvhCYKLiNogoqGqcQA)
