# Reset Target tslime Pane

The combination of [`tslime`](https://github.com/jgdavey/tslime.vim) and
[`turbux`](https://github.com/jgdavey/vim-turbux) makes running tests from
Vim in a tmux session as easy as a single key binding. One problem that can
arise from time to time is having `tslime` focused on an undesired tmux
window/pane combination. There is no binding to tell `tslime` that you'd
like to re-select the target window and pane.

I've often resorted to closing out of Vim in order to reset the prompt.
There is a better way and it doesn't require you to wipe out your Vim
session.

Just `unlet` the global Vim variable for the `tslime` plugin like so:

```
:unlet g:tslime
```

The next time you invoke `turbux` it will see that `g:tslime` isn't set and
will prompt you for a new window and pane combination.

h/t Josh Davey
