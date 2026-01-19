# Format And Display Small Amounts Of Columnar Data

In [_List Processes Running Across All (tmux)
Sessions](tmux/list-processes-running-across-all-sessions.md), I showed an
example of piping some data from `tmux` to the `column -t` command to nicely format
and display the columnar data as a table. By default is uses spaces as the
delimiter.

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

This can be useful for formatting data from all kinds of commands and tools.
Sometimes the columns of data are separated by something other than spaces. For
instance, here is some git branch information (for my [dotfiles
repo](https://github.com/jbranchaud/dotfiles)) separated by the `|` character.
To format that with `column`, I need to also include the `-s '|'` flag to
override the delimiter.

```bash
❯ git for-each-ref --format='%(refname:short)|%(authordate:short)|%(authorname)' refs/heads/ \
  | column -t -s '|'

claude/sync-dotfiles-011CUP87cRV6c51eEi3Chg99  2025-10-22  jbranchaud
jb/add-rhubarb-for-fugitive-github-browse      2025-11-02  jbranchaud
jb/fix-hardcoded-paths                         2025-11-02  jbranchaud
jb/set-nvim-to-default-manpager                2025-10-19  jbranchaud
main                                           2026-01-10  jbranchaud
master                                         2025-10-30  Dorian Karter
my-dotfiles                                    2025-11-01  jbranchaud
upstream-master                                2026-01-01  Dorian Karter
```
