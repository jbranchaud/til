# Re-indenting Your Code

If you have pasted some poorly formatted code or you've written a portion
of code in a way that mangled the indentation, you can quickly re-indent
that code for you. Or at least do its best to try and indent it correctly.

Make a visual selection of the code that you want to re-indent and then
hit `=`.

For instance, this ruby code

```ruby
if this_thing
p something
else
p nothing
end
```

will be indented by Vim as

```ruby
if this_thing
  p something
else
  p nothing
end
```

See `:h =` for more details on how vim decides what formatting and
indenting it will do.

h/t [Chris Erin](https://twitter.com/MCNormalMode)
