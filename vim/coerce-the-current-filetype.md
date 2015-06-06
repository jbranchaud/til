# Coerce The Current Filetype

If Vim doesn't recognize the filetype of the currently edited file, I can
tell Vim what filetype to use. Consider, for instance, that I have a draft
of a markdown file with the name, `documentation.md.draft`. Vim will not
recognize this as a markdown file and will, thus, not apply markdown
syntax highlighting to that file. I can easily tell Vim to treat this as a
markdown file by setting its filetype:

```
:set filetype=markdown
```

Markdown syntax highlighting and other relevant options will now be applied
to the current buffer.

See `:h filetype` for more details.
