# Jump Between Changes In Git Diff View

I'm viewing a diff of changes to a large `db/structure.sql` file. Most of the
changes are single line edits and dispersed across the entire file. I can see
the green change markers showing up as an overlay to the scrollbar. However it
is hard to scroll directly to any given change because of how many lines are in
this file.

Instead I opened up the file in the Version Control/Git extension which shows a
_Working Copy_ diff. It's still hard to manually scroll to the specific changes.
This view does offer controls for jumping from one change to the next (and back
again). Up and Down arrow buttons appear at the top of the window for that
purpose.

There are also keybindings for this. `Option-F5` will jump to the next diff in
the current file. `Shift-Option-F5` will jump to the previous one.

These keybindings make it much easier to jump between changes in a massive file
like this so that I can quickly review everything before proceeding.

Note: I could have also switched over to the terminal and run `git diff --
db/structure.sql`. The above has the added benefit of being directly in the
context of the editor where I can make inline changes if needed.
