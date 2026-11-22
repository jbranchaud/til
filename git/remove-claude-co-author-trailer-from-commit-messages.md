# Remove Claude Co-Author Trailer From Commit Messages

When you have a Claude Code session create a commit, it will include a
[trailer](https://alchemists.io/articles/git_trailers) at the end of the commit
message with co-authorship details.

Here is an example from a recent commit:

```
commit 68e1791fa9c2dc42cca5ba73ba4d81299f07da81
Author: jbranchaud <jbranchaud@gmail.com>
Date:   Thu, 19 Nov 2026 16:51:34 -0600

    Upgrade to Ruby 4.0.10

    Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
```

Let's say I'm using Claude to create commits, but I don't want the trailer
included. I can retroactively remote it from any of the commits on the current
feature branch with the following command.

```bash
git rebase -r $(git merge-base main HEAD) \
  --exec 'git log -1 --format=%B | sed "/^Co-Authored-By: Claude/d" | git commit --amend -S --reset-author -F -'
```

The first part of that `$(git merge-base main HEAD)` finds the SHA of the common
parent between the current branch and `main`. From that reference point, it then
does a `rebase` with `--exec` on each commit between there and `HEAD`.

The `--exec` runs a series of commands that get piped into one another where the
message for each commit has any `Co-Authored-By: Claude` line removed from it
and is then amended to the original commit.

The `--reset-author` portion of the `git commit --amend` will ensure that each
commits author gets reset to the current author that is configured with `git`.
The `-F -` tells the command to read the amended commit message from `stdin`
which is how it works with being piped from the `sed` command.
