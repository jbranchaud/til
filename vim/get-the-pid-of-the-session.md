# Get The pid Of The Session

Your current Vim session is a process running on your machine. That means
that this session is tied to a particular process id, _pid_.

Want to know what the pid is?

```vim
:echo getpid()
```

This will echo the pid of your current Vim session.

See `:h getpid()` for more details.
