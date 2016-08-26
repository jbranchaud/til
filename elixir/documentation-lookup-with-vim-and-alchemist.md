# Documentation Lookup With Vim And Alchemist

_Which argument position is the accumulator for `Enum.reduce/3`?_

_How does `group_by` work?_

I find myself fairly frequently jumping from vim to Chrome to do Google
searches for Elixir standard lib documentation. It gets the job done, but it
is kinda slow and I'd prefer to avoid the context switch.

With [alchemist.vim](https://github.com/slashmili/alchemist.vim), Elixir
documentation lookup is at your finger tips. Just move the cursor over the
module or function you are curious about and hit `K` (from normal mode).

Curious about `Enum.reduce`? Type it out in your current Vim buffer, move
the cursor over it, and hit `K`.
