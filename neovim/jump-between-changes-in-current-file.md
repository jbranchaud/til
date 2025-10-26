# Jump Between Changes In Current File

With the [gitsigns.nvim plugin](https://github.com/lewis6991/gitsigns.nvim) for
Neovim, I get some handy Git-related capabilities like gutter highlighting of
additions, deletions, and changes to lines in the current file. These contiguous
sections of modification to the versioned state of a file are called hunks.

Here are two mappings (in Lua) for gitsigns that allow me to jump to the next
(`]h`) or previous (`[h`) hunk in the current file.

```lua
---@type LazyKeysSpec[]
M.gitsigns_mappings = {

  -- Navigation
  {
    ']h',
    function()
      if vim.wo.diff then
        vim.cmd.normal { ']c', bang = true }
      else
        require('gitsigns').nav_hunk 'next'
      end
    end,
    desc = 'Next Hunk',
  },

  {
    '[h',
    function()
      if vim.wo.diff then
        vim.cmd.normal { '[c', bang = true }
      else
        require('gitsigns').nav_hunk 'prev'
      end
    end,
    desc = 'Prev Hunk',
  },
}
```

This is particularly useful when I've just opened a big file and I want to jump
directly to active changes in that file.

I got this mapping directly from [Dorian's
dotfiles](https://github.com/dkarter/dotfiles).
