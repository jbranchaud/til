# Set End Of Line Markers

Vim has a number of invisible characters that you can set.
One of those characters is the end of line (`eol`) character.
Whatever character you
set this to will appear at the end of each line in your file. This is great
for highlighting extra whitespace at the end of a line that would otherwise
appear invisible.

Set the `eol` invisible character like so

```
:set listchars=eol:¬
```

or append it to the existing list of invisible characters like so

```
:set listchars+=eol:¬
```

See `:h listchars` to see what other invisible characters you can set.
