# List The Stack Of Remembered Directories

When you open a new Unix shell, you start in some directory, probably your
home (`~/`) directory. If you use `pushd` to navigate to different
directories, there is a paper trail of your movements, a listing of where
you've been.  You can view this listing of directories with the `dirs`
command.

```
$ dirs
~/
$ pushd code
$ dirs
~/code ~/
$ pushd /usr/bin
$ dirs
/usr/bin ~/code ~/
```

Each time you `pushd`, the directory you have moved to is pushed onto the stack of
visited directories. Alternatively, you can use the `popd` command to return
to the previous directory, removing the current directory from the stack.

[source](http://www.gnu.org/software/bash/manual/html_node/Directory-Stack-Builtins.html#Directory-Stack-Builtins)
