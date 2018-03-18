# String Interpolation With Quoted Strings

Stapling strings together with the `++` operator can be tedious and clunky.
If you have string variables that you'd like to interpolate, you can piece
them together much more easily using [quoted
strings](https://reasonml.github.io/docs/en/string-and-char.html#quoted-string).

We can get close to a solution with the standard quoted string syntax.

```reason
let greeting = (greetee) => {
  {|Hello, $(greetee)!|}
};

Js.log(greeting("World")); // => "Hello, $(greetee)!"
```

This isn't quite right though. We have to take advantage of a preprocessing
hook provided by
[Bucklescript](https://bucklescript.github.io/docs/en/common-data-types.html#interpolation).
The `j` hook supports unicode and allows variable interpolation.

```reason
let greeting = (greetee) => {
  {j|Hello, $(greetee)!|j}
};

Js.log(greeting("World")); // => "Hello, World!"
```

To use this pre-processor we have to include `j` in the quoted string like
so `{j|...|j}`.

See a [live example
here](https://reasonml.github.io/en/try.html?reason=DYUwLgBA5gTi4EsB2UIF4IApbzPAlOgHwQDeAUBGQFYA+AEiMMAPYA0EAJNnOAQIS1qAX3LCA3OXIApAM4A6VlB65kygEQB1FjGAATdfnzigA).
