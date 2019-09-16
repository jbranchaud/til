# Figure Out The Week Of The Year From The Terminal

Want to know what week of the year we are currently in? You can use the
[`date`](http://man7.org/linux/man-pages/man1/date.1.html) utility to figure it
out.

```bash
$ date +%V
```

The `%V` is a formatting directive with this description:

> ISO week number, with Monday as first day of week (01..53)

[source](https://stackoverflow.com/questions/3237882/get-week-of-year-from-day-of-year)
