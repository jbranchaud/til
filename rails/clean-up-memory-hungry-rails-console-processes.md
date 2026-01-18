# Clean Up Memory Hungry Rails Console Processes

I noticed (using `htop`) that a remote server hosting a Rails app had most of
its RAM being actively consumed. This was hindering my ability to run a fresh
deploy because the deploy processes had to do a ton of memory swapping which
drastically slowed the whole thing down.

With some investigation, I discovered that most of the memory was being consumed
by a handful of `rails console` processes. I didn't have any known active `rails console` processes that I was using. That combined with the dates of these
processes starting way in the past suggested to me that these were abandoned
processes that hadn't been properly cleaned up.

```bash
server:~# ps aux | grep rails
32767     878915  0.0  0.0 1227160  936 pts/0    Ssl+  2025   0:03 /exec rails console
32767     878942  0.9  6.5 830996 261748 pts/0   Rl+   2025 249:51 ruby /app/bin/rails console
32767    3004097  0.0  0.0 1227160  692 pts/0    Ssl+  2025   0:04 /exec rails console
32767    3004129  0.9  6.4 834672 257228 pts/0   Dl+   2025 406:31 ruby /app/bin/rails console
32767    3048582  0.0  0.0 1227160  940 pts/0    Ssl+ Jan09   0:00 /exec rails console
32767    3048611  1.1  6.3 829936 253484 pts/0   Dl+  Jan09  60:50 ruby /app/bin/rails console
32767    3060033  0.0  0.0 1227160  944 pts/0    Ssl+  2025   0:04 /exec rails console
32767    3060063  0.9  6.5 838084 260812 pts/0   Rl+   2025 405:37 ruby /app/bin/rails console
root     3699372  0.0  0.0   7008  1300 pts/0    S+   15:51   0:00 grep --color=auto rails
server:~# ps aux | grep 'rails console' | awk '{sum+=$6} END {print sum/1024 " MB"}'
1014.64 MB
```

As we can see by tacking on this `awk` command, these processes are consuming
1GB of memory.

Each of these is a pair of processes. A parent process (`/exec rails console`)
that kicks off and supervises the memory-hungry child process (`ruby /app/bin/rails console`).

To free up this memory, I targeted each of the parent processes with a `kill`
command one by one. For example:

```bash
server:~# kill 878915
```

I suspect that I may have left the occasional terminal tab open with one of
these `rails console` processes running and the SSH connection was getting
killed without the `rails console` getting killed with it.
