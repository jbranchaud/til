# Clear The Screen In psql

The `psql` interactive terminal does not have a built-in way of clearing the
screen. What I usually do if I really need the screen cleared is quit, run
`clear` from the shell, and then open a new `psql` session. This is
unnecessary though. Instead, we can use the `\!` command to execute a shell
command, in this case, the `clear` command.

```
> \! clear
```

This clears the screen in one step and keeps our current session running.

See the [psql
docs](http://www.postgresql.org/docs/current/static/app-psql.html) for more
details.
