# Print DateTime Represented By Unix Timestamp

A lot of tools and systems use a Unix timestamp to represent a point in time.
It is the number of seconds since the Unix epoch (Jan 1, 1970). However, just
looking at a timestamp like `1623867544` doesn't tell a human much. I can't
mentally translate that to the date and time that it is representing.

The `date` utility can help. Give it the `-r` flag with the timestamp value (in
seconds) and it will display the date and time in a human-readable format.

```bash
❯ date -r '1623867544'
Wed Jun 16 13:19:04 CDT 2021
```

See `man date` for more details.
