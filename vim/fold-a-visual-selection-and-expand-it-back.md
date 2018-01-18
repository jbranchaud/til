# Fold A Visual Selection And Expand It Back

If I visually select a series of lines -- say the open and close tags of a
large `div` in an HTML file I am reading through -- and then hit `zf`, it
will be _folded_ into a single line. That line will list how many lines are
included in the fold as well as the content of the first line of the fold.

If I later come back to that fold and want to expand it again, I can hit
`zd` to delete (or undo) the fold.

To do this, you'll want to make sure your `foldmethod` is set to `manual`.
This can be done by running the following command:

```
:set foldmethod=manual
```

See the vim helpfiles (`:h fold`) for more details.
