# Prevent Sleep With The Caffeinate Command

MacOS has a built-in utility `caffeinate` that can programatically prevent your
machine from sleeping. There are two kinds of sleep that it can prevent via
_assertions_.

> caffeinate creates assertions to alter system sleep behavior.

The two kinds of sleep behavior are _display sleep_ and _system idle sleep_. An
assertion to prevent display sleep can be created with `-d` and system idle
sleep with `-i`.

We can combine those to prevent both and then specify a duration (_timeout_)
with `-t` (with a value in seconds).

```bash
caffeinate -d -i -t 600
```

This creates assertions with 10 minute timeouts for both display and system idle
sleep.

The `caffeinate` command is blocking, so if you want to start it in the
background, you can do that like so:

```bash
caffeinate -d -i -t 600 &
```

See `man caffeinate` for more details.
