# Format The Current File Within Vim

I'm editing a `.re` file within Vim. I haven't yet wired up `refmt` to
something like [ALE](https://github.com/w0rp/ale) for automatic formatting
on save. By the time I'm done with my changes, indentation is a mess.

I can still take advantage of `refmt` to clean up my file.

```
:!refmt --in-place %
```

Running that command in Vim will cause the current file to be formatted.

How does it work?

It shells-out to `refmt` which does all the heavy lifting. The `--in-place`
flag means that the target file will be re-written by the formatted result.
The `%` is a handy Vim shorthand for the path and name of the current file.
