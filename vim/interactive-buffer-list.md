# Interactive Buffer List

The `:ls` command is a great way to see what buffers you currently have open
during a vim session. However, if you are trying to find and open a specific
buffer it can be tedious to have to find it in the list and then enter a
whole different command to move to it (e.g. `:b 10`).

The [`bufexplorer`](https://github.com/jlanzarotta/bufexplorer) plugin gives
you quick access to an interactive buffer list. By using `<leader>bs` and
`<leader>bv` you can open horizontally and vertically split windows,
respectively, that allow you to navigate through and open specific buffers
from your buffer list. This is a simple plugin you can add to your workflow
that can make working with a lot of buffers a bit more efficient.
