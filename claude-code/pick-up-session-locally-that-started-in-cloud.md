# Pick Up Session Locally That Started In Cloud

I've been enjoying using _Claude Code_ from the iOS and MacOS apps for various
side tasks recently. For smaller things I can usually get most of the way there
from the app. And eventually I pull down the branch or have Claude create a PR
that I can review.

Sometimes I want to transfer the session onto my computer to pick up where it
left off for various reasons (e.g. I want the session to have access to some
local data or specific dependencies).

The `claude` CLI has a flag for that — `--teleport`.

> Resume a teleport session, optionally specify session ID

```
❯ claude --teleport

Select a session to resume (jbranchaud/still):

      Updated  Session Title
❯ 1. 21m ago  Blogmark link search modal
  2. 11h ago  Mobile feed reader margins
  3. 11h ago  Feed pagination with Pagy
  4. 1d ago   RSS feed highlights and annotations
  5. 1d ago   RSS feed categories
  6. 3d ago   Blogmarks image drag-and-drop upload

↑/↓ to select · Enter to confirm · Esc to cancel
```

This is similar to how `--resume` works, but it is for a session that was
previously running in the cloud.
