# Check If The First Argument Is Given

In a shell script, you may want to check if an argument was given. Each
argument is referenced numerically with the `$` prefix, so the first argument
is `$1`. To check if the first argument is given, you can use the `-z` check.

```bash
if [ -z "$1" ]
  then
    echo "The first argument is missing"
    exit 1
fi
```

The `-z` checks if the argument is a zero-length string (so `""` or undefined
will be true). If it is missing, then we echo out a message and exit the
script. This is how I might fashion a script that requires the first argument.

[source](https://stackoverflow.com/questions/6482377/check-existence-of-input-argument-in-a-bash-shell-script)
