# Use Active Window With BufExplorer

I often use [BufExplorer](https://github.com/jlanzarotta/bufexplorer) within
long-running Vim sessions as a way of quickly jumping between the various
buffers in my buffer list. After working with one buffer, I use `<leader>bs`
to open BufExplorer, move my cursor to the next buffer of interest, and hit
enter to open it in place of the current buffer. This is the default
behavior at least.

With this setting toggled on, BufExplorer will open buffers in the _active
window_. The _active window_ is the window that was active before
BufExplorer was opened. If this setting is toggled off, BufExplorer doesn't
bother finding the active window, it just opens the buffer up in place of
itself in whatever split window was created for itself.

This setting can be toggled within the BufExplorer window by hitting `f`. It
will toggle between `Locate Buffer` and `Don't Locate Buffer`. I prefer the
default of `Locate Buffer`.

h/t Vidal Ekechukwu
