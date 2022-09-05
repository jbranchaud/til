# Occupy A Local Port With Netcat

The `netcat` (`nc`) utility can listen to a specific port on your local
machine. This, in effect, occupies that port. This is handy for a variety of
reasons. In my case, I find it useful for testing out a web server script that
can gracefully react to its desired port being occupied.

The `-l` flag is how you tell `nc` to listen. Then you specify `localhost` as
the host and whatever port you want to occupy after that.

```bash
$ nc -l localhost 5000
```

Now if I try to run my web server script for port `5000`, I see the `Address
already in use` error.

See `nc -h` for more details.

[source](https://twitter.com/jbrancha/status/1566820110366654474?s=20&t=HcUMm1aRXpEgCAzONhy34w)
