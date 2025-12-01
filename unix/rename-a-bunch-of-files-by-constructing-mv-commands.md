# Rename A Bunch Of Files By Constructing mv Commands

I downloaded a bunch of bank statements as PDFs. On the upside they all were
consistently named. On the downside they used an unhelpful date format. With a
date format that puts year before month before day, the files easily sort
alphanumerically. However, these filenames used a date format that put month
before day before year.

Here is a subset of the files

```bash
$ ls *.pdf
'012524 Statement.pdf'
'012725 Statement.pdf'
'022624 Statement.pdf'
'022625 Statement.pdf'
'032524 Statement.pdf'
'032525 Statement.pdf'
```

Notice they are named with `MMDDYY Statement.pdf`. I would instead like for them
to be named as `YYYY-MM-DD-statement.pdf`.

I can generate a series of `mv` statements that then get piped to `sh` which
_evaluates_ them. But first, let's do a dry run of a `sed` statement that
rearranges the date parts.

```bash
$ ls *.pdf | sed 's/\(..\)\(..\)\(..\) Statement\.pdf/mv "&" "20\3-\1-\2-statement.pdf"/'
mv "012524 Statement.pdf" "2024-01-25-statement.pdf"
mv "012725 Statement.pdf" "2025-01-27-statement.pdf"
mv "022624 Statement.pdf" "2024-02-26-statement.pdf"
mv "022625 Statement.pdf" "2025-02-26-statement.pdf"
mv "032524 Statement.pdf" "2024-03-25-statement.pdf"
mv "032525 Statement.pdf" "2025-03-25-statement.pdf"
```

The way this works is that all the `pdf` files in the current directly get
listed out. That gets piped to a `sed` statement that matches on capture groups
against the first three pairs of characters (the date parts) in the filenames.
It matches on the rest of the filename (` Statement.pdf`). This is then replaced
by a `mv `, the full match of the original filename (`&`), and then the new
filename made up of the rearranged date parts.

I can then pipe it to `sh` to run those `mv` commands.

```bash
$ ls *.pdf |
  sed 's/\(..\)\(..\)\(..\) Statement\.pdf/mv "&" "20\3-\1-\2-statement.pdf"/' |
  sh
```
