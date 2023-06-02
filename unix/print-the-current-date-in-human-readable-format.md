# Print The Current Date In Human-Readable Format

The `date` utility by default does a good job of displaying the current date in
a human-readable format.

```bash
❯ date
Fri Jun  2 11:30:03 CDT 2023
```

It has some additional info like the time and timezone.

If I just want to see the date with the day of the week, I can call `date` with
a format string that uses special identifiers for each part of the date. This
gives me control over exactly how it is displayed. For example, the following
format string works for my purposes.

```bash
❯ date '+%A %B %d, %Y'
Friday June 02, 2023
```

The `+` indicates that it is a user-specified format string and the rest of the
special identifiers are defined by `strftime`.

See `man date` and `man strftime` for more details.
