# Grepping Through The Vim Help Files

Trying to look up the help file for a Vim feature, but you cannot quite
remember the right keyword? Use `:helpgrep`. With `:helpgrep`, you can
search across all of the Vim help files for not just the specific keywords,
but any pattern of text. For instance, if you want to find where
`substitution` is mentioned in the help files, try:

```
:helpgrep substitution
```

It makes a list of all occurrences in the quick fix window and then opens up
a split with the cursor on the line of the first occurrence. You can then
hit `:copen` to see the rest of the entries.

See `:h helpgrep` for more details.
