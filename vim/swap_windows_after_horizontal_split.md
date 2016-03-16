# Swap windows after horizontal split

Very often I split the window with `:AS` from [vim-rails](https://github.com/tpope/vim-rails/blob/34b2ae314c6269e74818b949dc3bff7a76d86088/doc/rails.txt#L169). But
the window are not in the order I want. I want main code on the top, test
below.

Simply to `Ctrl + w` then `J`.

From the [help](http://vimdoc.sourceforge.net/htmldoc/windows.html) :

```
						*CTRL-W_J*
CTRL-W J	Move the current window to be at the very bottom, using the
		full width of the screen.  This works like closing the current
		window and then creating another one with ":botright split",
		except that the current window contents is used for the new
		window.
```
