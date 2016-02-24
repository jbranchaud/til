# List The Statuses Of All Upstart Jobs

To see a list of all known upstart jobs and their statuses, use the
following command:

```bash
$ initctl list
...
console stop/waiting
mounted-run stop/waiting
acpid start/running, process 2927
checkfs.sh start/running
checkroot-bootclean.sh start/running
kmod stop/waiting
mountnfs.sh start/running
nginx stop/waiting
plymouth-stop stop/waiting
rcS stop/waiting
ufw start/running
...
```

It will tell you for each job if it is stopped or started.

See `man initctl` for more details.

h/t Josh Davey
