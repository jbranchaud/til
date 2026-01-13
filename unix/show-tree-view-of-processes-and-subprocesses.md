# Show Tree View Of Processes And Subprocesses

Though you can cobble together a command on a MacOS Unix system to output a
hierarchical tree view of a parent process and its descendent subprocesses, it
is easier to [`brew install pstree`](https://github.com/FredHucht/pstree) and
use that.

Here is what I see when I run it for a _pid_ that corresponds to a `tmux`
session that I have running locally:

```bash
❯ pstree 61690
-+= 61690 lastword tmux new-session -d -s TIL -c /Users/lastword/dev/jbranchaud/til
 |--= 63081 lastword /bin/zsh
 |-+= 11428 lastword zsh
 | \-+= 48511 lastword pstree 61690
 |   \--- 48512 root ps -axwwo user,pid,ppid,pgid,command
 |-+= 62345 lastword zsh
 | \--= 06031 lastword claude
 |--= 62364 lastword /bin/zsh
 |-+= 62373 lastword zsh
 | \--= 64407 lastword ssh my-app-staging
 |-+= 61115 lastword /bin/zsh
 | \-+= 61579 lastword overmind start -f Procfile.dev
 |   \--- 61586 lastword tmux -C -L overmind-my-app-abc123 new -n web -s my-app -P -F %overmind-process #{pane_id} web #{pane_pid} /var/folders/zc/abc123/T/overmin
 |--= 52237 lastword /bin/zsh
 |--= 82608 lastword /bin/zsh
 \--= 10796 lastword /bin/zsh
```

I was looking for a frozen `claude` process that was part of this session. And I
found it about halfway down that list -- `06031`. Now I can run `kill` on that
process as needed.

For some additional context, I initially found the _pid_ for the `tmux` session
by running `ps aux | grep tmux` and looking through those results.
