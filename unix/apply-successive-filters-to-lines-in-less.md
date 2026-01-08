# Apply Successive Filters To Lines In Less

Let's say I've opened a large Rails log file with `less`:

```bash
$ less logs/development.log
```

I have an idea of what I'm looking for, but there is way more noise than signal.
I can start to filter out some of the noise. The `&` command starts a filter
prompt. If I start to filter by something like `INSERT INTO`, then a ton of
lines disappear leaving just those matching that pattern.

Scrolling through the current set of lines, I start to have a better idea of
what I'm looking for, but there is still too much noise. I can apply an
additional successive filter on the remaining lines by hitting `&` again and
entering in another pattern -- e.g. `GoodJob`.

Now I only see lines that contain both `INSERT INTO` and `GoodJob` somewhere in
them.

As `less` puts it:

> Multiple & commands may be entered, in which case only lines which match all
> of the patterns will be displayed.

If I want to undo all the filtering, I just need to enter an empty `&` filter
prompt and it will reset things back to displaying all lines.

> If pattern is empty (if you type & immediately followed by ENTER), any
> filtering is turned off, and all lines are displayed.

See `man less` for more details.
