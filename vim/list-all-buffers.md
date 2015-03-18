# List All Buffers

The `:ls` command will list the buffers you have open. What vim doesn't tell
you though is that there are some unlisted buffers that it isn't displaying.
To see *all* of the buffers, you can use `:ls!`. According to the vim help
file:

> When the [!] is included the list will show unlisted buffers
> (the term "unlisted" is a bit confusing then...).

This reveals buffers for `netrw`, `:help` files, etc. This helps explain the
sometimes sporadic numbering that vim uses for buffers.
