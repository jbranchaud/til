# Gracefully Exit A Script With Trap

With `trap` you can intercept signals that would cause your script to exit and
then inject some additional behavior. Perhaps you want to make sure the script
cleans up after itself before it exists.

During this script's execution, it creates a file in the filesystem. It would
be nice to make sure that no matter path this script ends up down that it will
clean up after itself as it exits. We set up a `trap` that looks for the `EXIT`
signal to do this.

```bash
# Set up trap
trap 'echo "Cleaning up temp files"; rm -f *.tmp' EXIT

# Create temporary file
echo "test data" > work.tmp

# Do some work
cat work.tmp

# Trap will clean up on exit
```

Whatever is in quotes is what the trap will execute when it is triggered. The
following one or more signals are what the trap listens for, in this case
`EXIT`.

[source](https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_12_02.html)
