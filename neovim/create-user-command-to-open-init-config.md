# Create User Command To Open Init Config

I'm experimenting with a fresh Neovim configuration using
[kickstart](https://github.com/nvim-lua/kickstart.nvim). That means I'm
frequently navigating to my `init.lua` file to add and adjust things that I
find are missing from my workflow.

I got tired of typing out the path—in my case `~/.config/nvim/init.lua`—every
single time I wanted to edit it. So, I typed out that path one last time so
that I could add a custom user command.

```
-- Open this config file
vim.api.nvim_create_user_command(
  'Config',
  "e ~/.config/nvim/init.lua",
  {bang = true, desc = "Open init.lua Neovim config"}
)
```

This uses [the lua command
API](https://neovim.io/doc/user/api.html#api-command) to create a user-defined
command.

When I invoke `:Config` from the Neovim command prompt and hit enter, Neovim
will effectively replace that command with the second argument to that command
— `:e ~/.config/nvim/init.lua`. Which opens me up to the config file.
