# Absolute And Relative Line Numbers

By default, vim uses absolute line numbering. This can be turned off with
`set nonumber` or more concisely `set nonu`. Turn it back on with `set nu`.
Get more details at `:h number`.

Vim also supports relative line numbers. If you'd rather use relative line
numbers, first turn off absolute line numbers (`set nonu`) and then turn on
relative line numbers with `set relativenumber`. Shave off some characters
with `set rnu`. As you might expect, you can turn off relative numbering
with `set nornu`.

See `:h relativenumber` for more details.
