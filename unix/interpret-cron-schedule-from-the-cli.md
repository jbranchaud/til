# Interpret Cron Schedule From The CLI

I encounter cron task schedules infrequently enough that I don't remember how
to reliably interpret them at a glance. So when I'm looking over some code and
I see something like `12 2,16 * * *`, I need to translate it to a
human-readable format.

I've typically opened up a browser tab to
[crontab.guru](https://crontab.guru/#12_2,16_*_*_*) for this. However, I did
just learn about a tool for getting the same information from the CLI.

With the [`hcron`](https://github.com/lnquy/cron) binary, I can pass in a
single cron schedule and get the same details right from my terminal.

```bash
$ hcron '12 2,16 * * *'
12 2,16 * * *: At 02:12 AM and 04:12 PM
```

I decided to clone this repo, build the binary from source (it is Go), and then
place the `hcron` binary in my `~/bin` directory which is on my path. Once I
did that, I could start using the command like above.
