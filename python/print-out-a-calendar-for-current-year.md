# Print Out A Calendar For Current Year

While reading through Simon Willison's [CLI tools hidden in the Python standard
library](https://til.simonwillison.net/python/stdlib-cli-tools), I learned that
you can print out the entire calendar for the current year with a simple Python
one-liner. This uses the
[`calendar`](https://docs.python.org/3/library/calendar.html) module in Python's
standard library.

```bash
❯ python -m calendar
                                  2026

      January                   February                   March
Mo Tu We Th Fr Sa Su      Mo Tu We Th Fr Sa Su      Mo Tu We Th Fr Sa Su
          1  2  3  4                         1                         1
 5  6  7  8  9 10 11       2  3  4  5  6  7  8       2  3  4  5  6  7  8
12 13 14 15 16 17 18       9 10 11 12 13 14 15       9 10 11 12 13 14 15
19 20 21 22 23 24 25      16 17 18 19 20 21 22      16 17 18 19 20 21 22
26 27 28 29 30 31         23 24 25 26 27 28         23 24 25 26 27 28 29
                                                    30 31

       April                      May                       June
Mo Tu We Th Fr Sa Su      Mo Tu We Th Fr Sa Su      Mo Tu We Th Fr Sa Su
       1  2  3  4  5                   1  2  3       1  2  3  4  5  6  7
 6  7  8  9 10 11 12       4  5  6  7  8  9 10       8  9 10 11 12 13 14
13 14 15 16 17 18 19      11 12 13 14 15 16 17      15 16 17 18 19 20 21
20 21 22 23 24 25 26      18 19 20 21 22 23 24      22 23 24 25 26 27 28
27 28 29 30               25 26 27 28 29 30 31      29 30

        July                     August                  September
Mo Tu We Th Fr Sa Su      Mo Tu We Th Fr Sa Su      Mo Tu We Th Fr Sa Su
       1  2  3  4  5                      1  2          1  2  3  4  5  6
 6  7  8  9 10 11 12       3  4  5  6  7  8  9       7  8  9 10 11 12 13
13 14 15 16 17 18 19      10 11 12 13 14 15 16      14 15 16 17 18 19 20
20 21 22 23 24 25 26      17 18 19 20 21 22 23      21 22 23 24 25 26 27
27 28 29 30 31            24 25 26 27 28 29 30      28 29 30
                          31

      October                   November                  December
Mo Tu We Th Fr Sa Su      Mo Tu We Th Fr Sa Su      Mo Tu We Th Fr Sa Su
          1  2  3  4                         1          1  2  3  4  5  6
 5  6  7  8  9 10 11       2  3  4  5  6  7  8       7  8  9 10 11 12 13
12 13 14 15 16 17 18       9 10 11 12 13 14 15      14 15 16 17 18 19 20
19 20 21 22 23 24 25      16 17 18 19 20 21 22      21 22 23 24 25 26 27
26 27 28 29 30 31         23 24 25 26 27 28 29      28 29 30 31
                          30
```

You cannot tell in this markdown code block, but in the terminal the current day
gets highlighted.

There is also an _output type_ flag (`-t`) where `html` can be specified instead
of the default of `text`. The `html` version will spit a bunch of markup out
into the terminal. Instead, I can encode that output with `base64` and then open
it as a `date:text` URL in Chrome like so:

```bash
❯ open -a "Google Chrome" "data:text/html;base64,$(python -m calendar -t html | base64)"
```

Unfortunately, that gets no default styles. Everything is scrunched together
making it hard to read. What if I were to use `sed` to inject some styles that
make for much better default styling?

```bash
❯ open -a "Google Chrome" "data:text/html;base64,$(
  python -m calendar -t html \
    | sed 's|<link[^>]*/>|<style>body{font-family:system-ui;margin:2rem}table.year{border-spacing:1.5rem;margin:auto}table.month td{text-align:right;padding:.35rem .5rem}</style>|' \
    | base64
)"
```

That's easier to read and fits nicely on a single sheet of paper if printed.

See `python -m calendar -h` for more details.
