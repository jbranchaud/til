# Reference The Full Match In The Replacement

The `&` can be used in the replacement part of a `sed` expression as reference
to the string match for this iteration of the expression. The occurrence of `&`
will be replaced with that entire match.

As the `sed` man page puts it:

> An ampersand (“&”) appearing in the replacement is replaced by the string
> matching the RE.

I made use of this recently with [a `sed` expression that was evaluating a list
of filenames that I wanted to construct into a sequence of `mv`
commands](unix/rename-a-bunch-of-files-by-constructing-mv-commands.md). I needed
the filename that I was matching on to appear as the first argument of the `mv`
command I was constructing.

Here is what that looks like:

```bash
$ ls *.pdf |
  sed 's/\(..\)\(..\)\(..\) Statement\.pdf/mv "&" "20\3-\1-\2-statement.pdf"/'
```

Notice right after `mv` in literal quotes is the `&`. That will be replaced in
the resulting replacement with the full matching string of the regular
expression in the first part of the sed statement (`s/<RE>/`).
