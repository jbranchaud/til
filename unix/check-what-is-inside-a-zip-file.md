# Check What Is Inside A Zip File

Before unzipping a file, it can be useful to check the contents. You can learn a
few things from doing this. First off, are all the files nested under some extra
top-level directory? How many files are in there? How big are certain files? Etc.

The `-l` flag to `unzip` can help answer these questions.

```bash
❯ unzip -l zipped-files.zip
Archive:  zipped-files.zip
  Length      Date    Time    Name
---------  ---------- -----   ----
        0  08-22-2026 08:54   files-to-zip/
       14  08-22-2026 08:54   files-to-zip/data.json
       38  08-22-2026 08:53   files-to-zip/notes.md
       14  08-22-2026 08:53   files-to-zip/hello.txt
---------                     -------
       66                     4 files
```

Notice that the first line is for `files-to-zip/` which tells us that everything
is nested under the top-level directory that was probably the target of the
`zip` command. Everything is organized into a table with labeled columns which
allows us to answer our questions and get a good idea of what is in there.

In my experience, zip files tend to have dozens to hundreds of files, so it is
even better to pipe the above to a pager like `less`. That way you can search
and navigate through everything that's in there.

See `man unzip` for more details.
