# Paste A Register From Insert Mode

Generally pasting a register is done from Normal mode using `p` or something
like `'1p` (the former pasting from the default register, `0`, and the
latter pasting from register `1`). Vim also allows you to paste from a
register without leaving Insert mode. By hitting `CTRL-R` and then the name
of the register, Vim will insert the contents of the register in front of
the cursor.

For example, to paste from the default register from Insert mode, hit
`CTRL-R 0`.

Note, mappings and abbreviations will not be applied to the inserted text.

See `:h i_CTRL-R` for more details.

h/t Chris Erin
