# Delete Empty Files With Find

I was discussing a command with a colleague for finding and deleting empty files
from a given directory. This command involved a series of pipes and I probably
wouldn't have solved it too differently. I was curious what other ways there
were of doing such a task, so I asked Claude. The first option it came back with
taught me about two new-to-me flags that `find` supports.

First is the `-empty` flag which applies a filter on the results to files or
directories that are empty.

Second is the `-delete` flag which will delete found files and directories.

Those two can be combined to _delete_ any results that are _empty_. Then to
target just _files_, I can include the `-type f` flag. And if I want to prevent
it from recursing down some unexpected tree of directories, I could also add in
`-maxdepth 1`.

To delete all empty files in `specific-directory`, I can run the following:

```bash
❯ find ./specific-directory -maxdepth 1 -type f -empty -delete
```

My first thought for a command like this is that I will need to `xargs rm`, so
it's neat to know about the `-delete` flag in particular.

See `man find` for more details.
