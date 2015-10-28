# Match The Beginning And End Of Words

Often when doing a substitution for an exact word, say `user` to
`admin`, I will include spaces on either end of the regex pattern to avoid
unintentional replacements. For example, I may use something like

```
:%s/ user / admin /
```

in order to avoid a substitution like `username` to `adminname`.

In this case, the spaces can be replaced with zero-width regex characters
that match the beginning and end of a word. These are `\<` and `\>`,
respectively. Utilizing these, the previous substitution can be achieved
with

```
:%s/\<user\>/admin/
```

See `:h /\<` and `:h /\>` for more details.
