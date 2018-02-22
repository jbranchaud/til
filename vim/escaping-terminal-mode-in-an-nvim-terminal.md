# Escaping Terminal-Mode In An Nvim Terminal

A recent
[TIL](https://til.hashrocket.com/posts/iity78ly38-open-a-zsh-terminal-in-a-split-window-in-neovim)
by Chris Erin showed how to split open a terminal in a
[Neovim](https://neovim.io/) session -- `:sp term://zsh`.

The terminal is emulated into a Vim buffer which means that you can treat it
sort of like any other Vim buffer. You start in Normal mode. Once you use
any mapping that would transition you into Insert mode, you'll instead find
yourself in _Terminal_ mode. Terminal mode works just like any `zsh`
session (give `ls` a try).

Try hitting `<Esc>` though and you'll see that you stay in Terminal mode
instead of being transitioned back to Normal mode.

So how do you get back to Normal mode?

Hit `<Ctrl-\><Ctrl-n>`.

This is a pretty awkward key mapping though, so follow [the Nvim Terminal
docs](https://neovim.io/doc/user/nvim_terminal_emulator.html) and bring back
the Escape key.

```vimscript
:tnoremap <Esc> <C-\><C-n>
```
