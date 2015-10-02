# Swapping Split Windows

Consider a scenario where you have a vim window that has been split
horizontally into two viewports. You'd prefer the top one to be on bottom
and the bottom one to be on top. You want to swap them.

If you are currently focused on the top viewport, then tell vim to move that
viewport down with `CTRL-w J`. As you might guess, moving the bottom
viewport up can be done with `CTRL-w K`. `J` and `K` mean down and up in
other contexts; vim is consistent with their meaning here.

Viewports of a vertical split can be swapped in the same sort of way. Use
`CTRL-w L` to move the left viewport to the right. Use `CTRL-w H` to move
the right viewport to the left.
