# Format And Print The Current Date And Time

If I run the `date` command from the terminal, I get output like the following:

```bash
$ date
Fri Jan 22 13:45:44 CST 2021
```

If I want to format the date output different, perhaps for inclusion in a shell
script, I can do something like this:

```bash
$ date +"%Y/%m/%d %H:%M:%S"
2021/01/22 13:47:55
```

Then I can incorporate that in a script like this:

```bash
now() {
  echo "Today: $(date +'%Y/%m/%d %H:%M:%S')"
}
```

This
[page](https://www.tutorialkart.com/bash-shell-scripting/bash-date-format-options-examples/)
includes some examples and a page of formatting options.
