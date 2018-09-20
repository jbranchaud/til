# Find The Process Using A Specific Port

The `netstat` utility is often recommended for finding the PID (process ID)
bound to a specific port. Unfortunately, Mac's version of netstat does not
support the `-p` (process) flag. Instead, you'll want to use the `lsof`
utility.

```bash
$ sudo lsof -i tcp:4567
```

Running this will produce a nicely formatted response that tells you several
pieces of information about the process bound to `:4567` including the PID.

[source](https://stackoverflow.com/questions/3855127/find-and-kill-process-locking-port-3000-on-mac)
