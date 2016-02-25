# Kill Other Connections To A Session

One of the best features of tmux is the ability for multiple people to
connect to the same session in order to pair. This can, however, sometimes
result in a extra session hanging around if someone forgets to detach. This
is no problem though because you can view and kill other connections.

Hit

```
<prefix>D
```

to open up an interactive list of all connections to the current session.
Then navigate over the one you want to kill and hit `enter`. If you are
viewing the connections but don't want to kill one, you can hit `q` to back
out.

h/t Josh Davey
