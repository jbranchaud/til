# Help For Non-Normal Mode Features

The majority of your time in vim will be spent in normal mode. You will
often look to the documentation for help on any number of commands and
bindings available in normal mode. For instance, to find out more about
*goto file*, you may do `:h gf`. And if you want to read more about
*yanking* lines of code, you may do `:h y`.

But what about commands and bindings that aren't found in normal mode? What
if you want to read about *yanking* text from visual mode? What if you want
to get more details on insert's x-mode? Doing `:h y` and `:h ctrl-x`,
respectively, won't do the trick because vim thinks you are talking about
normal mode bindings.

The docs for these and other non-normal mode features can be found by
prepending `i_` and `v_` to the binding in question.

To get at the docs for *yanking* from visual mode:

```
:h v_y
```

And to read up on insert's x-mode:

```
:h i_ctrl-x
```
