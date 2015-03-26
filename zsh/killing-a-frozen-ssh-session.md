# Killing A Frozen SSH Session

Whenever an SSH session freezes, I usually mash the keyboard in desperation
and then kill the terminal session. This can be avoided though. SSH will
listen for the following kill command:

```
~.<cr>
```

This will kill the frozen SSH session and leave you in the terminal where
you were before you SSH'd.

source: [Jack C.](http://hashrocket.com/team/jack-christensen)
