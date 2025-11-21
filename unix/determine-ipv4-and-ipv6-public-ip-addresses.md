# Determine ipv4 And ipv6 Public IP Addresses

There are a number of ways to do this. The one that I've settled on is sending a
`curl` request to a public URL that was specifically set up to echo back the
public IP of the device making the request. There are many such URLs, but the
one that I tend to use is `ifconfig.io`.

When I run this as is, I get something like the following which you may
recognize as an _ipv6_ IP address.

```bash
$ curl ifconfig.io
2001:db8:3333:4444:5555:6666:7777:8888
```

This is because if ipv6 is available, like it is for me, `curl` is going to
prefer that.

Now, if I'm trying to track down specifically my ipv4 address, I can use the
`-4` flag (or `--ipv4`).

```bash
$ curl -4 ifconfig.io
73.23.45.157
```

Similarly, I could explicitly specify ipv6 with `-6` or `--ipv6`.

See `man curl` for more details.
