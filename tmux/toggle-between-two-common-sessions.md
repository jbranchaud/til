# Toggle Between Two Common Sessions

With certain projects, such as projects that involve separate frontend and
backend codebases, I use a separate tmux session for each. This means that for
certain tasks and features I find myself flipping back and forth between them
constantly.

This can get tedious with an approach like `<prefix> s` where you then have to
find and select the other session from the list.

A more efficient alternative is `<prefix> L` -- this takes you to the last
session. So, if you are in the `backend` session and had previously been in the
`frontend` session, then hitting `<prefix> L` will immediately place you in
`frontend`. Hitting that exact same binding a second time will take you right
back to `backend`.

See `man tmux` for more details.
