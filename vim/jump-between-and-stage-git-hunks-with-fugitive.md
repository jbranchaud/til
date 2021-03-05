# Jump Between And Stage Git Hunks With Fugitive

Once you [open vim-fugitive's git summary
window](open-the-fugitive-git-summary-window.md), you'll see a listing of the
tracked files with unstaged changes. Each of those files is made up of one or
more _hunks_—a semi-contiguous chunk of changes in a Git diff.

You can jump forward and backward through these hunks with `]c` and `[c`,
respectively. If the inline diff view of a given file has not already been
expanding, these navigational keybindings will auto-expand it.

With the cursor over the heading of a particular hunk, you can hit `s`
(assuming you're looking at unstaged changes) to _stage_ the entire hunk.
Similarly, if the cursor is over the hunk heading of a change in the staged
area, you can hit `u` to unstage that entire hunk.

For more details and a visual walkthrough, [check out this screencast on
staging commits within Vim](https://www.youtube.com/watch?v=41OI6pszvv0).
