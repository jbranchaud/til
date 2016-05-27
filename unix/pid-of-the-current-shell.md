# PID Of The Current Shell

`$` expands to the process ID of the shell. So, you can see the PID of the
current shell with `echo $$`.

```bash
> echo $$
36609

> zsh

> echo $$
45431

> exit

> echo $$
36609
```

See the `Special Paramaters` section of `man bash` for more details.

[source](http://stackoverflow.com/questions/21063765/get-pid-in-shell-bash)
