# Show Current System Time And Settings

If you are accessing a remote server and viewing logs, you may want to know
what the current system time is. The `timedatectl` command can show the
current system date, time, and related settings.

```bash
$ timedatectl
       Local time: Di 2015-04-07 16:26:56 CEST
   Universal time: Di 2015-04-07 14:26:56 UTC
         RTC time: Di 2015-04-07 14:26:56
        Time zone: Europe/Berlin (CEST, +0200)
  Network time on: yes
 NTP synchronized: yes
  RTC in local TZ: no
```

This command can also be used to modify these settings.

[source](http://man7.org/linux/man-pages/man1/timedatectl.1.html)
