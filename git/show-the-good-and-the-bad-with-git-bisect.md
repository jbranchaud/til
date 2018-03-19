# Show The Good And The Bad With Git Bisect

The [`git bisect`](https://git-scm.com/docs/git-bisect) command is a
powerful tool for tracking down a past commit where something verifiable
about the code changed -- whether it be visual or functional. After using
`git bisect` to traverse back and forth through your commit history, you may
be wondering where things stand.

The [`git bisect
log`](https://git-scm.com/docs/git-bisect#_bisect_log_and_bisect_replay)
command will show you each commit that has been inspected and whether you've
marked it as good or bad.

These records can be handy for double checking your work if you're worried
that you made a mistake along the way.
