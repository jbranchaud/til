# Last Argument Of The Last Command

You can use `!$` as a way to reference the last argument in the last
command. This makes for an easy shortcut when you want to switch out
commands for the same long file name. For instance, if you just ran `cat` on
a file to see its contents

```bash
$ cat /Users/jbranchaud/.ssh/config
```

and now you want to edit that file. You can just pass `!$` to the `vim`
command:

```bash
$ vim !$
```

Hit enter or tab to get the full command:

```bash
$ vim /Users/jbranchaud/.ssh/config
```

h/t Dorian Karter
