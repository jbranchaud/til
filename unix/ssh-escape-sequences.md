# SSH Escape Sequences

In [Killing A Frozen SSH Session](killing-a-frozen-ssh-session.md), I talked
about an escape sequence for breaking out of an SSH session when the pipe
has been broken. This isn't the only SSH escape sequence though. To see the
others, hit `<Enter>~?`. This displays a help list with all the other escape
sequences.

```
> ~?
Supported escape sequences:
 ~.   - terminate connection (and any multiplexed sessions)
 ~B   - send a BREAK to the remote system
 ~C   - open a command line
 ~R   - request rekey
 ~V/v - decrease/increase verbosity (LogLevel)
 ~^Z  - suspend ssh
 ~#   - list forwarded connections
 ~&   - background ssh (when waiting for connections to terminate)
 ~?   - this message
 ~~   - send the escape character by typing it twice
(Note that escapes are only recognized immediately after newline.)
```

h/t Josh Davey
