# Jump Back To The Latest Jump Position

Any sort of jump motion, such as `gg` or `121G`, will be recorded in your
Vim session's jump list. If you'd like to return to the latest position in
your jump list, you can tap `''` within normal mode.

You can then tap `''` again and you'll be returned to the position you were
just at. This is great if you want to toggle back and forth between your
current position and the previous position.

If the latest jump position is not within the current buffer, then you will
be jumped to the initial cursor position at the top of the file.

You can learn more about this by reference `:help jump-motions`, `:help
jumplist`, and `:help ''`.

h/t Jake Worth
