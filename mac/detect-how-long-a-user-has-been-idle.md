# Detect How Long A User Has Been Idle

The `ioreg` utility on MacOS dumps the I/O Kit registry tree. This lets us look
at the state of all hardware devices and drivers registered with I/O Kit.
Looking specifically at the Human Interface Device subsystem (`IOHIDSystem`), we
can find a handful of properties including the `HIDIdleTime`.

```bash
$ ioreg -c IOHIDSystem | awk '/HIDIdleTime/'
    | | |   "HIDIdleTime" = 91831000
```

That value is the number of nanoseconds since a human input device was last
interacted with. That is the amount of time the user (me) has been idle.

I can convert this to seconds, which is the small amount of time between me
hitting enter in the terminal and the command finding the idle time.

```bash
$ ioreg -c IOHIDSystem | awk '/HIDIdleTime/ {printf "%.2f seconds\n", $NF/1000000000}'
0.13 seconds
```

I can run this in `watch` to see the elapsed idle time increment.

```bash
watch -n 1 "echo -n 'Idle time: '; ioreg -c IOHIDSystem | awk '/HIDIdleTime/ {printf \"%.1f seconds\\n\", \$NF/1000000000}'"
```

After watching the _idle time_ increment for a bit, I can move the mouse and
watch it reset on the next `watch` loop.

This could be used as part of a script that takes certain actions after the user
has been idle for a while, like putting the display to sleep or stopping a time
tracker app.

There is a _lot_ going on in the `ioreg` output and it's hard to make sense of
hardly any of it. I found running `ioreg -c IOHIDSystem | less`, searching for
`IdleTime`, and browsing from there to be a good starting point.
