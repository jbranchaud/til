# Configure Max String Print Length For Delve

During a [Delve](https://github.com/go-delve/delve) debugging session, we can
print out the value of a given variable with the `print` command. Similarly, we
can see the values of all local variables with the `locals` command.

Whenever Delve is printing out strings and slices, it will truncate what it
displays to 64 characters (or items) by default.

```go
(dlv) print diagnostics.Solutions[0]
"295743861\n431865972\n876192543\n387459216\n612387495\n549216738\n7635...+25 more"
```

This can be overridden by [changing the `config` of
`max-string-len`](https://github.com/derekparker/delve/blob/237c5026f40e38d2dd6f62a7362de7b25b00c1c7/Documentation/cli/expr.md?plain=1#L59)
to something longer. In my case here, all I need are about 90 characters to
display my full string, so run `config max-string-len 90` from the `dlv`
session.

```go
(dlv) config max-string-len 90
(dlv) print diagnostics.Solutions[0]
"295743861\n431865972\n876192543\n387459216\n612387495\n549216738\n763524189\n928671354\n154938627"
```

Now I can see the entire string instead of the truncated version.

[source](https://stackoverflow.com/a/52416264/535590)
