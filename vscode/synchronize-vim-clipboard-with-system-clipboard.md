# Synchronize Vim Clipboard With System Clipboard

When I use Vim-mode in VSCode, I _yank_ text onto the Vim clipboard by visually
selecting some text and hitting `y`. Then I can move the cursor somewhere else
in the file (or another file in VSCode) and _paste_ it by hitting `p`.

But what if I want the thing I yanked from a file to be pasted into another
program, like Chrome? Or if I've copied some text from another program and I
want to paste it into a file in VSCode?

This cross-program copy and pasting is what the _system clipboard_ on your
operating system is for. By default, the Vim clipboard is separate from the
system clipboard. I personally prefer for them to be one and the same.

To achieve this, I added the following line to my VSCode config in
`settings.json`:

```json
{
  "vim.useSystemClipboard": true
}
```

It takes a little getting used to having them integrated, but I've done it for
so long that it is muscle memory. It's hard to not have them integrated now.
It's even better when I have a clipboard history tool like Raycast available
for accessing past clipboard values.
