# Using Optional Labeled Function Arguments

If you are constructing a function that takes some arguments, but one of
those arguments has a reasonable default value, then you can use an optional
labeled argument. Labeled arguments are those arguments prefixed with a `~`.
If you give the argument a default value, then it becomes optional.

```reason
let thing = (~a=1, b: int, c: int) => {
  a + b + c;
};
```

In this case `~a` is a labeled argument. It is also optional and will
default to `1` if not specified. The other two arguments, `b` and `c`, are
positional arguments and thus required in order for the function to
evaluate.

Here are two ways of using this function either by specifying `~a` or
excluding it so that it defaults to `1`.

```reason
thing(~a=2, 1, 1)
|> string_of_int
|> print_endline /* 4 */

thing(1, 1)
|> string_of_int
|> print_endline /* 3 */
```

See more details [here](https://reasonml.github.io/docs/en/function).
