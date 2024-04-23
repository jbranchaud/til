# List All Services Managed By Brew

Daemonized services, such as PostgreSQL, can be installed and managed with
Homebrew. Under the hood `brew` uses `launchctl` on Mac to manage these
services — i.e. starting, restarting, and stopping them.

Assuming you've already installed some services, you can run `brew services
list` to see what services there are and what their current status is.

```bash
$ brew services list
Name          Status  User       File
mailhog       none
mysql         none
postgresql@11 started jbranchaud ~/Library/LaunchAgents/homebrew.mxcl.postgresql@11.plist
postgresql@13 none
postgresql@16 none
unbound       none
```

This is the default behavior if you just run `brew services` without a subcommand.

This is helpful if you are, for instance, trying to see which PostgreSQL server
version you are currently running and which other ones are available to run. I
might then issue a `stop` to `postgresql@11` so that I can then `start` the
`postgresql@16` service.

See `brew services --help` for more details.
