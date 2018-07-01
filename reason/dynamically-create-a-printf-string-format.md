# Dynamically Create A Printf String Format

Formatting a string with `Printf` requires defining a format for that
string.

```reason
let str = Printf.sprintf("%6s", "dope");
/* str => "  dope" */
```

The _format_ is the first argument. At compile-time it is interpreted as a
`format6` type value.

So, what if you want a dynamically created _format_ value? Simply
concatenating some strings together won't do it because then the type will
be `string` and that's not going to compile.

The [`Scanf.format_from_string`](https://reasonml.github.io/api/Scanf.html)
function can help.

```reason
let some_num = 6;
let format_str = "%" ++ string_of_int(some_num) ++ "s";
let format = Scanf.format_from_string(format_str, "%s");

let str = Printf.sprintf(format, "dope");
/* str => "  dope" */
```

We can convert our string that has the appearance of a format into an actual
`format6` type. To do this, we have to tell `format_from_string` what types
each of the formats is going to have -- hence the second argument `%s`.

[source](https://twitter.com/rickyvetter/status/1013476235253436417)
