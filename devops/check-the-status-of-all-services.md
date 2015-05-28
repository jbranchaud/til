# Check The Status Of All Services

In a Linux environment, you can quickly check the status of a number of
different services. By running `[sudo] service --status-all`, the status
command will be invoked for all services under the `/etc/init.d/` directory.

So, if you want to check the status of something like `nginx` or `apache`,
just run `service --status-all` and find it in the list. The `-` symbol
means it isn't running, the `+` symbol means it is up, and the `?` symbol
means that it cannot determine the status.
