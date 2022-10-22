# Run A Lua Statement From The Command Prompt

The `:lua` command is provided by Neovim as a way to execute a Lua _chunk_.

I can use it to, for instance, execute a print statement.

```
:lua print('Hello, World!')
```

I could print out something more interesting like the full path of the current
file using `vim.fn.expand` with `%`.

```
:lua print(vim.fn.expand('%'))
```

Or as the helpfiles point out, I can see the value of some expression by
including a preceeding `=`.

```
:lua =jit.version
```

See `:h :lua` for more details.
