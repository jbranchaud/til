# Reword A Commit Message With Fugitive

When you have the fugitive summary buffer (`:Gedit :`) open and there are
unpushed commits, you'll see them listed below the working tree and staging area
details. If you notice an issue with the wording of any of those commits, you
can initiate an interactive rebase to reword the commit from that window.

Navigate the cursor over that commit and then hit `rw` (for _reword_).

This will split open an interactive rebase buffer with `reword <SHA>`. Save that
buffer and the commit message will be opened into a buffer where it can be
amended, just like if you were to amend a commit with an interactive rebase from
the CLI.

The `rw` binding can be used in any fugitive view where commits are listed. For
instance run `:Git log`, navigate to any commit, and then hit `rw`.

See `:h fugitive_r` for details about all the rebase mappings.
