# Get Matching Filenames As Output From Grep

Standard use of the [`grep`
command](http://man7.org/linux/man-pages/man1/grep.1.html) outputs the lines
that match the specified pattern. You can instead output just the names of
the files where those matches occur. To do this, include the `-l` flag.

```bash
$ grep -Rl hashrocket .
./elixir/run-exunit-tests-in-a-deterministic-order.md
./git/show-file-diffs-when-viewing-git-log.md
./git/single-key-presses-in-interactive-mode.md
./internet/enable-keyboard-shortcuts-in-gmail.md
...
```

This recursive grep finds all the files where `hashrocket` appears. It only
looks for the first match in a file, so each file will only be listed once
even if there may have been multiple matches.

See `man grep` for more details.
