# View Nicely-Formatted CSV In Terminal

I'd just written and run a script to generate a CSV of data requested by a
stakeholder. Before sending it over to them, I wanted to briefly browse through
it to make sure the data passed a spot-check and that the way I structured
things looked reasonable.

There are a dozen ways I can view a CSV file on my machine, but I wasn't
interested in opening another program or navigating to the file in Finder.app.

I had generated the file in the terminal and I wanted to view it there.

The Rust-built [`csvlens`](https://github.com/YS-L/csvlens) CLI is just what I
was looking for.

```bash
$ csvlens data_report_20250627.csv
```

This shows the data spaced out with columns and rows and has a set of
keybindings that can be browsed with `?`.

I got this tool from `brew install csvlens`.
