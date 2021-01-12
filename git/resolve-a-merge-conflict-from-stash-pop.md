# Resolve A Merge Conflict From Stash Pop

Occasionally when I've stashed some changes and then `stash pop` them back onto
me working tree, I'll end up with a merge conflict. Either some new commits or
other changes to the working tree are in conflict with what's in the stash. Git
tells me it's up to me to resolve it.

Running `git status`, I can see what files have merge conflicts. I can go and
resolve those now based on what I want the state of my working tree to be.

Running `git status`, I'll also note that the files from the stash not involved
in the conflict have been staged. I don' know why git stages those changes when
a merge conflict arises. When I `stash pop` and there is no merge conflict, git
leaves the changes on the working tree.

This has confused me more than a couple times. Is there anything I need to do
to complete or resolve the `stash pop`?

Nope. Resolving the conflicts in the affected files is all that needs to be
done. And since I'm generally not looking to create a commit at this point, I
_unstage_ the staged changes with `git reset HEAD`.
