# Link A Scalar To An Array

`Zsh` has a builtin command `typeset` that does a variety of things. When given
the `-T` flag and the names of a scalar and an array, it will link them
together so that a change to one is reflected in the other.

The scalar is a string of values delimited by a colon (`:`). The array is an
array that can be interacted with using array operations like append (`+=`).

```bash
$ typeset -T FOO foo

$ echo $FOO


$ export FOO="one:two"

$ echo $foo
one two

$ foo+=three

$ echo $FOO
one:two:three
```

Notice `FOO` is initially empty. I then `export` it to overwrite it with two
values delimited by a colon. Since `foo` is automatically kept in sync, I can
`echo $foo` and see those values displayed as an array. I can then append a
third value using an array operation on `foo`. The update will be automatically
reflected in `FOO`.

`Zsh` does this under the hood for `PATH` and `path` which is why you can [add
to the path via the path array](add-to-the-path-via-path-array.md).

See `man zshbuiltins` for more details.

[source](http://devlib.symbian.slions.net/s3/GUID-D87C96CE-3F23-552D-927C-B6A1D61691BF.html)
