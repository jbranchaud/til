# List Parent pid With ps

The `ps` command, which stands for `process status`, is a great way to find
different processes running on a machine. Information like their `pid`
(_process id_) is included. If you are tracking down a process to kill and
find that that process is an unkillable zombie, then you may need to
simultaneously kill the process' parent as well.

So, you'll need the parent `pid` as well. You can get both the `pid` and the
parent `pid` of a process by including the `-f` flag with `ps`.

You may also want to include the `-e` flag to make sure that information
about other users' processes is included in the results.
