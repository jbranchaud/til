# Display Free Disk Space

The `df` utility is a handy way to display the free disk space available on
on a specific file system or all mounted file systems.

Use `df` with the `-h` flag to display the disk space usage and availability
in a human-readable format.

Here is the output from a linode box of mine:

```bash
df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/xvda        20G  3.8G   16G  20% /
none            4.0K     0  4.0K   0% /sys/fs/cgroup
devtmpfs        994M  4.0K  994M   1% /dev
none            200M  196K  199M   1% /run
none            5.0M     0  5.0M   0% /run/lock
none            996M     0  996M   0% /run/shm
none            100M     0  100M   0% /run/user
```

h/t Josh Davey
