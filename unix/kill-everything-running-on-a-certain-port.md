# Kill Everything Running On A Certain Port

You can quickly kill everything running on a certain port with the following
command.

```bash
sudo kill `sudo lsof -t -i:3000`
```

This gets a list of pids for all the processes and then kills them.

[source](http://stackoverflow.com/questions/9346211/how-to-kill-a-process-on-a-port-on-ubuntu)
