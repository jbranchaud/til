# Switch Moving End Of Visual Selection

When I go into character-wise visual selection mode, one end of the visual
selection is fixed while I move my cursor around to define the other end of it.

Let's say I've arranged a visual selection that encompasses several lines of my
file. And then I realize that the fixed front-end of my visual selection is off
by a bit. Maybe I've selected an entire function definition and I just want to
inner part of the function.

Instead of starting over with my visual selection. I can leave the right-end of
the visual selection where it is, hit `o` which will switch the moving end to
the other side, and then continue making adjustments from there.

I can always hit `o` again to switch it back to the original side.

See `:h v_o` for more details.
