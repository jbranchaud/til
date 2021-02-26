# Rotate The Orientation Of Split Windows

Let's say you have a vim session going with a single window/buffer open. If you
were to then open another file with the split command (e.g. `:sp README.md`),
then you'd have a horizontal split. With one file above and one file below.

You can rotate the orientation of the split to be a vertical split with one
file on the left and another on the right. You can do this with a _Window
Command_—`Ctrl-W H` (that's `ctrl-w` and then capital `H`).

If you want to go the other direction—from a vertical split to a horizontal
split—you can use `Ctrl-W J` (that's `ctrl-w` and then capital `J`).

This trick only works when there is a split between two windows. When
additional splits are involved, it will rotate the focused window to that
orientation and leave the others stacked in their current orientation.

See `:h CTRL-W` for more details on these and other Window Commands.
