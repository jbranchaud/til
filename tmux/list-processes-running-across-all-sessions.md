# List Processes Running Across All Session

I wanted an overview of all the processes running across all the tmux sessions
that I have running on my machine right now. The `list-panes` command (with the
`-a` flag) gives me a listing of all the panes across all session of the current
tmux server.

That output on its own isn't giving me quite the info I'm looking for though.
With the `-f` (_format_) flag, I can use variables available in that context
like `session_name`, `pane_pid`, and `pane_current_command`.

I can assemble the details I want into a command like this:

```bash
❯ tmux list-panes -a -F "#{session_name}:#{window_index}.#{pane_index} #{pane_pid} #{pane_current_command}"
PLP:1.1 62364 zsh
TIL:1.1 62345 nvim
TIL:1.2 65838 task
TIL:2.1 11428 tmux
client-app:1.1 62373 ssh
client-app:1.2 10796 zsh
client-app:1.3 63081 zsh
client-app:2.1 61115 overmind
client-app:3.1 82608 zsh
visualmode-dev:1.1 52237 zsh
```

This gives me the details I want, but I can take it a step further by piping it
to the `column` command to improve the formatting a little:

```bash
❯ tmux list-panes -a -F "#{session_name}:#{window_index}.#{pane_index} #{pane_pid} #{pane_current_command}" \
  | column -t
PLP:1.1             62364  zsh
TIL:1.1             62345  nvim
TIL:1.2             65838  task
TIL:2.1             11428  tmux
client-app:1.1      62373  ssh
client-app:1.2      10796  zsh
client-app:1.3      63081  zsh
client-app:2.1      61115  overmind
client-app:3.1      82608  zsh
visualmode-dev:1.1  52237  zsh
```

See `man tmux` and, in particular, the `FORMATS` section for more details.
