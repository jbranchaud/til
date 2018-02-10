# String Interpolation With Integers And Sprintf

ReasonML's [`Printf`](https://reasonml.github.io/api/Printf.html) module
comes with a number of functions for formatting values of various types. The
`sprintf` function allows for string interpolation.

```reason
let red = 64;
let green = 256;
let blue = 128;
let alpha = 1;

let color =
  Printf.sprintf("rbga(%i, %i, %i, %i)", red, green, blue, alpha);

Js.log(color);
```

It functions the same as `fprintf` but instead of outputting the result to
some channel, it returns a string. It enforces type checking as well -- the
`%i` is specifically for integers, so using that with a type other than an
integer will result in a compilation error.

See the [`Printf`](https://reasonml.github.io/api/Printf.html) docs for more
details.

[source code](https://reasonml.github.io/en/try.html?reason=DYUwLgBATiAmEF4IDYAsBuAUKSBzGIAdohAEwCsyWOEARsAK4gkCMpAHNeBAIbAAOACx6ss2bgGMA9sClREmCBAAKUAJaEwAMwB0AZ37rNWgBQAiKLVw8TAUjUAaCPacvnagJRmnMWE-wgRE70TE58QjweYgBSejqyuCbSslBRQA)
