# Count The Lines In A CSV Where A Column Is Empty

The [`xsv` utility](https://github.com/BurntSushi/xsv) is a fast way to analyze
and work with CSV files from the command line.

With the `search` subcommand, I can seach for lines that match a pattern and
even narrow that search to focus on a selected column.

For instance, to search for any lines where column 3 is empty:

```
$ xsv search -s 3 '^$' data.csv
```

The `-s 3` narrows the search to just column 3. The `'^$'` regex pattern
matches on cells where there is the start character (`^`) and end character
(`$`) with nothing in between, hence empty.

I can then pipe that to `wc -l` to get a count of the number of empty lines.

```
$ xsv search -s 3 '^$' data.csv | wc -l
```

See `xsv search --help` for more details.
