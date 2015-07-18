# Replace A Character

Throughout the day I'll often find myself deleting a single character and
putting a different one in its place. I usually navigate over the target
character and hit `s` which removes the character under the cursor and puts
me in insert mode. From there I type the new character and hit escape to
return to normal node. This isn't the best way to perform such an edit
though. Vim has a command specifically for replacing a character. The `r`
command. It does essentially the same thing as my current approach but
instead of putting me in insert mode, it simply replaces the character and
leaves me in normal node.

See `:h r` for more details.
